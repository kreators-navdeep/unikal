import 'package:flutter/material.dart';
import 'package:unikul/constants/constants.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';

class DailyAttendance extends StatefulWidget {
  @override
  _DailyAttendanceState createState() => _DailyAttendanceState();
}

class _DailyAttendanceState extends State<DailyAttendance> {

  List<String> _year = ['2021','2020','2019'];
  List<String> _months = ['January','February','March','April','May','June','July','August','September','October','November','December'];


  _buildAttendanceBlock(){

    List attendance = [true,false,true,true,true,true,false,true,true,true,true];
    return Column(
      children: List.generate(attendance.length, (index) {
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(color: Theme.of(context).dividerColor,width: 0.2),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Financial Management',style: TextStyles.heading2,),
                    SizedBox(height: 6,),
                    Text('Mr. John Mathis',style: TextStyles.bodyText1Black,),
                    SizedBox(height: 4,),
                    Text('FM101',style: TextStyles.subTitle,)

                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: attendance[index] ? themeGreen.withOpacity(0.2):Theme.of(context).errorColor.withOpacity(0.2),
                    border: Border.all(color: attendance[index] ? themeGreen : Theme.of(context).errorColor,width: 0.2)
                  ),
                  child: Text(attendance[index] ? 'P' : 'A',style: TextStyle(fontWeight: FontWeight.w500,fontSize: SizeConfig.textMultiplier * 2.5,color: attendance[index] ? themeGreen : Theme.of(context).errorColor),),
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
            SizedBox(height: 14,),
            Row(
              children: [
                Container(
                  width: SizeConfig.getScreenWidth(context) * 0.2,
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
                    hint: Text('Year'),
                    items: List.generate(_year.length, (index){
                      return DropdownMenuItem(
                        child: Text(_year[index]),
                      );
                    }),
                  ),
                ),
                SizedBox(width: 12,),
                Container(
                  width: SizeConfig.getScreenWidth(context) * 0.3,
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
                    hint: Text('Month'),
                    items: List.generate(_months.length, (index){
                      return DropdownMenuItem(
                        child: Text(_months[index]),
                      );
                    }),
                  ),
                ),

              ],
            ),
            SizedBox(height: 14,),
            _buildAttendanceBlock()
          ],
        ),
      ),
    );
  }
}
