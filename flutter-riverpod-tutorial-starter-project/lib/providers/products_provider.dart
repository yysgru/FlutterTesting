import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';

///sera una clase que se encargue de comunicar los cambios de un
///estado a los demás widgets que lo estén viendo, puede informar
///(solo lectura) o puede hacer sus propios cambios en el estado
const List<Product> allProducts = [
  Product(
    id: 'p1',
    title: 'Camiseta básica',
    price: 15,
    image: 'assets/images/camiseta.png',
  ),
  Product(
    id: 'p2',
    title: 'Pantalones vaqueros',
    price: 40,
    image: 'assets/images/vaqueros.png',
  ),
  Product(
    id: 'p3',
    title: 'Zapatillas deportivas',
    price: 60,
    image: 'assets/images/zapatillas.png',
  ),
  Product(
    id: 'p4',
    title: 'Sudadera con capucha',
    price: 35,
    image: 'assets/images/sudadera.png',
  ),
  Product(
    id: 'p5',
    title: 'Gorra clásica',
    price: 12,
    image: 'assets/images/gorra.png',
  ),
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
final productProvider = Provider((ref) {
  //en este caso es la lista de productos. le va a proveer a cualquier widget
  //que quiera consumir este provider en el futuro un permiso de LECTURA
  return allProducts;
});

//este por ejemplo provee de unos productos de los cuales su precio sea menor que 50
final reducedProductsProvider = Provider((ref) {
  //no devuelve una lista si no se le pone tolist, devuelve un iterable
  return allProducts.where((p) => p.price < 50).toList();
});
