import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unikul/constants/constants.dart';
import 'package:unikul/utils/Api/apis.dart';
import 'package:unikul/utils/Routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unikul/utils/size_config.dart';

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
    Api api = Provider.of<Api>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();

        Future.delayed(Duration(seconds: splashTime),(){
          if(prefs.getString('accessKey') != null || prefs.getString('login') != null){

            api.setUserId = prefs.getString('loginId');
            api.setAccessKey = prefs.getString('accessKey');

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
