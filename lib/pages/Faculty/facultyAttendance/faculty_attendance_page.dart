import 'package:flutter/material.dart';
import 'package:manipaldubai/pages/Faculty/facultyAttendance/mark_attendance.dart';
import 'package:manipaldubai/pages/Faculty/facultyAttendance/report_attendance.dart';
import 'package:manipaldubai/pages/Faculty/facultyAttendance/submitted_attendance.dart';
import 'package:manipaldubai/pages/Faculty/facultyAttendance/summary_attendance.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/my_app_bar_2.dart';


class FacultyAttendancePage extends StatefulWidget {
  @override
  _FacultyAttendancePageState createState() => _FacultyAttendancePageState();
}

class _FacultyAttendancePageState extends State<FacultyAttendancePage> {

  int _selectedIndex = 0;

  List<String> _item = ['Mark Attendance','Submitted','Summary','Report',];

  _buildTab(String text,index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: _selectedIndex == index ? Theme.of(context).accentColor : Colors.white  ,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey,width: 0.3)
        ),
        padding: const EdgeInsets.symmetric(vertical: 6,),
        width: 140,
        alignment: Alignment.center,
        child: Text(text,style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.8,color: _selectedIndex == index ? Colors.white : Colors.black),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Theme.of(context).primaryColor,width: 0.5),
                  color: Theme.of(context).primaryColor.withOpacity(0.1)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pending Attendance',style: TextStyles.heading1,),
                  Text('09',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.5,fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor),)
                ],
              ),
            ),
            SizedBox(height: 14,),
            Container(
              height: SizeConfig.getScreenHeight(context) * 0.05,
              width: SizeConfig.getScreenWidth(context),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx,index){
                    return _buildTab(_item[index], index);
                    },
                  separatorBuilder: (ctx,index){
                    return SizedBox(width: 10,);
                    },
                  itemCount: _item.length),
            ),
            SizedBox(height: 20,),
            _selectedIndex == 0
                ? MarkAttendance() : _selectedIndex == 1
                ? SubmittedAttendance() : _selectedIndex == 2
                ? SummaryAttendance() : _selectedIndex == 3
                ? ReportAttendance() :SizedBox()
          ],
        ),
      ),
    );
  }
}
