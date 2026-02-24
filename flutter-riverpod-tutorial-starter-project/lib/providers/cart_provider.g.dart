// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
///si queremos que al consumir el provider los widgets puedan hacer cambios
///necesitamos notificar sobre los cambios (notifier provider)
///ESTA CLASE NO ES UN PROVIDER. ES UNA CLASE, EL NOTIFIER PROVIDER USA LA CLASE
///Y EL STATE QUE SE INDICA AQUÍ
///Lo usará la vista del carrito y en la vista inicial porque se añadirá un botón
///debajo de cada item para añadirlo a la cesta o eliminarlo de la cesta.

@ProviderFor(CartNotifier)
final cartProvider = CartNotifierProvider._();

///si queremos que al consumir el provider los widgets puedan hacer cambios
///necesitamos notificar sobre los cambios (notifier provider)
///ESTA CLASE NO ES UN PROVIDER. ES UNA CLASE, EL NOTIFIER PROVIDER USA LA CLASE
///Y EL STATE QUE SE INDICA AQUÍ
///Lo usará la vista del carrito y en la vista inicial porque se añadirá un botón
///debajo de cada item para añadirlo a la cesta o eliminarlo de la cesta.
final class CartNotifierProvider
    extends $NotifierProvider<CartNotifier, Set<Product>> {
  ///si queremos que al consumir el provider los widgets puedan hacer cambios
  ///necesitamos notificar sobre los cambios (notifier provider)
  ///ESTA CLASE NO ES UN PROVIDER. ES UNA CLASE, EL NOTIFIER PROVIDER USA LA CLASE
  ///Y EL STATE QUE SE INDICA AQUÍ
  ///Lo usará la vista del carrito y en la vista inicial porque se añadirá un botón
  ///debajo de cada item para añadirlo a la cesta o eliminarlo de la cesta.
  CartNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'cartProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$cartNotifierHash();

  @$internal
  @override
  CartNotifier create() => CartNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<Product> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<Product>>(value),
    );
  }
}

String _$cartNotifierHash() => r'9c5b34f84dff825cd9e01f5573f2e124a21f4d95';

///si queremos que al consumir el provider los widgets puedan hacer cambios
///necesitamos notificar sobre los cambios (notifier provider)
///ESTA CLASE NO ES UN PROVIDER. ES UNA CLASE, EL NOTIFIER PROVIDER USA LA CLASE
///Y EL STATE QUE SE INDICA AQUÍ
///Lo usará la vista del carrito y en la vista inicial porque se añadirá un botón
///debajo de cada item para añadirlo a la cesta o eliminarlo de la cesta.

abstract class _$CartNotifier extends $Notifier<Set<Product>> {
  Set<Product> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Set<Product>, Set<Product>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Set<Product>, Set<Product>>,
        Set<Product>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

///Antes era solo provider pero ahora no solo provee un valor de lectura sino que
///provee también una instancia de la clase de arriba
/*final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});*/

@ProviderFor(cartTotal)
final cartTotalProvider = CartTotalProvider._();

///Antes era solo provider pero ahora no solo provee un valor de lectura sino que
///provee también una instancia de la clase de arriba
/*final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});*/

final class CartTotalProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  ///Antes era solo provider pero ahora no solo provee un valor de lectura sino que
  ///provee también una instancia de la clase de arriba
/*final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});*/
  CartTotalProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'cartTotalProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$cartTotalHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return cartTotal(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$cartTotalHash() => r'36385a704d7aa14ebe2cd78f18a1c7ff12d6844d';
