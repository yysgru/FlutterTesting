import 'package:flutter/material.dart';
import 'package:project4/counter/view/counter_page.dart';

/// {@template counter_app}
/// A [MaterialApp] which sets the `home` to [CounterPage].
/// {@endtemplate}
/// se extiende material app porque counter app es una material
/// app, en la mayoria de casos se creara un stateless o stateful
/// widget y se compondrán de widgets dentro del build pero en
/// este caso no hacen falta widgets para que lo compongan, asi
/// que es mas simple extender de material app
class CounterApp extends MaterialApp {
  /// {@macro counter_app}
  const CounterApp({super.key}) : super(home: const CounterPage());
}
