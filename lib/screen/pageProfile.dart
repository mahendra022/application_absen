import 'package:flutter/material.dart';

class PageProfile extends StatefulWidget {
  @override
  _PageProfileState createState() => _PageProfileState();
}

class MyClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

Widget _buildSocialBtn1(Function onTap, AssetImage logo) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(top: 70.0),
      height: 90.0,
      width: 90.0,
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
        image: DecorationImage(
          image: logo,
        ),
      ),
    ),
  );
}

class _PageProfileState extends State<PageProfile> {
  Widget _photoProfile() {
    return Row(
      children: <Widget>[
        Row(
          children: [
            Container(
              child: _buildSocialBtn1(
                () => print('Profile'),
                AssetImage(
                  'assets/img/profile-3.png',
                ),
              ),
            ),
            Column(children: [
              Container(
                margin: const EdgeInsets.only(top: 88.0, left: 40),
                child: Column(
                  children: [
                    Container(
                        child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Eka Mahendra",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Quattro",
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Mobile Developer"),
                      )),
                  Container(
                      padding: null,
                      margin: const EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: FlatButton.icon(
                            onPressed: () {
                              print("Location");
                            },
                            label: Text(
                              "Depok, Indonesia",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Quattro",
                                  fontWeight: FontWeight.bold),
                            ),
                            icon: Icon(
                              Icons.location_on,
                              color: Colors.amber,
                              size: 16,
                            ),
                            splashColor: Colors.transparent,
                            color: Colors.transparent,
                          ))),
                ],
              )
            ])
          ],
        ),
      ],
    );
  }

  Widget _pageProfile() {
    return Scaffold(
      backgroundColor: Colors.cyan[800],
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper1(),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: 300,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 10.0,
            ),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                _photoProfile(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageProfile(),
    );
  }
}
