import 'package:absen/utilities/constants.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class MyClipper extends CustomClipper<Path> {
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

Widget _buildSocialBtn(Function onTap, AssetImage logo) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(top: 30.0),
      height: 40.0,
      width: 40.0,
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

class _PageHomeState extends State<PageHome> {
  Widget _navBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildSocialBtn(
          () => print('Profile'),
          AssetImage(
            'assets/img/profile-3.png',
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 30.0),
            child: FlatButton.icon(
              onPressed: () {
                print("Location");
              },
              label: Text(
                "Depok, Indonesia",
                style: TextStyle(color: Colors.white, fontFamily: "Sen"),
              ),
              icon: Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              splashColor: Colors.transparent,
              color: Colors.transparent,
            )),
        Container(
            margin: const EdgeInsets.only(top: 30.0),
            height: 40.0,
            width: 40.0,
            child: FlatButton(
              // make button trasparant
              color: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onPressed: () {
                print("Notification");
              },
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            )),
      ],
    );
  }

  Widget _categoris() {
    return Column(
      children: <Widget>[
        Container(
          decoration: kBoxDecorationStyle1,
          margin: const EdgeInsets.only(top: 30.0),
          width: MediaQuery.of(context).size.width,
          height: 200,
          padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Column(
            children: [
              Text("Selamat malam",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Sen",
                  )),
              SizedBox(
                height: 15,
              ),
              Text(
                "Eka mahendra",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Sen",
                ),
              ),
              Expanded(
                  child: Divider(
                color: Colors.black,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    decoration: categoryBox1,
                    width: 50.0,
                    height: 50.0,
                    child: IconButton(
                      icon: Icon(Icons.qr_code_outlined),
                      onPressed: () {
                        print("Absen");
                      },
                      iconSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    decoration: categoryBox2,
                    width: 50.0,
                    height: 50.0,
                    child: IconButton(
                      icon: Icon(Icons.description_outlined),
                      onPressed: () {
                        print("Report");
                      },
                      iconSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    decoration: categoryBox3,
                    width: 50.0,
                    height: 50.0,
                    child: IconButton(
                      icon: Icon(Icons.badge),
                      onPressed: () {
                        print("ID");
                      },
                      iconSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    decoration: categoryBox4,
                    width: 50.0,
                    height: 50.0,
                    child: IconButton(
                      icon: Icon(Icons.person_outlined),
                      onPressed: () {
                        print("Profile");
                      },
                      iconSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _tableRow() {
    return Stack(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 10.0),
            decoration: kBoxDecorationStyle2,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 480,
            padding: const EdgeInsets.only(
                top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "tanggal",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Sen"),
                        )),
                    Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "jam masuk",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Sen"),
                        )),
                    Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "jam keluar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Sen"),
                        )),
                  ],
                ),
              ],
            )),
      ],
    );
  }

  Widget _homePage() {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              color: Colors.lightBlue[900],
              width: double.infinity,
              height: 300,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                _navBar(),
                _categoris(),
                Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  child: Text(
                    "satu minggu terakhir",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Sen",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                _tableRow()
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _homePage());
  }
}
