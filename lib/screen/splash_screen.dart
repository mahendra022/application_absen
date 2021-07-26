import 'package:absen/auth/login.dart';
import 'package:absen/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [
                Colors.blue[700],
                Colors.blue[400],
              ])),
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(top: 30.0),
                  child: FlatButton(
                    // make button trasparant
                    color: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20, top: 34.0),
                constraints: BoxConstraints.expand(height: 300.0),
                width: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/photo-1.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                padding: EdgeInsets.only(top: 42.0, right: 30, left: 30),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Many features in one hand",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.0,
                          fontFamily: 'Quattro',
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "By. Mule Indonesia",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 17.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 30, right: 20, left: 20)),
                    Center(
                      child: Text(
                        "Towards Indonesia as a project-oriented nation, so that national goals can be achieved with a high degree of certainty and efficient use of resources and encourage the implementation of project management nationally",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 14.0,
                          fontFamily: 'Quattro',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25.0),
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 100.0, right: 100.0),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Raleway",
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.blue,
                ),
              )
            ],
          )),
    );
  }
}
