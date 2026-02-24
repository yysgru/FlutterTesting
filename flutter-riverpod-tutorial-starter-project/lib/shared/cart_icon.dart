import 'package:flutter/material.dart';
import 'package:riverpod_files/screens/cart/cart_screen.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    //stack permite poner varios items encima uno del otro
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CartScreen();
            }));
          },
          //el icono del carrito de compra
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
        //para poder ponerlo ENCIMA del carrito
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              //el circulito azul
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent,
            ),
          ),
        ),
      ],
    );
  }
}
