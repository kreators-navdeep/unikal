// To parse this JSON data, do
//
//     final dailyAttendanceModel = dailyAttendanceModelFromJson(jsonString);

import 'dart:convert';

DailyAttendanceModel dailyAttendanceModelFromJson(String str) => DailyAttendanceModel.fromJson(json.decode(str));

String dailyAttendanceModelToJson(DailyAttendanceModel data) => json.encode(data.toJson());

class DailyAttendanceModel {
  DailyAttendanceModel({
    this.status,
    this.attendancedetails,
  });

  String status;
  List<Attendancedetail> attendancedetails;

  factory DailyAttendanceModel.fromJson(Map<String, dynamic> json) => DailyAttendanceModel(
    status: json["status"],
    attendancedetails: List<Attendancedetail>.from(json["Attendancedetails"].map((x) => Attendancedetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "Attendancedetails": List<dynamic>.from(attendancedetails.map((x) => x.toJson())),
  };
}

class Attendancedetail {
  Attendancedetail({
    this.date,
    this.subjectCode,
    this.description,
    this.subjectType,
    this.subjectClass,
    this.status,
  });

  DateTime date;
  String subjectCode;
  String description;
  String subjectType;
  String subjectClass;
  String status;

  factory Attendancedetail.fromJson(Map<String, dynamic> json) => Attendancedetail(
    date: DateTime.parse(json["Date"]),
    subjectCode: json["Subject Code"],
    description: json["Description"],
    subjectType: json["Subject Type"],
    subjectClass: json["Subject Class"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Date": date.toIso8601String(),
    "Subject Code": subjectCode,
    "Description": description,
    "Subject Type": subjectType,
    "Subject Class": subjectClass,
    "Status": status,
  };
}
