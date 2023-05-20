import 'package:flutter/material.dart';
import 'package:world_clock_app/screens/choose_location.dart';
import 'package:world_clock_app/screens/home.dart';
import 'package:world_clock_app/screens/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const LoadingScreen(),
      '/home': (context) => const HomeScreen(),
      '/location': (context) => const ChooseLocationScreen()
    },
  ));
}