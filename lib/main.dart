import 'package:demo/screens/home_screen.dart';
import 'package:demo/screens/new_todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

