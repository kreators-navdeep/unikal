import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unikul/constants/constants.dart';
import 'package:unikul/pages/splash/splash_page.dart';
import 'package:unikul/utils/Api/apis.dart';
import 'package:unikul/utils/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Api(Dio()),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              Api(Dio()).init();
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.light,
                theme: ThemeData(
                    primaryColor: themeColor,
                    fontFamily: 'Noto',
                    backgroundColor: Colors.white,
                    scaffoldBackgroundColor: Colors.white,
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
