import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:absen/model/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:absen/navbar.dart';
import 'package:absen/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

TextEditingController nikController = TextEditingController(text: "");
TextEditingController passwordController = TextEditingController(text: "");

bool _rememberMe = false;
bool _isLoading = false;
Timer _timer;
List<AuthModel> listUser = [];
int index = 0;
// ignore: non_constant_identifier_names
final url_Auth = Uri.parse("http://api.picosd.com/oauth/api/auth");
var jsonData;

class _LoginScreenState extends State<LoginScreen> {
  Future _signIn(String nik, String password) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var response =
          await http.post(url_Auth, body: {'nik': nik, 'password': password});
      jsonData = jsonDecode(response.body)["data"];
      if (response.statusCode == 200) {
        setState(() {
          sharedPreferences.setString("token", jsonData['token']);
          _isLoading = false;
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Home()),
              (route) => false);
        });
      } else {
        setState(() {
          _isLoading = false;
          alertDanger("Username or Password incorrect");
        });
      }
    } catch (e) {
      print(e);
    }
  }

  /// alert
  void alertDanger(String message) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        _timer = Timer(Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
        return AlertDialog(
            title: Container(
          child: Column(
            children: [
              LineIcon(
                LineIcons.timesCircle,
                color: Colors.red,
                size: 60,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'WARNING',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red[300],
                    fontFamily: 'Quattro'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                message,
                style: TextStyle(
                    fontSize: 16, color: Colors.black54, fontFamily: 'Quattro'),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
      },
    ).then((val) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    });
  }

  Widget _buildNik() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: kBoxDecorationStyleLogin,
          height: 50.0,
          child: TextFormField(
            key: Key("nik"),
            controller: nikController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                LineIcons.fingerprint,
                color: Colors.blue,
                size: 20,
              ),
              hintText: 'Enter your Nik',
              hintStyle: kHintTextStyle,
            ),
            onSaved: (value) {
              nikController.text = value;
            },
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
          child: TextFormField(
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
          // ignore: deprecated_member_use
          : RaisedButton(
              elevation: 5.0,
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                _signIn(nikController.text, passwordController.text);
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
                              horizontal: 50.0,
                              vertical: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Form(
                                  child: Column(
                                    children: [
                                      _buildNik(),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      _buildPasswordTF(),
                                    ],
                                  ),
                                ),
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
