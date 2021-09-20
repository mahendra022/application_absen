import 'package:meta/meta.dart';
import 'dart:convert';

class GetDataModel {
  GetDataModel({
    @required this.user,
    @required this.token,
    @required this.loginDate,
  });

  final String user;
  final String token;
  final String loginDate;

  factory GetDataModel.fromJson(String str) =>
      GetDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetDataModel.fromMap(Map<dynamic, dynamic> json) => GetDataModel(
        user: json["user"],
        token: json["token"],
        loginDate: json["login_date"],
      );

  Map<dynamic, dynamic> toMap() => {
        "user": user,
        "token": token,
        "login_date": loginDate,
      };
}
