import 'package:absen/screen/pageApproval.dart';
import 'package:absen/screen/pageMedal.dart';
import 'package:absen/screen/pageMove.dart';
import 'package:absen/screen/pageReport.dart';
import 'package:absen/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

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
        Container(
          margin: const EdgeInsets.only(top: 30.0),
          child: IconButton(
            icon: Icon(
              LineIcons.bell,
            ),
            iconSize: 25,
            color: Colors.white,
            splashColor: Colors.transparent,
            onPressed: () {
              print("Notification");
            },
          ),
        ),
      ],
    );
  }

  Widget _categoris() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 40.0),
          width: MediaQuery.of(context).size.width,
          height: 200,
          padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Column(
            children: [
              Text(
                "Selamat malam",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Sen",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Eka mahendra",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Sen",
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: categoryBox1,
                    width: 50.0,
                    height: 50.0,
                    child: IconButton(
                      icon: Icon(LineIcons.fileInvoice),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PageReport()),
                        );
                      },
                      iconSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    decoration: categoryBox2,
                    width: 50.0,
                    height: 50.0,
                    child: IconButton(
                      icon: Icon(LineIcons.checkCircleAlt),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PageApproval()),
                        );
                      },
                      iconSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    decoration: categoryBox3,
                    width: 50.0,
                    height: 50.0,
                    child: IconButton(
                      icon: Icon(LineIcons.medal),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PageMedal()),
                        );
                      },
                      iconSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    decoration: categoryBox4,
                    width: 50.0,
                    height: 50.0,
                    child: IconButton(
                      icon: Icon(LineIcons.route),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PageMove()),
                        );
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
    return DataTable(
      sortColumnIndex: 1,
      sortAscending: true,
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Tanggal',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Jam masuk',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Jam keluar',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('29 Juli 2021')),
            DataCell(Text('06:43:00')),
            DataCell(Text('17:43:00')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('28 Juli 2021')),
            DataCell(Text('06:43:00')),
            DataCell(Text('17:43:00')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('27 Juli 2021')),
            DataCell(Text('06:43:00')),
            DataCell(Text('17:43:00')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('26 Juli 2021')),
            DataCell(Text('06:43:00')),
            DataCell(Text('17:43:00')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('25 Juli 2021')),
            DataCell(Text('06:43:00')),
            DataCell(Text('17:43:00')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('24 Juli 2021')),
            DataCell(Text('06:43:00')),
            DataCell(Text('17:43:00')),
          ],
        ),
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
              color: Colors.cyan[800],
              width: double.infinity,
              height: 300,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                _navBar(),
                _categoris(),
                Container(
                  margin: const EdgeInsets.only(top: 35.0),
                  child: Text(
                    "satu minggu terakhir",
                    style: TextStyle(
                        color: Colors.cyan[800],
                        fontFamily: "Sen",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 390),
              width: double.infinity,
              child: SingleChildScrollView(
                  child: FittedBox(
                child: _tableRow(),
              ))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _homePage());
  }
}
