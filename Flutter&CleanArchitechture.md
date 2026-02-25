# CLEAN ARCHITECHTURE WITH FLUTTER AND RIVERPOD AS STATE MANAGEMENT

Explanation and project structure:
-
  - In flutter we still have the three main layers: Presentation, Domain and Data.
  - Inside the "lib" folder we will create anohter folder called "features" and inside EVERY
  FEATURE we will have a domain, presentation and data layer.
  - But what if we have a feature (such as "settings" for example) that will be used
  in other different features? For that, we will create a "core" folder inside the "lib"
  folder as well.

So the structure would be more or less like this:
-
  - lib/
       core/
       features/
         feature/
            domain/
            data/
            presentation/

In flutter the presentation layer is composed by the Widgets themselves, views, etc. and the
presentation logic holders (state management) such as Riverpod in this case (but could also be
BLoC, ChangeNotifer, etc..). But with Clean Architechture the presentation logic holders
won't do much by themselves, instead they'll delegate their job to the use cases in the domain
layer and so on.

  - Presentation logic holders classes won't have a lot of logic, at most they will have a very
    simple input validation and that's it.

To continue with the structure we will create three different folders in the presentation layer
which will be: 
-

  - pages/views/
  - providers/ (for riverod)/bloc/etc.
  - widgets/ (just in case we want some widget to be outside of the views and then called inside)

The domain layer won't change much from Flutter to another framework, it will generally be in
charge of the business logic and business objects (ENTITIES) and also INDEPENDENT of any other
layer. 

The "repositories" class is on the edge of the Domain layer and the Data layer and so, to make
the domain layer actually independent we will use the DEPENDENCY INVERSION (using abstract classes
instead of INTERFACES since Dart doesn't support interfaces).

To do this the repository in the data layer will have to implement the abstract class (just like
what happened with interfaces) so it'll have to conform to the so called "contract" so that
domain can really not care about what's going on in the data layer and becomes actually an independent
layer.

Now for the structure of the domain layer we would have:
-
  - entities/ (self explanatory)
  - repositories/ (this is where the "contract" or the abstract class of repositories will go)
  - usecases/

As said earlier the data layer will implement the abstract classes created in the domain so
that they'll just have to fulfill the contract defined by domain, it will also contain
remote data sources and local datasources. Usually you have one data source for getting the
remote data from the API and then you also have another data source for getting the local
data. Local datasources are where you would have your GPS location cone or THE DATABASE DATA.

The domain layer outputs entities BUT not the data layer, the data layer outputs something called
"models" (although it doesn't matter what you call them) which function is to convert the raw data
obtained from the data sources (such as JSON) into Dart objects (they will only have a toJSON and
fromJSON methods).

Finally the structure of the data layer would be something like this:
-
  - datasource/
  - models/
  - repositories/ (for the implementation of the repositories)
