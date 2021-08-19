import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/appCheckBox.dart';
import 'package:unikul/utils/widgets/data_container.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';
import 'package:unikul/utils/widgets/my_app_bar_2.dart';

class PublishInternalMarksPage extends StatefulWidget {
  final String title;
  final String course;
  final String subject;
  final String section;

  PublishInternalMarksPage({this.title,this.subject,this.course,this.section});
  @override
  _PublishInternalMarksPageState createState() => _PublishInternalMarksPageState();
}

class _PublishInternalMarksPageState extends State<PublishInternalMarksPage> {


  _buildMarksBox(){
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('190103017',style: TextStyle(color: Colors.grey[600],fontSize: SizeConfig.textMultiplier * 2),),
                Text('Roll No. 23',style: TextStyle(color: Colors.grey[800],fontSize: SizeConfig.textMultiplier * 2),)

              ],
            ),
            SizedBox(height: 6,),
            Text('MUHAMMED FAYEZ YUSUF',style: TextStyles.bodyText1BlackLarge,),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AppCheckBox(),
                    SizedBox(width: 16,),
                    Text('Present',style: TextStyles.bodyText1BlackLarge,)
                  ],
                ),
                Container(
                  height: 45,
                  width: SizeConfig.getScreenWidth(context) * 0.55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey,width: 0.5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        alignment: Alignment.center,
                        width: SizeConfig.getScreenWidth(context) * 0.35 - 1,
                        child: Text('23.0',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2,fontWeight: FontWeight.w600),),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            color: Color(0xFFF9F9F9)
                        ),
                      ),
                      Container(
                        height: 45,
                        alignment: Alignment.center,
                        width: SizeConfig.getScreenWidth(context) * 0.2,
                        child: Text('Marks',style: TextStyle(color: Color(0xFF83898D),fontSize: SizeConfig.textMultiplier * 2,fontWeight: FontWeight.w600),),
                        decoration: BoxDecoration(
                            color: Color(0xFFE4E6E8),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: widget.title,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.course,style: TextStyles.subTitle,),
              SizedBox(height: 6,),
              Text(widget.subject,style: TextStyles.bodyText1BlackMedium,),
              SizedBox(height: 6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.section,style: TextStyles.subTitle,),
                  Text('Strength : 50',style: TextStyles.subTitle,),
                  Text('Max Marks : 100',style: TextStyles.subTitle,)
                ],
              ),
              SizedBox(height: 16,),
              DataContainer(
                data: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('23 Nov 2020',style: TextStyles.bodyText1BlackLarge,),
                    Icon(Icons.calendar_today_outlined)
                  ],
                ),
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  AppCheckBox(),
                  SizedBox(width: 16,),
                  Text('All Present',style: TextStyles.bodyText1BlackLarge,)
                ],
              ),
              SizedBox(height: 25,),
              Column(
                children: List.generate(5, (index){
                  return _buildMarksBox();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
