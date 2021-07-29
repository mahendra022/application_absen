import 'package:absen/screen/pageHome.dart';
import 'package:absen/screen/pageProfile.dart';
import 'package:absen/screen/pageReport.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  List<Widget> _pageList = <Widget>[
    PageHome(),
    PageReport(),
    PageProfile(),
  ];

  //change page with button navigati bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home_outlined),
            title: new Text(
              'Home',
              style: TextStyle(color: Colors.black, fontFamily: "Sen"),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.assessment_outlined),
            title: new Text(
              'Report',
              style: TextStyle(color: Colors.black, fontFamily: "Sen"),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.black, fontFamily: "Sen"),
              ))
        ],
      ),
    );
  }
}
