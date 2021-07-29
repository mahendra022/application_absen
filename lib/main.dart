import 'package:absen/auth/login.dart';
import 'package:absen/home.dart';
import 'package:absen/screen/pageProfile.dart';
import 'package:absen/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sen'),
      // home : FutureBuilder(
      //     future: _fbApp,
      // builder: (context, snapshot){
      //       if (snapshot.hasError){
      //         print('You have an error! ${snapshot.error.toString()}');
      //         return Text("Something went wrong!");
      //       } else if (snapshot.hasData) {
      //         return Home();
      //       } else {
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      // },
      // ),
      routes: {
        '/': (context) => Home(),
        '/home': (context) => SplashScreen(),
        '/login': (context) => LoginScreen()
      },
    );
  }
}
