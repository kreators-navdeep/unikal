import 'package:flutter/material.dart';
import 'package:unikul/utils/Routes/routes.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/app_drop_down2.dart';
import 'package:unikul/utils/widgets/textfield.dart';
class ReportAttendance extends StatefulWidget {
  @override
  _ReportAttendanceState createState() => _ReportAttendanceState();
}

class _ReportAttendanceState extends State<ReportAttendance> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: SizeConfig.getScreenWidth(context) * 0.42,
                child: AppDropDown2(
                  title: 'Academic Year',
                  items: [],
                ),
              ),
              Container(
                width: SizeConfig.getScreenWidth(context) * 0.42,
                child: AppDropDown2(
                  title: 'Semester',
                  items: [],
                ),
              ),
            ],
          ),
          SizedBox(height: 16,),
          AppDropDown2(
            title: 'Program',
            items: [],
          ),
          AppDropDown2(
            title: 'Course',
            items: [],
          ),
          AppDropDown2(
            title: 'Registeration No.',
            items: [],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: SizeConfig.getScreenWidth(context) * 0.42,
                child: AppTextField(
                  title: 'From date',
                  defaultValidators: [],
                  enabled: false,
                  suffix: Icon(Icons.calendar_today_outlined),
                ),
              ),
              Container(
                width: SizeConfig.getScreenWidth(context) * 0.42,
                child: AppTextField(
                  title: 'To date',
                  defaultValidators: [],
                  enabled: false,
                  suffix: Icon(Icons.calendar_today_outlined),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppButton(text: 'Search', onPressed: (){
              Navigator.push(context, Routes.attendanceReport());
            }),
          ),
        ],
      ),
    );
  }
}
