import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:manipaldubai/constants/constants.dart';
import 'package:manipaldubai/pages/splash/splash_page.dart';
import 'package:manipaldubai/utils/Api/apis.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:appcenter/appcenter.dart';
import 'package:appcenter_analytics/appcenter_analytics.dart';
import 'package:appcenter_crashes/appcenter_crashes.dart';
import 'package:flutter/foundation.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void initAppCenter() async{
    final ios = defaultTargetPlatform == TargetPlatform.iOS;
    var app_secret = ios ? "123cfac9-123b-123a-123f-123273416a48" : "ff83b338-a199-4cf5-b8b8-3cb5ab65a978";

    await AppCenter.start(app_secret, [AppCenterAnalytics.id, AppCenterCrashes.id]);
  }

  @override
  void initState(){
    super.initState();
    initAppCenter();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiProvider(Dio()),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              ApiProvider(Dio()).init();
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.light,
                theme: ThemeData(
                    primaryColor: themeColor,
                    fontFamily: 'Noto',
                    backgroundColor: backGroundColor,
                    scaffoldBackgroundColor: Colors.white,
                  accentColor: Color(0xFF40A8FF),
                  iconTheme: IconThemeData(
                    color: Color(0xFF1E201D),
                    size: SizeConfig.imageSizeMultiplier * 5
                  )
                ),
                home: SplashPage(),
                title: 'Unikul',
              );
            },
          );
        },
      ),
    );
  }
}
