import 'dart:async';
import 'dart:core';
import 'dart:ui';
import 'package:absen/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:intl/intl.dart';

class PageAbsen extends StatefulWidget {
  @override
  _PageAbsenState createState() => _PageAbsenState();
}

class MyClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height + 400);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _PageAbsenState extends State<PageAbsen> {
  String _chosenValue;

  var jam = '';
  void startJam() {
    Timer.periodic(new Duration(seconds: 1), (_) {
      var tgl = new DateTime.now();
      var formatedjam = new DateFormat.Hms().format(tgl);
      setState(() {
        jam = formatedjam;
      });
    });
  }

  @override
  void initState() {
    startJam();
    // TODO: implement initState
    super.initState();
  }

  Widget _navigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            // ignore: deprecated_member_use
            child: FlatButton.icon(
          onPressed: () {
            print("Location");
          },
          label: Text(
            "Depok, Indonesia",
            style: TextStyle(color: Colors.white, fontFamily: "Sen"),
          ),
          icon: Icon(
            LineIcons.mapMarker,
            color: Colors.white,
          ),
          splashColor: Colors.transparent,
          color: Colors.transparent,
        )),
      ],
    );
  }

  Widget _pageAbsen() {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan[800],
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                LineIcons.chevronCircleLeft,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            "Absensi",
            style: TextStyle(
                color: Colors.white, fontFamily: 'Overpass', fontSize: 15),
          ),
          elevation: 0.0),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper1(),
            child: Container(
              color: Colors.cyan[800],
              width: double.infinity,
              height: 300,
            ),
          ),
          Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _navigation(),
                    Container(
                      child: Text(
                        jam,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Sen",
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 17,
                          vertical: 10,
                        ),
                        width: MediaQuery.of(context).size.width * 0.99,
                        height: MediaQuery.of(context).size.height * 0.84,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6.0,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 7),
                              width: MediaQuery.of(context).size.width * 0.88,
                              height: MediaQuery.of(context).size.height * 0.20,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/img/maps.png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 20),
                                width: MediaQuery.of(context).size.width * 0.88,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Nama Karyawan',
                                      style: kLabelStyleAbsen,
                                    ),
                                    SizedBox(height: 2.0),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      decoration: kBoxDecorationStyleAbsen,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      child: TextField(
                                        readOnly: true,
                                        maxLines: 1,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding:
                                              EdgeInsets.only(left: 15),
                                          hintText: 'Eka Mahendra',
                                        ),
                                      ),
                                    ),
                                  ],
                                )),

                            ///input jabatan
                            Visibility(
                              visible: false,
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.88,
                                  height:
                                      MediaQuery.of(context).size.height * 0.10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Jabatan',
                                        style: kLabelStyleAbsen,
                                      ),
                                      SizedBox(height: 2.0),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        decoration: kBoxDecorationStyleAbsen,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: TextField(
                                          readOnly: true,
                                          maxLines: 1,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            contentPadding:
                                                EdgeInsets.only(left: 15),
                                            hintText: 'Mobile Developer',
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.88,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.only(left: 5),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.83,
                                        child: DropdownButton<String>(
                                          // icon: Icon(LineIcons.angleDown),
                                          // iconSize: 17,
                                          underline: SizedBox(
                                            height: 26,
                                          ),
                                          value: _chosenValue,
                                          //elevation: 5,
                                          style: TextStyle(color: Colors.black),
                                          items: <String>[
                                            'Absen Masuk',
                                            'Izin',
                                            'Sakit',
                                            'Cuti',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Container(
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      fontFamily: 'Quattro',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          hint: Text(
                                            "Choose type absen",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'Quattro'),
                                          ),
                                          onChanged: (String value) {
                                            setState(() {
                                              _chosenValue = value;
                                            });
                                          },
                                        )),
                                  ],
                                )),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.88,
                                height:
                                    MediaQuery.of(context).size.height * 0.17,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Keterangan',
                                      style: kLabelStyleAbsen,
                                    ),
                                    SizedBox(height: 2.0),
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: kBoxDecorationStyleAbsen,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.10,
                                      child: TextField(
                                        maxLines: 10,
                                        decoration: InputDecoration(
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding: EdgeInsets.only(
                                              left: 15, top: 15),
                                        ),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Quattro',
                                        ),
                                        obscureText: false,
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                              width: 110,
                              child: RaisedButton(
                                onPressed: () {
                                  print('submit');
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                color: Colors.cyan[600],
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 2.0,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Sen',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _pageAbsen());
  }
}
