import 'package:absen/screen/pageCare.dart';
import 'package:absen/screen/pageHome.dart';
import 'package:absen/screen/pageSetting.dart';
import 'package:absen/screen/pageProfile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    PageHome(),
    PageCare(),
    PageProfile(),
    PageSetting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3),
            child: GNav(
              rippleColor: Colors.grey[300],
              hoverColor: Colors.grey[100],
              gap: 8,
              activeColor: Colors.white,
              iconSize: 25,
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.cyan[600],
              color: Colors.black54,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.commentDots,
                  text: 'Care',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Proflie',
                ),
                GButton(
                  icon: LineIcons.cog,
                  text: 'Setting',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
