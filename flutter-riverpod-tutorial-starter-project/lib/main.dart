import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/screens/home/home_screen.dart';

void main() {
  //se tiene que envolver toda la aplicacion con un provider scope
  ///lo que hace es que si se envuelve con el provider scope todos los widgets
  ///podrán usar los datos que proporcionen los providers. Si se envuelve solo
  ///un árbol de widgets entonces SOLO esos widgets tendrán acceso al estado
  ///que proporciona. Ahora mismo se le está diciendo que todos los widgets
  ///que tenga MyApp tienen acceso a los providers
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const HomeScreen(),
    );
  }
}
