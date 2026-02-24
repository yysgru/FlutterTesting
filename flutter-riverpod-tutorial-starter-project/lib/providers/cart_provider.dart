import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/models/product.dart';
//la que crea riverpod
part 'cart_provider.g.dart';

///si queremos que al consumir el provider los widgets puedan hacer cambios
///necesitamos notificar sobre los cambios (notifier provider)
///ESTA CLASE NO ES UN PROVIDER. ES UNA CLASE, EL NOTIFIER PROVIDER USA LA CLASE
///Y EL STATE QUE SE INDICA AQUÍ
///Lo usará la vista del carrito y en la vista inicial porque se añadirá un botón
///debajo de cada item para añadirlo a la cesta o eliminarlo de la cesta.
@riverpod
class CartNotifier extends _$CartNotifier {
  //initial value
  @override
  Set<Product> build() {
    return const {
      //se crea un producto y este producto es el inicial state (como si el carrito
      //solo tuviera un producto)
    };
  }

  //métodos que servirán para ir actualizando el estado
  void addProduct(Product product) {
    if (!state.contains(product)) {
      ///si el producto que se quiere añadir aún NO ESTÁ en la cesta de la compra
      ///entonces se actualiza el estado para que contenga lo que YA TENÍA antes y
      ///el nuevo producto y cuando ocurra todos los consumer widgets que estén consumiendo
      ///el provider serán notificados de ese cambio y que hace que la función de build
      ///vuelva a ejecutarse y obtienen ese valor del estado actualizado
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

///Antes era solo provider pero ahora no solo provee un valor de lectura sino que
///provee también una instancia de la clase de arriba
/*final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});*/

@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartProvider);

  int total = 0;

  for (Product product in cartProducts) {
    total += product.price;
  }

  return total;
}
