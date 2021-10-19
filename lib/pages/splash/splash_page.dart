import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:manipaldubai/constants/constants.dart';
import 'package:manipaldubai/utils/Api/apis.dart';
import 'package:manipaldubai/utils/Routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';


class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkUser();

  }

  checkUser()async{
    ApiProvider api = Provider.of<ApiProvider>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await FirebaseMessaging.instance.getToken().then((value) {
      String token = value;
      Provider.of<ApiProvider>(context, listen: false).setRegToken = token;
      prefs.setString('deviceToken', token);
    });

        Future.delayed(Duration(milliseconds: splashTime),(){
          print(prefs.getString('accessKey'));
          print(prefs.getString('userId'));
          print(prefs.getString('deviceToken'));



          if(prefs.getString('accessKey') != null && prefs.getString('userId') != null && prefs.getString('deviceToken') != null){



            api.setUserDetails(
              userId: prefs.getString('userId'),
              accessKey: prefs.getString('accessKey'),
              email: prefs.getString('email'),
              userName: prefs.getString('userName'),
              mobileNo: prefs.getString('mobileNo'),
            );

            Navigator.pushReplacement(context, Routes.spLanding());
          }
          else
            Navigator.pushReplacement(context, Routes.auth());
        });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/logo.png',width: SizeConfig.widthMultiplier * 70,fit: BoxFit.fill,)),
    );
  }
}
