import 'package:flutter/material.dart';
import 'package:unikul/constants/constants.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';

class OverallAttendance extends StatefulWidget {
  @override
  _OverallAttendanceState createState() => _OverallAttendanceState();
}

class _OverallAttendanceState extends State<OverallAttendance> {


  _buildSubjectReportBlock(){
    return Column(
      children: List.generate(10, (index) {
        return  Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Financial Management',style: TextStyles.heading2,),
                          SizedBox(height: 4,),
                          Text('AY 2021',style: TextStyles.bodyText1Black,),
                          SizedBox(height: 6,),
                          Text('Subject Code : FM101',style: TextStyles.subTitle,)
                        ],
                      ),
                      OutlinedButton(
                          onPressed: (){},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: themeGreen.withOpacity(0.2),

                          ),
                          child: Text('THEORY',
                            style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 2,
                                color: themeGreen
                            ),
                          )
                      )
                    ],
                  ),
                ),
                Divider(),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('130',style: TextStyles.heading1,),
                            SizedBox(height: 4,),
                            Text('Total Classes',style: TextStyles.subTitle,)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('118',style: TextStyles.heading1,),
                            SizedBox(height: 4,),
                            Text('Days Present',style: TextStyles.subTitle,)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('12',style: TextStyles.heading1,),
                            SizedBox(height: 4,),
                            Text('Days Absent',style: TextStyles.subTitle,)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('82%',style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 2,
                                fontWeight: FontWeight.w500,
                                color: themeGreen
                            ),),
                            SizedBox(height: 4,),
                            Text('Attendance',style: TextStyles.subTitle,)
                          ],
                        ),
                      ],
                    )
                )
              ],
            ),
          ),
        );
      }),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.getScreenHeight(context) * 0.75,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Registration No: 200108002',style: TextStyles.subTitle,),
                Text('SLCM No: 379469',style: TextStyles.subTitle,),
              ],
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: SizeConfig.getScreenWidth(context) * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xFFF9F9F9),
                      border: Border.all(color: Colors.grey,width: 0.2)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    onChanged: (val){},
                    hint: Text('Select'),
                    items: [
                      DropdownMenuItem(child: Text('Semester 1')),
                      DropdownMenuItem(child: Text('Semester 2')),
                      DropdownMenuItem(child: Text('Semester 3')),
                      DropdownMenuItem(child: Text('Semester 4')),
                      DropdownMenuItem(child: Text('Semester 5')),
                      DropdownMenuItem(child: Text('Semester 6')),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('82.4 %',style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 3,
                          fontWeight: FontWeight.w500,
                          color: themeGreen
                      ),),
                      SizedBox(height: 6,),
                      Text('Overall Attendance',style: TextStyles.bodyText1Black,)
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 16,),
            _buildSubjectReportBlock()
          ],
        ),
      ),
    );
  }
}
