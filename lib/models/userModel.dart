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
    this.userName,
    this.email,
    this.mobileNo,
  });

  String status;
  String message;
  String accessKey;
  String role;
  String userName;
  String email;
  String mobileNo;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    message: json["message"],
    accessKey: json["accessKey"],
    role: json["role"],
    userName: json["UserName"],
    email: json["Email"],
    mobileNo: json["MobileNo"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "accessKey": accessKey,
    "role": role,
    "UserName": userName,
    "Email": email,
    "MobileNo": mobileNo,
  };
}
