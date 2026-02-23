import 'package:flutter/material.dart';
import "package:http/http.dart";
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    // Datos simulados mientras no hay API disponible
    Map data = {
      "datetime": "2024-01-15T10:30:00.000000+01:00",
      "timezone": "Europe/Madrid",
      "utc_offset": "+01:00",
    };
    //print(data);

    //get properties from data
    String datetime = data["datetime"];
    String offset = data["utc_offset"].substring(1, 3);
    //print(datetime);
    //print(offset);

    //create a datetime object
    DateTime now = DateTime.parse(datetime);
    now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  //the function that runs first
  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("Loading screen"));
  }
}
