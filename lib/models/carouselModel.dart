// To parse this JSON data, do
//
//     final carouselModel = carouselModelFromJson(jsonString);

import 'dart:convert';

CarouselModel carouselModelFromJson(String str) => CarouselModel.fromJson(json.decode(str));

String carouselModelToJson(CarouselModel data) => json.encode(data.toJson());

class CarouselModel {
  CarouselModel({
    this.status,
    this.imageList,
  });

  String status;
  List<String> imageList;

  factory CarouselModel.fromJson(Map<String, dynamic> json) => CarouselModel(
    status: json["status"],
    imageList: List<String>.from(json["imageList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "imageList": List<dynamic>.from(imageList.map((x) => x)),
  };
}
