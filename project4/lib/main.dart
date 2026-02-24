import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:project4/app.dart';
import 'package:project4/counter_observer.dart';

void main() {
  //se inicializa el counterobserver que se acaba de crear y
  //llama a runapp con el widfet counter app
  Bloc.observer = const CounterObserver();
  runApp(CounterApp());
}
