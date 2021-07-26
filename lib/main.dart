import 'package:absen/home.dart';
import 'package:absen/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway'),
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => Home(),
      },
    );
  }
}
