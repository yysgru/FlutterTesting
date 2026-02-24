import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/products_provider.dart';
import 'package:riverpod_files/shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  ///como la home screen está consumiendo lo que le proporciona el provider se dice
  ///que es un consumer widget (así con todos). Es una clase que ya viene con el
  ///paquete de riverpod y se usa cuando tenemos un stateless widget que quiere usar
  ///un provider state, la clase "ConsumerWidget" está hecha para que la usen
  ///stateless widgets, si una clase que extiende de Stateful necesita consumir
  ///entonces se usa una clase llamada "ConsumerStatefulWidget"
  const HomeScreen({super.key});

  @override //                                 es un objeto que nos va a permitir
  //                                 usar métodos referentes al provider
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        //el icono del carrito con el numero de objetos
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        //los cuadrados que se ven en la vista
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(
                children: [
                  Image.asset(
                    allProducts[index].image,
                    width: 60,
                    height: 60,
                  ),
                  Text(allProducts[index].title),
                  Text("€${allProducts[index].price}")
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
