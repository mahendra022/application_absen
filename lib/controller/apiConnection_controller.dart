import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:absen/model/auth_model.dart';
import 'package:flutter/material.dart';

List<AuthModel> listUser = [];
int index = 0;
final url_Auth = Uri.parse(
    "https://script.google.com/macros/s/AKfycbzefQWpkE31t5d9Mt0khhs0W6ia7Ft3eFPKwS20yW3BNr46HtM/exec");

/// Api connection auth
signIn(String email, String password) async {
  var getEmail = email;
  var getPassword = password;
  var response = await http.get(url_Auth);
  final jsonItems = json.decode(response.body);
  for (Map user in jsonItems) {
    listUser.add(AuthModel.fromMap(user));
    if (getEmail == listUser[index].email &&
        getPassword == listUser[index].password) {
      print('email tersedia');
      index++;
    } else {
      index++;
      print('email or password incorrect');
    }
  }
}
