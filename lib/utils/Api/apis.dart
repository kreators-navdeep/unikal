import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class Api extends ChangeNotifier{

  final Dio _dio;
  Api(this._dio);

  bool _isLoading;

  void init() async {
    _isLoading = false;
  }


}