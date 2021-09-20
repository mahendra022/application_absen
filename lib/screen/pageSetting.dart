import 'dart:core';
import 'dart:ui';
import 'package:absen/auth/login.dart';
import 'package:absen/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageSetting extends StatefulWidget {
  @override
  _PageSettingState createState() => _PageSettingState();
}

class _PageSettingState extends State<PageSetting> {
  Widget _textAccount() {
    return GestureDetector(
        onTap: () {
          print('Akun');
        },
        child: Row(children: [
          Container(
              margin: EdgeInsets.only(top: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Akun',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Quattro',
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Data Diri, dan Kemanan Akun',
                      style: TextStyle(
                          color: Colors.black45,
                          fontFamily: 'Quattro',
                          fontSize: 13),
                    ),
                  ),
                ],
              )),
        ]));
  }

  Widget _account() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            print('Akun');
          },
          child: Container(
              margin: EdgeInsets.only(left: 13, top: 10),
              height: 55,
              width: MediaQuery.of(context).size.width * 0.92,
              decoration: kBoxDecorationStyle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _textAccount(),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        LineIcons.angleRight,
                      ),
                      iconSize: 16,
                      color: Colors.black,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        print("Akun");
                      },
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  /// page menu notifikasi
  Widget _textNotifikasi() {
    return GestureDetector(
        onTap: () {
          print('Notifikasi');
        },
        child: Row(children: [
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Notifikasi',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Quattro',
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Aplikasi dan lainnya',
                      style: TextStyle(
                          color: Colors.black45,
                          fontFamily: 'Quattro',
                          fontSize: 13),
                    ),
                  ),
                ],
              )),
        ]));
  }

  Widget _notifikasi() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            print('Notifikasi');
          },
          child: Container(
              margin: EdgeInsets.only(left: 13, top: 10),
              height: 55,
              width: MediaQuery.of(context).size.width * 0.92,
              decoration: kBoxDecorationStyle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _textNotifikasi(),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        LineIcons.angleRight,
                      ),
                      iconSize: 16,
                      color: Colors.black,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        print("Notifikasi");
                      },
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  /// page menu about
  Widget _aboutPico() {
    return GestureDetector(
        onTap: () {
          print('about pico mobile');
        },
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 13, top: 5),
                height: 55,
                width: MediaQuery.of(context).size.width * 0.92,
                decoration: kBoxDecorationStyle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Tentang Pico Mobile',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Quattro',
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(
                          LineIcons.angleRight,
                        ),
                        iconSize: 16,
                        color: Colors.black,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          print("about pico");
                        },
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }

  /// page menu about
  Widget _syaratKetentuan() {
    return GestureDetector(
        onTap: () {
          print('syarat dan ketentuan');
        },
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 13, top: 5),
                height: 55,
                width: MediaQuery.of(context).size.width * 0.92,
                decoration: kBoxDecorationStyle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Syarat dan Ketentuan',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Quattro',
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(
                          LineIcons.angleRight,
                        ),
                        iconSize: 16,
                        color: Colors.black,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          print("syarat ketentuan");
                        },
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }

  /// page menu kebijakan
  Widget _kebijakan() {
    return GestureDetector(
        onTap: () {
          print('kebijakan privasi');
        },
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 13, top: 5),
                height: 55,
                width: MediaQuery.of(context).size.width * 0.92,
                decoration: kBoxDecorationStyle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Kebijakan Privasi',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Quattro',
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(
                          LineIcons.angleRight,
                        ),
                        iconSize: 16,
                        color: Colors.black,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          print("Kebijakan Privasi");
                        },
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }

  /// page menu logout
  Widget _logout() {
    return GestureDetector(
        onTap: () {
          _showModalExit(context);
        },
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                _showModalExit(context);
              },
              child: Container(
                  margin: EdgeInsets.only(left: 13, top: 5),
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Keluar',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Quattro',
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }

  Widget _pageSetting() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.6,
        automaticallyImplyLeading: false,
        title: Text(
          'Pengaturan',
          style: TextStyle(
              color: Colors.cyan[600],
              fontFamily: 'Quattro',
              fontWeight: FontWeight.w400,
              fontSize: 17),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
              width: double.infinity,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width * 0.99,
                        height: MediaQuery.of(context).size.height * 0.80,
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            _account(),
                            _notifikasi(),
                            _aboutPico(),
                            _syaratKetentuan(),
                            _kebijakan(),
                            _logout(),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white38,
                                    blurRadius: 6.0,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Text(
                                'Versi 0.001',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'Quattro',
                                    fontSize: 15),
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

  _showModalExit(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              child: Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Keluar dari Pico Mobile',
                                style: TextStyle(
                                    fontFamily: 'Quattro',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.cyan[900]),
                              ),
                              SizedBox(
                                height: 17,
                              ),
                              Text(
                                'Apakah Anda ingin keluar?',
                                style: TextStyle(
                                    fontFamily: 'Quattro',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black45),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Batal',
                                style: TextStyle(
                                    fontFamily: 'Quattro',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black45),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                logout();
                              },
                              child: Text(
                                'Keluar',
                                style: TextStyle(
                                    fontFamily: 'Quattro',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.cyan[700]),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ));
        });
  }

  logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    // ignore: deprecated_member_use
    sharedPreferences.commit();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _pageSetting());
  }
}
