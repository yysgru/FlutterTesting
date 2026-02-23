import 'package:flutter/material.dart';
import 'package:worldtime/views/choose_location.dart';
import 'package:worldtime/views/home.dart';
import 'package:worldtime/views/loading.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        //el contexto es básicamente el lugar de la
        //aplicación en la que se está en ese momento

        //TABLA DE RUTAS
        "/": (context) => Loading(),
        "/home": (context) => Home(),
        "/location": (context) => ChooseLocation(),
      },
    ),
  );
}
