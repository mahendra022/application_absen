import 'dart:convert';
import 'package:absen/model/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:absen/navbar.dart';
import 'package:absen/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController(text: "");
TextEditingController passwordController = TextEditingController(text: "");

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

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  bool _isLoading = false;
  List<AuthModel> listUser = [];
  int index = 0;
  final url_Auth = Uri.parse(
      "https://script.google.com/macros/s/AKfycbzefQWpkE31t5d9Mt0khhs0W6ia7Ft3eFPKwS20yW3BNr46HtM/exec");

  Future _signIn(String email, String password) async {
    var getEmail = email;
    var getPassword = password;
    var response = await http.get(url_Auth);
    final jsonItems = json.decode(response.body);
    for (Map user in jsonItems) {
      listUser.add(AuthModel.fromMap(user));
      if (getEmail == listUser[index].email &&
          getPassword == listUser[index].password) {
        setState(() {
          _isLoading = false;
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Home()),
              (route) => false);
        });
      }
      index++;
    }
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: kBoxDecorationStyleLogin,
          height: 50.0,
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                LineIcons.envelope,
                color: Colors.blue,
                size: 20,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: kBoxDecorationStyleLogin,
          height: 50.0,
          child: TextField(
            obscureText: true,
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                LineIcons.lock,
                color: Colors.blue,
                size: 20,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.cyan),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.blue,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      height: 110,
      padding: EdgeInsets.symmetric(vertical: 30.0),
      width: double.infinity,
      child: _isLoading
          ? Center(child: CircularProgressIndicator())
          : RaisedButton(
              elevation: 5.0,
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                _signIn(emailController.text, passwordController.text);
              },
              padding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Colors.cyan[600],
              child: Text(
                'Log in',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sen',
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                  child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.60,
                            child: ClipPath(
                              clipper: WaveClipperTwo(),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/img/background1.jpg'),
                                        fit: BoxFit.cover)),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 40.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Wellcome \n Back',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Quattro',
                                          fontSize: 38.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                _buildEmailTF(),
                                SizedBox(
                                  height: 30.0,
                                ),
                                _buildPasswordTF(),
                                SizedBox(height: 20),
                                _buildRememberMeCheckbox(),
                                _buildLoginBtn(),
                              ],
                            ),
                          ),
                        ],
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
