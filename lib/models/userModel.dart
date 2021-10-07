// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    this.message,
    this.accessKey,
    this.role,
  });

  String status;
  String message;
  String accessKey;
  String role;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    message: json["message"],
    accessKey: json["accessKey"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "accessKey": accessKey,
    "role": role,
  };
}
