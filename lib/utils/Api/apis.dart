import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unikul/constants/constants.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:unikul/models/userModel.dart';

class Api extends ChangeNotifier{

  final Dio _dio;
  Api(this._dio);

  bool _isLoading = false;
  UserModel _user = UserModel();
  String _accessKey;
  String _loginUserId;
  String _userName;
  String _email;
  String _mobileNo;

  get isLoading => _isLoading;
  get user => _user;
  get loginUserId => _loginUserId;
  get accessKey => _accessKey;
  get userName => _userName;
  get email => _email;
  get mobileNo => _mobileNo;

  void init() async {
    _isLoading = false;
    //190104284
  }

  // set setUserId(String userId) {
  //   _loginUserId = userId;
  //   notifyListeners();
  // }
  //
  // set setAccessKey(String accessKey) {
  //   _accessKey = accessKey;
  //   notifyListeners();
  // }

  setUserDetails({String userId,String userName,String email,String accessKey,String mobileNo}){
    _loginUserId = userId;
    _email = email;
    _userName = userName;
    _accessKey = accessKey;
    _mobileNo = mobileNo;

    notifyListeners();
  }


  Future<Map<String,dynamic>> login(
      {String userId, String password}) async {
    try {
      _isLoading = true;
      notifyListeners();
      final res = await _dio.post(
        baseUrl + 'auth/unikulvalidatengetrole',
        data: {'login':userId,'Passwd':password},
      );
      print(res.data);
      _user = UserModel.fromJson(res.data);
      SharedPreferences prefs = await SharedPreferences.getInstance();

      _accessKey = _user.accessKey;
      _loginUserId = userId;
      _email = _user.email;
      _mobileNo = _user.mobileNo;
      _userName = _user.userName;
      setUserDetails(
        userName: _user.userName,
        userId: userId,
        mobileNo: _user.mobileNo,
        email: _user.email,
        accessKey: _user.accessKey
      );

      await prefs.setString('accessKey', _user.accessKey);
      await prefs.setString('userId', userId);
      await prefs.setString('userName', _user.userName);
      await prefs.setString('email', _user.email);
      await prefs.setString('mobileNo', _user.mobileNo);

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

  Future<void> logout(context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Phoenix.rebirth(context);
  }

  ///STUDENT

  Future<List<dynamic>> getCarouselImages() async {
    try {
      final res = await _dio.post(
        baseUrl + 'carousel/unikulgetcarouseldetails',
        data: {'login':_loginUserId,'accessKey':_accessKey},
      );
      return res.data['imageList'];
    } catch (e) {
      print(e);
      return [];
    }
  }



}