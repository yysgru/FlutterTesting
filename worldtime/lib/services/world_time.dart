import "package:http/http.dart";
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  //el nombre del sitio
  String location = "";
  //la hora
  String time = "";
  //la bandera
  String flag = "";
  //la url
  String url = "";
  //si es de dia o no
  bool isDayTime = true;

  WorldTime({required this.location, required this.flag, required this.url});

  //se le promete a dart que va a devolverle un void una vez que la
  //funcion asincrona acabe
  Future<void> getTime() async {
    try {
      //hace la peticion a la api
      Response response = await get(
        Uri.parse("https://time.now/developer/api/timezone/$url"),
      );
      Map data = jsonDecode(response.body);

      //obtiene las propiedades desde el mapa que se ha obtenido
      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);

      //se crea un objeto date time de la libreria instalada
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //gestiona con un ternario si es de dia o no
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

      //se formatea la fecha para que se vea bien
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("ERROR: $e");
      time = "Could not get time data";
    }
  }
}
