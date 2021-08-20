import 'package:flutter/material.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/app_drop_down2.dart';

import 'package:unikul/utils/widgets/my_app_bar_2.dart';
class SubmittedAttendance extends StatefulWidget {
  @override
  _SubmittedAttendanceState createState() => _SubmittedAttendanceState();
}

class _SubmittedAttendanceState extends State<SubmittedAttendance> {
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
        ],
      ),
    );
  }
}
