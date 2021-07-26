import 'package:absen/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Widget _buildSocialBtn(Function onTap, AssetImage logo) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
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

class _HomeState extends State<Home> {
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
            child: FlatButton.icon(
          onPressed: () {
            print("Location");
          },
          label: Text("Depok, Indonesia"),
          icon: Icon(
            Icons.location_on,
            color: Colors.amber,
          ),
          splashColor: Colors.transparent,
          color: Colors.transparent,
        )),
        Container(
            height: 40.0,
            width: 40.0,
            child: FlatButton(
              // make button trasparant
              color: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Icon(
                Icons.notifications,
                color: Colors.amber,
              ),
            )),
      ],
    );
  }

  Widget _categoris() {
    return Column(
      children: <Widget>[
        Container(
          decoration: kBoxDecorationStyle,
          margin: const EdgeInsets.only(top: 42.0),
          width: 400.0,
          height: 200.0,
          padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Column(
            children: [
              Text("Selamat Malam",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  )),
              Text("Eka Mahendra",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 60.0),
                    decoration: categoryBox1,
                    width: 70.0,
                    height: 70.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 60.0),
                    decoration: categoryBox2,
                    width: 70.0,
                    height: 70.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 60.0),
                    decoration: categoryBox3,
                    width: 70.0,
                    height: 70.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 60.0),
                    decoration: categoryBox4,
                    width: 70.0,
                    height: 70.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: 1, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home_outlined),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.assessment_outlined),
            title: new Text('Report'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail_outline),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined), title: Text('Profile'))
        ],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _navBar(),
                      _categoris(),
                      // _buildPasswordTF(),
                      // _buildForgotPasswordBtn(),
                      // _buildRememberMeCheckbox(),
                      // _buildLoginBtn(),
                      // _buildSignInWithText(),
                      // _buildSocialBtnRow(),
                      // _buildSignupBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
