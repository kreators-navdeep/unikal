import 'package:flutter/material.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/app_drop_down2.dart';



class MarkAttendance extends StatefulWidget {
  @override
  _MarkAttendanceState createState() => _MarkAttendanceState();
}

class _MarkAttendanceState extends State<MarkAttendance> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppButton(text: 'Search', onPressed: (){}),
          ),
          SizedBox(height: 20,),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(color: Colors.grey,width: 0.5)
            ),
            child: InkWell(
              onTap: (){

              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                            onPressed: (){},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Theme.of(context).accentColor.withOpacity(0.1),

                            ),
                            child: Text('LAB',
                              style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 1.5,
                                  color: Theme.of(context).accentColor
                              ),
                            )
                        ),
                        Text('Section A',style: TextStyle(fontWeight: FontWeight.w400,),),
                        Text('19:00-22:00',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w400,fontSize: SizeConfig.textMultiplier * 2),)
                      ],
                    ),
                    SizedBox(height: 6,),
                    Text('Mechanical Lab -I',style: TextStyles.bodyText1BlackLarge,),
                    SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Batch 2',style: TextStyles.subTitle,),
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
    );
  }
}
