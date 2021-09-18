import 'package:flutter/material.dart';

class PageMedal extends StatefulWidget {
  @override
  _PageMedalState createState() => _PageMedalState();
}

class _PageMedalState extends State<PageMedal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/onBuild1.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                child: Text(
                  'This page Comming Soon!',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                child: Text(
                  'We are working hard to give you a better experince',
                  style: TextStyle(fontSize: 15, color: Colors.black45),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        )));
  }
}
