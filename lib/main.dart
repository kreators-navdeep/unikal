import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:unikul/constants/constants.dart';
import 'package:unikul/pages/splash/splash_page.dart';
import 'package:unikul/utils/Api/apis.dart';
import 'package:unikul/utils/size_config.dart';

void main() {
  return runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
