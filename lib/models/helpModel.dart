// To parse this JSON data, do
//
//     final helpModel = helpModelFromJson(jsonString);

import 'dart:convert';

HelpModel helpModelFromJson(String str) => HelpModel.fromJson(json.decode(str));

String helpModelToJson(HelpModel data) => json.encode(data.toJson());

class HelpModel {
  HelpModel({
    this.status,
    this.details,
  });

  String status;
  List<Detail> details;

  factory HelpModel.fromJson(Map<String, dynamic> json) => HelpModel(
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
    this.question,
    this.answer,
  });

  String question;
  String answer;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    question: json["question"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "answer": answer,
  };
}
