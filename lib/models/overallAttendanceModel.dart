// To parse this JSON data, do
//
//     final overallAttendanceModel = overallAttendanceModelFromJson(jsonString);

import 'dart:convert';

OverallAttendanceModel overallAttendanceModelFromJson(String str) => OverallAttendanceModel.fromJson(json.decode(str));

String overallAttendanceModelToJson(OverallAttendanceModel data) => json.encode(data.toJson());

class OverallAttendanceModel {
  OverallAttendanceModel({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory OverallAttendanceModel.fromJson(Map<String, dynamic> json) => OverallAttendanceModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.overallSemAttendancePercentage,
    this.semAttendanceDetails,
  });

  int overallSemAttendancePercentage;
  List<SemAttendanceDetail> semAttendanceDetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    overallSemAttendancePercentage: json["overallSemAttendancePercentage"],
    semAttendanceDetails: List<SemAttendanceDetail>.from(json["semAttendanceDetails"].map((x) => SemAttendanceDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "overallSemAttendancePercentage": overallSemAttendancePercentage,
    "semAttendanceDetails": List<dynamic>.from(semAttendanceDetails.map((x) => x.toJson())),
  };
}

class SemAttendanceDetail {
  SemAttendanceDetail({
    this.academicYear,
    this.studentNo,
    this.subjectCode,
    this.subjectName,
    this.semester,
    this.totalClass,
    this.totalAttendanceTaken,
    this.totalPresent,
    this.totalAbsent,
    this.attendancepercentage,
    this.batchCodeAt,
    this.subjectClass,
    this.subjectType,
  });

  String academicYear;
  String studentNo;
  String subjectCode;
  String subjectName;
  String semester;
  int totalClass;
  int totalAttendanceTaken;
  int totalPresent;
  int totalAbsent;
  int attendancepercentage;
  String batchCodeAt;
  String subjectClass;
  String subjectType;

  factory SemAttendanceDetail.fromJson(Map<String, dynamic> json) => SemAttendanceDetail(
    academicYear: json["Academic Year"],
    studentNo: json["StudentNo"],
    subjectCode: json["SubjectCode"],
    subjectName: json["SubjectName"],
    semester: json["Semester"],
    totalClass: json["TotalClass"],
    totalAttendanceTaken: json["Total Attendance Taken"],
    totalPresent: json["TotalPresent"],
    totalAbsent: json["TotalAbsent"],
    attendancepercentage: json["Attendancepercentage"],
    batchCodeAt: json["BatchCodeAT"],
    subjectClass: json["SubjectClass"],
    subjectType: json["SubjectType"],
  );

  Map<String, dynamic> toJson() => {
    "Academic Year": academicYear,
    "StudentNo": studentNo,
    "SubjectCode": subjectCode,
    "SubjectName": subjectName,
    "Semester": semester,
    "TotalClass": totalClass,
    "Total Attendance Taken": totalAttendanceTaken,
    "TotalPresent": totalPresent,
    "TotalAbsent": totalAbsent,
    "Attendancepercentage": attendancepercentage,
    "BatchCodeAT": batchCodeAt,
    "SubjectClass": subjectClass,
    "SubjectType": subjectType,
  };
}
