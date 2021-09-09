import 'package:flutter/material.dart';

class PageSetting extends StatefulWidget {
  @override
  _PageSettingState createState() => _PageSettingState();
}

class _PageSettingState extends State<PageSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text("Setting"),
        ));
  }
}
