import 'package:absen/auth/login.dart';
import 'package:absen/auth/register.dart';
import 'package:absen/navbar.dart';
import 'package:absen/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // block rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sen'),
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => SplashScreen(),
        '/login': (context) => LoginScreen()
      },
    );
  }
}
