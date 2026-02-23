import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String time = "loading";

  //que a su vez crea un objeto del tipo worldtime pasandole
  //lo que se especifica y obteniendo la hora
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: "Madrid",
      flag: "spain.png",
      url: "Europe/Madrid",
    );

    await instance.getTime();

    //se encarga de actualizar la variable string que hemos creado
    //antes en la clase para que se muestre por PANTALLA la hora
    /*setState(() {
      time = instance.time;
    });*/

    //en vez de actualizar un texto lo que hará es irse a la página
    //de home una vez acabe de obtener la hora pasandole un MAPA de parametros
    Navigator.pushReplacementNamed(
      context,
      "/home",
      arguments: {
        "location": instance.location,
        "flag": instance.flag,
        "time": instance.time,
        "isDayTime": instance.isDayTime,
      },
    );
  }

  //Cuando el widget empieza se ejecuta esta función
  //solo una vez cuando se ejecuta por primera vez
  @override
  void initState() {
    super.initState();
    //llama a la función
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(color: Colors.white, size: 50.0),
      ),
    );
  }
}
