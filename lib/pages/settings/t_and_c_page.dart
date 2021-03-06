import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unikul/utils/Api/apis.dart';
import 'package:unikul/utils/widgets/showLoading.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class TAndCPage extends StatefulWidget {
  @override
  _TAndCPageState createState() => _TAndCPageState();
}

class _TAndCPageState extends State<TAndCPage> {

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: Provider.of<ApiProvider>(context, listen: false).getTAndC(),
            builder: (ctx,snapshot){
              print(snapshot.data);
              if(snapshot.hasData){
                return WebView(
                  initialUrl: "${snapshot.data}",
                );
              }else if(snapshot.hasError){
                return SizedBox();
              }else{
                return ShowLoading();
              }
            }
        ),
      ),
    );
  }
}
