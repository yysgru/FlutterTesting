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
