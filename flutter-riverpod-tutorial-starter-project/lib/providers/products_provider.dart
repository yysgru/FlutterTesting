import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/models/product.dart';

part 'products_provider.g.dart';

///sera una clase que se encargue de comunicar los cambios de un
///estado a los demás widgets que lo estén viendo, puede informar
///(solo lectura) o puede hacer sus propios cambios en el estado
const List<Product> allProducts = [
  Product(
      id: '1',
      title: 'Groovy Shorts',
      price: 12,
      image: 'assets/products/shorts.png'),
  Product(
      id: '2',
      title: 'Karati Kit',
      price: 34,
      image: 'assets/products/karati.png'),
  Product(
      id: '3',
      title: 'Denim Jeans',
      price: 54,
      image: 'assets/products/jeans.png'),
  Product(
      id: '4',
      title: 'Red Backpack',
      price: 14,
      image: 'assets/products/backpack.png'),
  Product(
      id: '5',
      title: 'Drum & Sticks',
      price: 29,
      image: 'assets/products/drum.png'),
  Product(
      id: '6',
      title: 'Blue Suitcase',
      price: 44,
      image: 'assets/products/suitcase.png'),
  Product(
      id: '7',
      title: 'Roller Skates',
      price: 52,
      image: 'assets/products/skates.png'),
  Product(
      id: '8',
      title: 'Electric Guitar',
      price: 79,
      image: 'assets/products/guitar.png'),
];

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
@riverpod
List<Product> products(ref) {
  return allProducts;
}

@riverpod
List<Product> reducedProducts(ref) {
  return allProducts.where((p) => p.price < 50).toList();
}
