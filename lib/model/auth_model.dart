import 'package:meta/meta.dart';

class AuthModel {
  AuthModel({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.nik,
    @required this.password,
    @required this.groupId,
    @required this.uuidAdmin,
    @required this.phone,
    @required this.codeProject,
    @required this.images,
    @required this.norek,
    @required this.active,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.deletedAt,
  });

  final int id;
  final String name;
  final String email;
  final int nik;
  final String password;
  final int groupId;
  final String uuidAdmin;
  final int phone;
  final String codeProject;
  final String images;
  final int norek;
  final int active;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  factory AuthModel.fromMap(Map<String, dynamic> json) => AuthModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        nik: json["nik"],
        password: json["password"],
        groupId: json["group_id"],
        uuidAdmin: json["uuid_admin"],
        phone: json["phone"],
        codeProject: json["code_project"],
        images: json["images"],
        norek: json["norek"],
        active: json["active"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "nik": nik,
        "password": password,
        "group_id": groupId,
        "uuid_admin": uuidAdmin,
        "phone": phone,
        "code_project": codeProject,
        "images": images,
        "norek": norek,
        "active": active,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
