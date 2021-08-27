import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unikul/utils/Routes/routes.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/app_drop_down2.dart';
import 'package:unikul/utils/widgets/textfield.dart';

class SummaryAttendance extends StatefulWidget {
  @override
  _SummaryAttendanceState createState() => _SummaryAttendanceState();
}

class _SummaryAttendanceState extends State<SummaryAttendance> {

  TextEditingController _fromDate = TextEditingController();
  TextEditingController _endDate = TextEditingController();

  DateTime selectedTime = DateTime.now();

  Future<Null> _selectTime(BuildContext context,TextEditingController controller) async {
    final DateTime picked_s = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2099),
        initialDate: selectedTime, builder: (BuildContext context, Widget child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child,
      );});

    if (picked_s != null)
      setState(() {
        selectedTime = picked_s;
        controller.text = DateFormat('dd-MMM-yyyy').format(selectedTime);
      });
  }

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
                  onTap: (){
                    _selectTime(context,_fromDate);
                  },
                  controller: _fromDate,
                  title: 'From date',
                  defaultValidators: [],
                  readOnly: true,
                  suffix: Icon(Icons.calendar_today_outlined),
                ),
              ),
              Container(
                width: SizeConfig.getScreenWidth(context) * 0.42,
                child: AppTextField(
                  onTap: (){
                    _selectTime(context,_endDate);
                  },
                  controller: _endDate,
                  title: 'To date',
                  defaultValidators: [], readOnly: true,
                  suffix: Icon(Icons.calendar_today_outlined),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppButton(text: 'Search', onPressed: (){
              Navigator.push(context, Routes.classAttendanceSummary());
            }),
          ),
        ],
      ),
    );
  }
}
