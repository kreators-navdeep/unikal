// To parse this JSON data, do
//
//     final internalMarksModel = internalMarksModelFromJson(jsonString);

import 'dart:convert';

InternalMarksModel internalMarksModelFromJson(String str) => InternalMarksModel.fromJson(json.decode(str));

String internalMarksModelToJson(InternalMarksModel data) => json.encode(data.toJson());

class InternalMarksModel {
  InternalMarksModel({
    this.status,
    this.details,
  });

  String status;
  List<Detail> details;

  factory InternalMarksModel.fromJson(Map<String, dynamic> json) => InternalMarksModel(
    status: json["status"],
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    this.rowNumber,
    this.assignmentNo,
    this.subjectCode,
    this.subjectName,
    this.assignmentDescription,
    this.examMethodCode,
    this.maximumMark,
    this.marksObtained,
    this.maximumWeightage,
    this.weightageObtained,
  });

  String rowNumber;
  String assignmentNo;
  String subjectCode;
  String subjectName;
  String assignmentDescription;
  String examMethodCode;
  int maximumMark;
  dynamic marksObtained;
  dynamic maximumWeightage;
  dynamic weightageObtained;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    rowNumber: json["RowNumber"],
    assignmentNo: json["Assignment No_"],
    subjectCode: json["SubjectCode"],
    subjectName: json["SubjectName"],
    assignmentDescription: json["Assignment Description"],
    examMethodCode: json["Exam Method Code"],
    maximumMark: json["Maximum Mark"],
    marksObtained: json["Marks Obtained"],
    maximumWeightage: json["Maximum Weightage"],
    weightageObtained: json["Weightage Obtained"],
  );

  Map<String, dynamic> toJson() => {
    "RowNumber": rowNumber,
    "Assignment No_": assignmentNo,
    "SubjectCode": subjectCode,
    "SubjectName": subjectName,
    "Assignment Description": assignmentDescription,
    "Exam Method Code": examMethodCode,
    "Maximum Mark": maximumMark,
    "Marks Obtained": marksObtained,
    "Maximum Weightage": maximumWeightage,
    "Weightage Obtained": weightageObtained,
  };
}
