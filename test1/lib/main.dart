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
      home: Home(),
    ),
  );
}

//stateless widget: el estado del widget NO PUEDE CAMBIAR mientras usamos la app
//stateful widget: pueden cambiar mientras usamos la app

// ignore: slash_for_doc_comments
/**
 * Con este stateless widget se puede hacer un hot reload simplemente
 * guardando el fichero, pulsando r y no es necesario volver a recargar.
 * También se podrá usar este widget en varias partes si así lo queremos.
 * Serviría para las tabs por ejemplo.
 */
class Home extends StatelessWidget {
  const Home({super.key});

  //lo que indica la etiqueta "override" es que la clase que definamos sustituirá a la
  //funcion build que se hereda de StatelessWidget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //propiedad de barra superior que mostrará el widget de esta
      appBar: AppBar(
        title: Text('My first test'),
        centerTitle: true,
        //colores del material design, si quieres un color en específico
        //tienes que buscarlo y poner [x] después del nombre del color
        backgroundColor: Colors.deepOrange,
      ),
      //especifica qué es lo que irá debajo de la barra superior
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Hello world"),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(backgroundColor: Colors.blue),
            child: Text("Click me AGAIN"),
          ),
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(20),
            child: Text("Inside container"),
          ),
        ],
      ),
      //el container es aquel que sirve de envoltorio a otros widgets,
      //representa el contenedor
      /*Container(
            //in the container
            padding: EdgeInsets.all(20),
            //outside the container
            margin: EdgeInsets.all(30),
            color: Colors.blue,
            child: Text("Hola"),
          ),*/
      /*Center(
        //centraliza todo lo que está metido dentro
        //se pone child porque es el HIJO de un WIDGET
        child:
            //Image.asset("assets/descarga.jfif"),
            /*Icon(
              Icons.airport_shuttle,
              color: const Color.fromARGB(255, 74, 162, 255),
              size: 100.0,
            ),*/
            //se usa child cuando se anida un widget dentro de otro widget
            /*ElevatedButton.icon(
              onPressed: () {
                //print("You just clicked me");
              },
              icon: Icon(Icons.mail, color: Colors.white),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              label: Text(
                "Botoncito",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              /*child: Text(
                "Botoncito",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),*/
            ),*/
            IconButton(
              //para tabs
              onPressed: () {},
              icon: Icon(Icons.alternate_email),
              color: Colors.blue,
            ),
      ),*/
      floatingActionButton: FloatingActionButton(
        //función anónima de momento
        onPressed: () {},
        backgroundColor: Colors.deepOrange,
        //el hijo se suele poner al final
        child: Text("Click me"),
      ),
    );
  }
}
