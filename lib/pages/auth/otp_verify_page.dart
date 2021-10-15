import 'dart:async';

import 'package:flutter/material.dart';
import 'package:manipaldubai/constants/constants.dart';
import 'package:manipaldubai/utils/Routes/routes.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/my_app_bar.dart';
import 'package:manipaldubai/utils/widgets/showLoading.dart';
import 'package:manipaldubai/utils/widgets/textfield.dart';

class OTPVerifyPage extends StatefulWidget {
  @override
  _OTPVerifyPageState createState() => _OTPVerifyPageState();
}

class _OTPVerifyPageState extends State<OTPVerifyPage> {

  var focusNode1 = FocusNode();
  var focusNode2 = FocusNode();
  var focusNode3 = FocusNode();
  var focusNode4 = FocusNode();

  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  _buildOTPVerify(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('OTP Verification',style: TextStyle(fontSize: SizeConfig.textMultiplier * 4,fontWeight: FontWeight.w600,color: Colors.blueGrey[800]),),
          SizedBox(height: 10,),
          Text('Enter the OTP sent to',style: TextStyle(color: Colors.grey[600]),),
          SizedBox(height: 20,),
          Text('shreya.jaiswal@gmail.com',style: TextStyles.heading1,),
          SizedBox(height: 20,),
          Container(
            width: SizeConfig.getScreenWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 50,
                          child:  AppTextField(
                            controller: _controller1,
                            focusNode: focusNode1,
                            defaultValidators: [],
                            maxLength: 1,
                            textInputType: TextInputType.phone,
                            obscureText: true,
                            onChanged: (val){
                              if(val.length == 1){
                                focusNode2.requestFocus();
                              }
                            },
                            validator: (val){
                              return val.isEmpty ? "" : null;
                            },
                          )
                      ),
                      SizedBox(width: 10,),
                      Container(
                          width: 50,
                          child: AppTextField(
                            controller: _controller2,
                            focusNode: focusNode2,
                            defaultValidators: [],
                            maxLength: 1,
                            textInputType: TextInputType.phone,
                            obscureText: true,
                            onChanged: (val){
                              if(val.length == 1){
                                focusNode3.requestFocus();
                              }else if(val.length == 0){
                                focusNode1.requestFocus();
                              }
                            },
                            validator: (val){
                              return val.isEmpty ? "" : null;
                            },
                          )
                      ),
                      SizedBox(width: 10,),
                      Container(
                          width: 50,
                          child:  AppTextField(
                            controller: _controller3,
                            focusNode: focusNode3,
                            defaultValidators: [],
                            maxLength: 1,
                            obscureText: true,
                            textInputType: TextInputType.phone,
                            onChanged: (val){
                              if(val.length == 1){
                                focusNode4.requestFocus();
                              }else if(val.length == 0){
                                focusNode2.requestFocus();
                              }
                            },
                            validator: (val){
                              return val.isEmpty ? "" : null;
                            },
                          )
                      ),
                      SizedBox(width: 10,),
                      Container(
                          width: 50,
                          child:  AppTextField(
                            controller: _controller4,
                            focusNode: focusNode4,
                            defaultValidators: [],
                            maxLength: 1,
                            obscureText: true,
                            textInputType: TextInputType.phone,
                            onChanged: (val){
                              if(val.length == 1){
                                focusNode4.unfocus();
                              }else if(val.length == 0){
                                focusNode3.requestFocus();
                              }
                            },
                            validator: (val){
                              return val.isEmpty ? "" : null;
                            },
                          )
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                _start == 0 ? TextButton(
                    onPressed: (){
                      startTimer();
                    },
                    child: Text('Resend OTP',style: TextStyle(fontWeight: FontWeight.w600,decoration: TextDecoration.underline,color: Colors.black),))
                    : Text("00 : $_start",style: TextStyle(color: Colors.red,fontSize: SizeConfig.textMultiplier * 2.6,fontWeight: FontWeight.w600),),

              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: SizeConfig.getScreenWidth(context),
            child: ElevatedButton(
                onPressed: ()async{
                  if (!_formKey.currentState.validate()) {
                    return null;
                  }
                  _formKey.currentState.save();
                  Navigator.push(context, Routes.resetPassword());
                },
                style: ElevatedButton.styleFrom(
                    primary: themeColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                ),
                child: Text('Verify',style: TextStyle(fontWeight: FontWeight.w600),)
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: '',),
      body: _buildOTPVerify(),
    );
  }

  Timer _timer;
  int _start;

  void startTimer() {
    _start = 60;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  sendOTP(value)async{
      setState(() {
        startTimer();
        focusNode1.requestFocus();
        _controller1.clear();
        _controller2.clear();
        _controller3.clear();
        _controller4.clear();
      });
  }
}
