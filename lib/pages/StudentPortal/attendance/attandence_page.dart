import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:manipaldubai/constants/constants.dart';
import 'package:manipaldubai/pages/StudentPortal/attendance/daily_attendance.dart';
import 'package:manipaldubai/pages/StudentPortal/attendance/overall_attendance.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/my_app_bar_2.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> with SingleTickerProviderStateMixin {


  TabController _controller;
  int _selectedIndex = 0;


  List<Widget> list = [
    Tab(child: FittedBox(child: Text('Overall Attendance',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.4),))),
    Tab(child: FittedBox(child: Text('Daily Attendance',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.4)))),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = TabController(length: list.length, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(right: 15,left: 15),
        child: Column(
          children: [
            Container(
              height: SizeConfig.getScreenHeight(context) * 0.06,
              width: SizeConfig.getScreenWidth(context),
              child: TabBar(
                controller: _controller,
                tabs: list,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
              ),
            ),
            Container(
              width: SizeConfig.getScreenWidth(context),
              height: SizeConfig.getScreenHeight(context) * 0.75,
              child: TabBarView(
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  OverallAttendance(),
                  DailyAttendance()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
