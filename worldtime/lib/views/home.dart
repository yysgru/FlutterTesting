import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //variable en donde se va a ir almacenando la información, está vacío al principio
  Map data = {};

  @override
  Widget build(BuildContext context) {
    //donde realmente se reciben los parámetros que llegan, se pone aquí
    //porque necesita el contexto
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    //actualizar el fondo
    String bgImage = data["isDayTime"] ? "day.png" : "night.png";

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgImage"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  //se navega a la de location, se escoje el sitio y vuelve con
                  //todos los datos
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(
                      context,
                      "/location",
                    );
                    setState(() {
                      //actualiza los valores sobreescribiendo con otro mapa
                      data = {
                        "time": result["time"],
                        "location": result["location"],
                        "isDayTime": result["isDayTime"],
                        "flag": result["flag"],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text("Edit location"),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data["location"],
                      style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(data["time"], style: TextStyle(fontSize: 66.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
