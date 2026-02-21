import 'package:flutter/material.dart';

//es la primera función que se ejecuta, le pasa el
//root widget que contiene los demás
//its the first function that executes, the parameter
//is the root widget, which contents the rest
void main() {
  //runApp(const MyApp());
  //nos deja crear una carta blanca para utilizar google material
  //design features, es como un envoltorio para toda la app
  runApp(
    //SE EMPIEZA CON MAYUSCULA Y AL CAMBIAR DE PALABRA SIGUE LA
    //MAYUSCULA Y DESPUÉS DE CADA PROPIEDAD SIGUE UNA COMA
    MaterialApp(
      //especifica QUÉ es lo que va a estar en la home screen cuando
      //se inicia la apliación
      home: Scaffold(
        //propiedad de barra superior que mostrará el widget de esta
        appBar: AppBar(title: Text('My first test'), centerTitle: true),
        //especifica qué es lo que irá debajo de la barra superior
        body: Center(
          //centraliza todo lo que está metido dentro
          //se pone child porque es el HIJO de un WIDGET
          child: Text("Hello world"),
        ),
        //floatingActionButton: FloatingActionButton(child: Text("Click")),
      ),
    ),
  );
}
