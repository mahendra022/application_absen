import 'dart:core';
import 'dart:ui';
import 'package:absen/screen/PageCash.dart';
import 'package:absen/screen/pageAbsen.dart';
import 'package:absen/screen/pageReport.dart';
import 'package:absen/screen/pageSetting.dart';
import 'package:absen/utilities/constants.dart';
import 'package:absen/screen/pageMedal.dart';
import 'package:absen/screen/pageMove.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('EEEE, d MMM y');
  final String formatted = formatter.format(now);

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 2.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _navBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: _buildSocialBtn(
            () => print('Profile'),
            AssetImage(
              'assets/img/pico1.png',
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 3,
          ),
          child: SizedBox(
              height: 40.0,
              width: 40.0,
              child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    LineIcons.bell,
                    size: 30.0,
                    color: Colors.cyan[600],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageSetting()),
                    );
                  })),
        ),
      ],
    );
  }

  Widget _categoris() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: categoryBox1,
                        width: 50.0,
                        height: 50.0,
                        child: IconButton(
                          icon: Icon(LineIcons.mapMarked),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageAbsen()),
                            );
                          },
                          iconSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          'Presensi',
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: categoryBox1,
                        width: 50.0,
                        height: 50.0,
                        child: IconButton(
                          icon: Icon(LineIcons.calendarCheck),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageCash()),
                            );
                          },
                          iconSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          'Request',
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: categoryBox1,
                        width: 50.0,
                        height: 50.0,
                        child: IconButton(
                          icon: Icon(LineIcons.wallet),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageCash()),
                            );
                          },
                          iconSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          'Cash',
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: categoryBox1,
                        width: 50.0,
                        height: 50.0,
                        child: IconButton(
                          icon: Icon(LineIcons.certificate),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageMedal()),
                            );
                          },
                          iconSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          'Asset',
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: categoryBox1,
                        width: 50.0,
                        height: 50.0,
                        child: IconButton(
                          icon: Icon(LineIcons.route),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageMove()),
                            );
                          },
                          iconSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          'Mobil',
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  /// controlerr notification slider
  int indexNotifSlider = 0;
  List<String> cardListNotif = [
    'assets/img/pemberitahuan1.png',
    'assets/img/pemberitahuan2.png',
  ];

  Widget _notifSlider() {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 8),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          enlargeCenterPage: true,
          viewportFraction: 1,
        ),
        items: cardList.map((item) {
          return Container(
            height: 130,
            width: MediaQuery.of(context).size.width + 0.2,
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                    //size image 300x130 pixsel
                    image: AssetImage(item),
                    fit: BoxFit.cover)),
          );
        }).toList(),
      ),
    );
  }

  /// controlerr service slider
  int indexSlider = 0;
  List<String> cardList = [
    'assets/img/pemberitahuan1.png',
    'assets/img/pemberitahuan2.png',
  ];

  Widget _serviceSlider() {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 8),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          enlargeCenterPage: true,
          viewportFraction: 1,
        ),
        items: cardList.map((item) {
          return Container(
            height: 130,
            width: MediaQuery.of(context).size.width + 0.2,
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                    //size image 300x130 pixsel
                    image: AssetImage(item),
                    fit: BoxFit.cover)),
          );
        }).toList(),
      ),
    );
  }

  Widget _info() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: 185,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width / 2,
                              child: FittedBox(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Eka Mahendra',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                          Text(
                            'ID134180801',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black38,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Text(
                        formatted,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black38,
                        ),
                      ),
                      SizedBox(height: 2),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            SizedBox(
                                height: 16.0,
                                width: 16.0,
                                child: new IconButton(
                                    padding: new EdgeInsets.all(0),
                                    icon: new Icon(
                                      Icons.location_on,
                                      size: 16.0,
                                      color: Colors.amber[600],
                                    ),
                                    onPressed: () {})),
                            Text(
                              'Depok, Indonesia',
                              style: TextStyle(
                                  color: Colors.green[600],
                                  fontFamily: "Raleway",
                                  fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageReport()),
                          );
                        },
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.cyan[700]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 5,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 5,
                                ),
                                height: 60,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Hadir',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      '12 Hari',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                              VerticalDivider(
                                color: Colors.white,
                                width: 0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 5,
                                ),
                                height: 60,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Tidak Hadir',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      '2 Hari',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              VerticalDivider(
                                color: Colors.white,
                                width: 0.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 5,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 5,
                                ),
                                height: 60,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Izin',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      '1 Hari',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        )
      ],
    );
  }

  Widget _homePage() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(240),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: _navBar(),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        _info()
                      ],
                    )),
              ],
            )),
      ),
      body: Stack(
        children: <Widget>[
          Container(
              color: Colors.white,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: _categoris(),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 5,
                        ),
                        width: MediaQuery.of(context).size.width * 0.99,
                        child: Column(
                          children: [
                            Container(
                                child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  Container(
                                    child: Text('Pemberitahuan',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _notifSlider(),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  Container(
                                    child: Text('Pico Service',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _notifSlider(),
                                ],
                              ),
                            )),
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
    return Scaffold(body: _homePage());
  }
}
