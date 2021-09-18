import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class PageProfile extends StatefulWidget {
  @override
  _PageProfileState createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  Widget _buildSocialBtn1(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 75.0,
        width: 75.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(image: logo, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _tagLine() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Eka Mahendra",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Quattro",
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        alignment: Alignment.topLeft,
        child: Text("Fullstack Developer"),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            SizedBox(
                height: 17.0,
                width: 17.0,
                child: new IconButton(
                    padding: new EdgeInsets.all(0),
                    icon: new Icon(
                      Icons.location_on,
                      size: 17.0,
                      color: Colors.amber[600],
                    ),
                    onPressed: () {})),
            Text(
              'Depok, Indonesia',
              style: TextStyle(
                  color: Colors.white, fontFamily: "Raleway", fontSize: 12),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _photoProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          child: _buildSocialBtn1(
            () => print('Profile'),
            AssetImage(
              'assets/img/profile-4.jpg',
            ),
          ),
        ),
        _tagLine(),
      ],
    );
  }

  Widget _pageProfile() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          color: Colors.cyan[200]),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _photoProfile(),
                          ])),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.6,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Quattro',
              fontWeight: FontWeight.w400,
              fontSize: 17),
        ),
        actions: [
          IconButton(
            icon: LineIcon.pen(color: Colors.cyan[700], size: 20),
            onPressed: () {},
          )
        ],
      ),
      body: _pageProfile(),
    );
  }
}
