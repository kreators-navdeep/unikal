import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/widgets/my_app_bar.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Notifications',
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: ListView.separated(itemBuilder: (ctx,index){
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),side: BorderSide(width: 0.5,color: Color(0xFFA5B0C2).withOpacity(0.6))),
            child: Container(
              padding: const EdgeInsets.all(14),
              child: Text('Your Application ID has been sent to your email address for Manipal University',style: TextStyle(fontSize: SizeConfig.textMultiplier *2.1,fontWeight: FontWeight.w400),),
            ),
          );
        }, separatorBuilder: (ctx,index){
          return SizedBox(height: 8,);
        }, itemCount: 1),
      ),
    );
  }
}
