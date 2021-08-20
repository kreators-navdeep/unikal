import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unikul/constants/constants.dart';
import 'package:unikul/utils/Routes/routes.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/app_drop_down2.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';
import 'package:unikul/utils/widgets/my_app_bar_2.dart';

class InternalMarksPage extends StatefulWidget {
  @override
  _InternalMarksPageState createState() => _InternalMarksPageState();
}

class _InternalMarksPageState extends State<InternalMarksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, Routes.pendingMarks());
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: themeGreen,width: 0.5 ),
                  color: themeGreen.withOpacity(0.1)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Pending Internal Marks',style: TextStyles.heading1,),
                    Text('09',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.5,fontWeight: FontWeight.w600,color: themeGreen),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 16,),
            Text('Internal Marks Entry',style:TextStyles.heading1,),
            SizedBox(height: 16,),
            AppDropDown2(
              title: 'Semester',
              items: [],
            ),
            AppDropDown2(
              title: 'Program',
              items: [],
            ),
            AppDropDown2(
              title: 'Course',
              items: [],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: AppButton(text: 'Search', onPressed: (){}),
            ),
            SizedBox(height: 16,),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(color: Colors.grey,width: 0.5)
              ),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, Routes.publishInternalMarks(
                      title : 'Internal Session 1',subject: 'MME 2152 - MANUFACTURING TECHNOLOGY',course: '0106 - BTech - Mechanical Engineering',section: 'Section A')
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              OutlinedButton(
                                  onPressed: (){},
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Theme.of(context).accentColor.withOpacity(0.1),

                                  ),
                                  child: Text('INTERNAL SESSION 1',
                                    style: TextStyle(
                                        fontSize: SizeConfig.textMultiplier * 1.5,
                                        color: Theme.of(context).accentColor
                                    ),
                                  )
                              ),
                              SizedBox(width: 10,),
                              Text('Section A',style: TextStyle(fontWeight: FontWeight.w400,),)
                            ],
                          ),
                          Text('Released',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w400,fontSize: SizeConfig.textMultiplier * 2),)
                        ],
                      ),
                      SizedBox(height: 6,),
                      Text('0106 - BTech - Mechanical Engineering',style: TextStyles.subTitle,),
                      SizedBox(height: 6,),
                      Text('MME 2152 - MANUFACTURING TECHNOLOGY',style: TextStyles.bodyText1BlackLarge,),
                      SizedBox(height: 6,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('CORE',style: TextStyles.subTitle,),
                          Text('Semester III',style: TextStyles.subTitle,),
                          Text('23 Nov 2020',style: TextStyles.subTitle,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
