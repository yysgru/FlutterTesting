# CLEAN ARCHITECTURE WITH FLUTTER AND RIVERPOD AS STATE MANAGEMENT

## Explanation and project structure

In Flutter we still have the three main layers: Presentation, Domain and Data.

Inside the `lib` folder we will create another folder called `features` and inside EVERY FEATURE (a feature is a self-contained functionality of the app perceived as a unit by the user, e.g. authentication, profile, search...) we will have a domain, presentation and data layer.

But what if we have some logic or utility (such as input validation for example) that will be shared across different features? For that, we will create a `core` folder inside the `lib` folder as well. So the structure would be more or less like this:

```
lib/
  core/
  features/
    feature/
      domain/
      data/
      presentation/
```

In Flutter the presentation layer is composed by the Widgets themselves, views, etc. and the presentation logic holders (state management) such as Riverpod in this case (but could also be BLoC, ChangeNotifier, etc.). But with Clean Architecture the presentation logic holders won't do much by themselves, instead they'll delegate their job to the use cases in the domain layer and so on.

Presentation logic holder classes won't have a lot of logic — at most they will do some very simple input validation and that's it. The structure of the presentation layer will be:

```
pages/ (or views/)
providers/ (for Riverpod) / bloc/ etc.
widgets/ (reusable widgets that we don't want cluttering the page/view files)
```

The domain layer won't change much from Flutter to another framework. It will generally be in charge of the business logic and business objects (ENTITIES) and must be INDEPENDENT of any other layer. The "repository" sits on the edge between the Domain layer and the Data layer, and so, to make the domain layer actually independent we will use DEPENDENCY INVERSION (using abstract classes, since Dart doesn't support interfaces). This means the repository in the data layer will implement the abstract class, conforming to the so-called "contract", so that the domain layer truly doesn't care about what's going on behind the scenes in the data layer. The structure of the domain layer would be:

```
entities/
repositories/ (where the "contract" / abstract class of the repository goes)
usecases/
```

As said earlier, the data layer will implement the abstract classes defined in the domain layer, fulfilling their contract. It will also contain remote and local data sources. Usually you have one data source for fetching remote data from an API and another for local data (cached data, device sensors like GPS, local databases, etc.).

The domain layer outputs **entities**, but the data layer outputs **models**. Models are simple classes that extend entities and add data-conversion logic on top (e.g. `fromJson` / `toJson` methods), so that raw data from external sources gets converted into Dart objects. Since models are subclasses of entities, they can be cast to entities — keeping the domain layer clean of any data-layer concerns. The structure of the data layer would be:

```
datasources/
models/
repositories/ (implementations of the abstract repository contracts)
```

---

## Implementation order & key concepts

When we start coding the app we should always start from the **innermost layer outward**: Domain → Data → Presentation. This means: entities first, then repository contracts, then use cases, then data layer implementations, and finally the UI.

### Packages

```yaml
dependencies:
  get_it:
  flutter_riverpod:   # or bloc, depending on state management choice
  equatable:
  dartz:
  http:
  shared_preferences:

dev_dependencies:
  mockito:
  flutter_test:
    sdk: flutter
```

> Note: `connectivity` has been largely replaced by `data_connection_checker` (or similar packages) since `connectivity` doesn't actually guarantee real internet access on Android — a device can be connected to a Wi-Fi network with no internet and `connectivity` would still return "connected".

---

### Domain layer

#### Entities

Entities extend **Equatable**, which allows comparing two objects by their properties instead of by memory reference (the default Dart behavior). Other than that, they are plain classes:

```dart
class NumberTrivia extends Equatable {
  final String text;
  final int number;

  const NumberTrivia({required this.text, required this.number});

  @override
  List<Object> get props => [text, number];
}
```

Always model your entities based on the JSON response from the API — but only include the fields you actually need.

#### Failures

If something goes wrong during a request, we control that inside the **repository** using try-catch, and instead of letting exceptions propagate freely we return a **Failure object**. Unlike exceptions, you won't need to try-catch all over the codebase — failures are returned as regular return values.

Create an `error/` folder under `core/` with a `failure.dart` file. The base class is abstract and also extends Equatable:

```dart
abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];
}

// Concrete failures — one per exception type:
class ServerFailure extends Failure {}
class CacheFailure extends Failure {}
```

And in `core/error/exceptions.dart`, the raw exceptions thrown by data sources before being converted to failures:

```dart
class ServerException implements Exception {}
class CacheException implements Exception {}
```

#### Repository contract (abstract class)

The repository abstract class lives in `domain/repositories/`. It defines the contract that the data layer must fulfill. Return types use `Either<Failure, Entity>` from the `dartz` package — left side is always the failure, right side is the success:

```dart
abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcrete(int number);
  Future<Either<Failure, NumberTrivia>> getRandom();
}
```

#### Use cases

Each use case is a class with a single callable method (Dart supports callable classes via the `call` method, so you can invoke a use case like a function). To enforce a consistent interface across all use cases, create a base abstract class in `core/usecases/usecase.dart`:

```dart
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
```

Use cases that don't need parameters use a `NoParams` class (also defined in that file):

```dart
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
```

A concrete use case looks like this:

```dart
class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) {
    return repository.getConcrete(params.number);
  }
}

class Params extends Equatable {
  final int number;
  const Params({required this.number});

  @override
  List<Object> get props => [number];
}
```

---

### Data layer

#### Models

Models extend their corresponding entity and add JSON conversion logic. The domain layer stays clean of any serialization concerns:

```dart
class NumberTriviaModel extends NumberTrivia {
  const NumberTriviaModel({required String text, required int number})
      : super(text: text, number: number);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
      text: json['text'],
      // Cast to num first to handle both int and double from JSON
      number: (json['number'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'text': text, 'number': number};
  }
}
```

> Important: some APIs return integers in scientific notation (e.g. `1e+40`) which Dart parses as `double`. Always cast through `num` before converting to `int`.

#### Data sources

Data sources throw exceptions (not failures — that conversion is the repository's job). There are usually two: remote and local.

```dart
abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcrete(int number);
  Future<NumberTriviaModel> getRandom();
}

abstract class NumberTriviaLocalDataSource {
  Future<NumberTriviaModel> getLastNumberTrivia(); // throws CacheException if empty
  Future<void> cacheNumberTrivia(NumberTriviaModel trivia);
}
```

The remote implementation uses the `http` package and passes `Content-Type: application/json` as a header to get a JSON response instead of plain text. The local implementation uses `shared_preferences`, storing the model as a JSON string.

#### Repository implementation

The repository implementation (in `data/repositories/`) is the brain of the data layer. It decides whether to hit the remote API or the local cache, and converts exceptions into failures:

```dart
class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberTrivia>> getConcrete(int number) async {
    if (await networkInfo.isConnected) {
      try {
        final model = await remoteDataSource.getConcrete(number);
        await localDataSource.cacheNumberTrivia(model);
        return Right(model);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final model = await localDataSource.getLastNumberTrivia();
        return Right(model);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
```

---

### Dependency injection (the "composition root")

The equivalent of ASP.NET's composition root or React Native's container is a file called `injection_container.dart` at the root of `lib/`. It uses `get_it` as a service locator:

```dart
final sl = GetIt.instance;

Future<void> init() async {
  // ─── Features ────────────────────────────────────────
  // Providers/Notifiers — registered as FACTORY because they hold state
  // and may need to be disposed (e.g. closing streams).
  // If registered as singleton, navigating away, disposing it and coming
  // back would give you the same instance with already-closed streams.
  sl.registerFactory(() => NumberTriviaNotifier(
    getConcrete: sl(),
    getRandom: sl(),
  ));

  // Use cases — registered as lazy singletons (stateless, no disposal needed)
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  // Repository — register the CONTRACT type, resolve to the IMPLEMENTATION.
  // This is the equivalent of services.AddScoped<IRepo, RepoImpl>() in ASP.NET.
  // The generic type parameter is the abstract class (domain layer),
  // the factory returns the concrete implementation (data layer).
  sl.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources — same pattern: register by contract, resolve to impl
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // ─── Core ─────────────────────────────────────────────
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // ─── External ─────────────────────────────────────────
  // SharedPreferences is async, so we must await it before registering
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
```

Call `init()` from `main.dart` before `runApp()`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}
```

> **Factory vs Singleton:** use `registerFactory` for anything that holds state and needs disposal (providers, BLoCs). Use `registerLazySingleton` for everything else (use cases, repositories, data sources) — they are stateless and safe to share as a single instance.

---

### Presentation layer (connecting everything with Riverpod)

The UI never touches use cases directly. The provider/notifier receives the use cases via constructor (injected by `get_it`) and the UI only reads the provider — the same pattern as injecting services into controllers in ASP.NET:

```dart
// providers/number_trivia_provider.dart
final numberTriviaProvider = StateNotifierProvider<NumberTriviaNotifier, NumberTriviaState>(
  (ref) => sl<NumberTriviaNotifier>(),
);

class NumberTriviaNotifier extends StateNotifier<NumberTriviaState> {
  final GetConcreteNumberTrivia getConcrete;
  final GetRandomNumberTrivia getRandom;

  NumberTriviaNotifier({required this.getConcrete, required this.getRandom})
      : super(NumberTriviaInitial());

  Future<void> fetchConcrete(int number) async {
    state = NumberTriviaLoading();
    final result = await getConcrete(Params(number: number));
    // fold() handles both sides of Either without try-catch:
    // left = failure, right = success
    result.fold(
      (failure) => state = NumberTriviaError(_mapFailureToMessage(failure)),
      (trivia)  => state = NumberTriviaLoaded(trivia),
    );
  }
}
```

The `fold` method on `Either` is how you handle both sides — left (failure) and right (success) — without try-catch anywhere in the presentation layer.

---

### Testing approach (TDD)

The testing folder mirrors the `lib/` structure. The key ideas:

- **Mock dependencies** with `mockito` so you can test each class in isolation without hitting real APIs or databases.
- **Fixtures**: store example JSON responses in `test/fixtures/` as `.json` files and read them with a simple helper. This makes tests independent of internet connectivity.
- **Test order** follows the same inside-out order as implementation: domain → data → presentation.

```dart
// test/fixtures/fixture_reader.dart
String fixture(String name) => File('test/fixtures/$name').readAsStringSync();
```
