// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
///ahora que la lista está hecha el provider tiene que
///proveer de productos a los widgets de la aplicacion
///                     Viene del paquete instalado de riverpod
///                     Es el tipo de provider más básico que se puede tener
///                     y solo provee de lectura a cualquier widget que pueda
///                     consumirlo. Para hacer esto se necesita pasar una
///                     función como argumento al provider y esa función
///                     necesita un argumento llamado ref. En la función se debe
///                     devolver el valor que queremos proveer
/*final productProvider = Provider((ref) {
  //en este caso es la lista de productos. le va a proveer a cualquier widget
  //que quiera consumir este provider en el futuro un permiso de LECTURA
  return allProducts;
});*/
//este por ejemplo provee de unos productos de los cuales su precio sea menor que 50
/*final reducedProductsProvider = Provider((ref) {
  //no devuelve una lista si no se le pone tolist, devuelve un iterable
  return allProducts.where((p) => p.price < 50).toList();
});*/
//providers generados
//esto le dice a riverpod que queremos generar un provider

@ProviderFor(products)
final productsProvider = ProductsProvider._();

///ahora que la lista está hecha el provider tiene que
///proveer de productos a los widgets de la aplicacion
///                     Viene del paquete instalado de riverpod
///                     Es el tipo de provider más básico que se puede tener
///                     y solo provee de lectura a cualquier widget que pueda
///                     consumirlo. Para hacer esto se necesita pasar una
///                     función como argumento al provider y esa función
///                     necesita un argumento llamado ref. En la función se debe
///                     devolver el valor que queremos proveer
/*final productProvider = Provider((ref) {
  //en este caso es la lista de productos. le va a proveer a cualquier widget
  //que quiera consumir este provider en el futuro un permiso de LECTURA
  return allProducts;
});*/
//este por ejemplo provee de unos productos de los cuales su precio sea menor que 50
/*final reducedProductsProvider = Provider((ref) {
  //no devuelve una lista si no se le pone tolist, devuelve un iterable
  return allProducts.where((p) => p.price < 50).toList();
});*/
//providers generados
//esto le dice a riverpod que queremos generar un provider

final class ProductsProvider
    extends $FunctionalProvider<List<Product>, List<Product>, List<Product>>
    with $Provider<List<Product>> {
  ///ahora que la lista está hecha el provider tiene que
  ///proveer de productos a los widgets de la aplicacion
  ///                     Viene del paquete instalado de riverpod
  ///                     Es el tipo de provider más básico que se puede tener
  ///                     y solo provee de lectura a cualquier widget que pueda
  ///                     consumirlo. Para hacer esto se necesita pasar una
  ///                     función como argumento al provider y esa función
  ///                     necesita un argumento llamado ref. En la función se debe
  ///                     devolver el valor que queremos proveer
/*final productProvider = Provider((ref) {
  //en este caso es la lista de productos. le va a proveer a cualquier widget
  //que quiera consumir este provider en el futuro un permiso de LECTURA
  return allProducts;
});*/
//este por ejemplo provee de unos productos de los cuales su precio sea menor que 50
/*final reducedProductsProvider = Provider((ref) {
  //no devuelve una lista si no se le pone tolist, devuelve un iterable
  return allProducts.where((p) => p.price < 50).toList();
});*/
//providers generados
//esto le dice a riverpod que queremos generar un provider
  ProductsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'productsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$productsHash();

  @$internal
  @override
  $ProviderElement<List<Product>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Product> create(Ref ref) {
    return products(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Product> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Product>>(value),
    );
  }
}

String _$productsHash() => r'48c888b003496256deeeaee20811324bf5f8ab85';

@ProviderFor(reducedProducts)
final reducedProductsProvider = ReducedProductsProvider._();

final class ReducedProductsProvider
    extends $FunctionalProvider<List<Product>, List<Product>, List<Product>>
    with $Provider<List<Product>> {
  ReducedProductsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'reducedProductsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reducedProductsHash();

  @$internal
  @override
  $ProviderElement<List<Product>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Product> create(Ref ref) {
    return reducedProducts(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Product> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Product>>(value),
    );
  }
}

String _$reducedProductsHash() => r'9a406a943f12456be0238eff20522cce8b5859fd';
