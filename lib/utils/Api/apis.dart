import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:manipaldubai/models/dailyAttendanceModel.dart';
import 'package:manipaldubai/models/helpModel.dart';
import 'package:manipaldubai/models/internalMarksModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:manipaldubai/constants/constants.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:manipaldubai/models/overallAttendanceModel.dart';
import 'package:manipaldubai/models/userModel.dart';
import 'package:manipaldubai/pages/StudentPortal/attendance/overall_attendance.dart';
import 'package:manipaldubai/models/overallAttendanceModel.dart';
import 'package:connectivity/connectivity.dart';

class ApiProvider extends ChangeNotifier{

  final Dio _dio;
  ApiProvider(this._dio);

  bool _isLoading = false;
  UserModel _user = UserModel();
  String _accessKey;
  String _loginUserId;
  String _userName;
  String _email;
  String _mobileNo;
  String _regToken;


  get regToken => _regToken;
  get isLoading => _isLoading;
  get user => _user;
  get loginUserId => _loginUserId;
  get accessKey => _accessKey;
  get userName => _userName;
  get email => _email;
  get mobileNo => _mobileNo;




  void init() async {

    _isLoading = false;
    // "uid" : "1000800398",
    // "Passwd" : "Password123"
  }



  set setRegToken(String val){
    _regToken = val;
  }

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
        data: json.encode({
          "uid": "$userId",
          "Passwd": "$password",
          "reg_token": '$_regToken'
        }),
      );
      res.headers.add('Content-Type', 'application/json');

      print(res.data);
      if(res.data['status'] == 'success'){
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
      }
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

  Future<dynamic> getCarouselImages() async {
    try {
      final res = await _dio.post(
        baseUrl + 'carousel/unikulgetcarouseldetails',
        data: {'uid':_loginUserId,'accessKey':_accessKey},
      );
      res.headers.add('Content-Type', 'application/json');
      if(res.data['status'].toString().toLowerCase() == 'error')
        return "error";
      else
        return res.data['imageList'];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future getTAndC() async {
    try {
      print(_loginUserId);
      print(_accessKey);
      final res = await _dio.get(
        baseUrl + 'admin/unikulgettncdetails',
        queryParameters:  {'uid':_loginUserId,'accessKey':_accessKey},
      );

      return res.data['tncUrl'];
    } catch (e) {
      print(e);
    }
  }

  Future getPrivacyPolicy() async {
    try {
      final res = await _dio.get(
        baseUrl + 'admin/unikulgetprivacydetails',
        queryParameters:  {'uid':_loginUserId,'accessKey':_accessKey},
      );
      return res.data['privacyUrl'];
    } catch (e) {
      print(e);
    }
  }

  Future<OverallAttendanceModel> getOverallAttendance({String sem}) async {
    try {
      print(_accessKey);
      final res = await _dio.get(
        baseUrl + 'admin/unikulgetoverallattendancefordefault',
        queryParameters:  {'uid':_loginUserId,'accessKey':_accessKey,'sem':'$sem'},
      );
      print(res.data);
      return OverallAttendanceModel.fromJson(res.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<InternalMarksModel> getInternalMarks({String sem}) async {
    try {
      final res = await _dio.get(
        baseUrl + 'admin/unitkulgetmarksdetails',
        queryParameters:  {'uid':_loginUserId,'accessKey':_accessKey,'sem':'$sem'},
      );
      return InternalMarksModel.fromJson(res.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<DailyAttendanceModel> getDailyAttendance({String fromDate,String toDate}) async {
    try {
      print(fromDate);
      print(toDate);
      final res = await _dio.get(
        baseUrl + 'admin/unikulgetdailyattendance',
        queryParameters:  {
          'uid':_loginUserId,
          'accessKey':_accessKey,
          'fromdate': "$fromDate",
          'todate': "$toDate"
        },
      );
      print(res.data);
      return DailyAttendanceModel.fromJson(res.data);
    } catch (e) {
      print(e);
      return null;
    }
  }


  Future<dynamic> getOverallAttendancePercentage({String sem}) async {
    try {
      final res = await _dio.get(
        baseUrl + 'admin/unikulgetlandingpagedetails',
        queryParameters:  {'uid':_loginUserId,'accessKey':_accessKey,'sem':'$sem'},
      );
      res.headers.add('Content-Type', 'application/json');
      return res.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<HelpModel> getHelpData() async {
    try {
      final res = await _dio.get(
        baseUrl + 'admin/unikulgethelpdetails',
        queryParameters:  {'uid':_loginUserId,'accessKey':_accessKey},
      );
      res.headers.add('Content-Type', 'application/json');
      print(res.data);
      return HelpModel.fromJson(res.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

}