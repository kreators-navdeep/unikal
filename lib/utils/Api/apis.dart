import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:unikul/constants/constants.dart';

class Api extends ChangeNotifier{

  final Dio _dio;
  Api(this._dio);

  bool _isLoading = false;

  get isLoading => _isLoading;

  void init() async {
    _isLoading = false;
  }


  Future<Map<String,dynamic>> login(
      {String userId, String password}) async {
    try {
      _isLoading = true;
      notifyListeners();
      final res = await _dio.post(
        baseUrl,
        // options: Options(headers: {'labcode': labCode}),
        data: {'login':userId,'Passwd':password},
      );
      print(res.data);
      _isLoading = false;
      notifyListeners();
      return res.data;
    } catch (e) {
      print(e);
      _isLoading = false;
      notifyListeners();
      return {'message':'Error while login'};
    }
  }


}