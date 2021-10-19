import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manipaldubai/constants/constants.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';

class DailyAttendance extends StatefulWidget {
  @override
  _DailyAttendanceState createState() => _DailyAttendanceState();
}

class _DailyAttendanceState extends State<DailyAttendance> {

  // List<String> _year = ['2021','2020','2019'];
  // List<String> _months = ['January','February','March','April','May','June','July','August','September','October','November','December'];
  DateTime selectedTimeFrom = DateTime.now();
  DateTime selectedTimeTo = DateTime.now();

  TextEditingController _fromDate = TextEditingController();
  TextEditingController _toDate = TextEditingController();


  Future<Null> _selectTimeFrom(BuildContext context) async {
    final DateTime picked_s = await showDatePicker(
        context: context,
        firstDate:DateTime(2000),
        lastDate: DateTime.now(),
        initialDate: selectedTimeFrom , builder: (BuildContext context, Widget child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child,
      );});

    if (picked_s != null)
      setState(() {
        selectedTimeFrom = picked_s;
        _fromDate.text = DateFormat('dd-MMM-yyyy').format(selectedTimeFrom);
      });
  }

  Future<Null> _selectTimeTO(BuildContext context) async {
    final DateTime picked_s = await showDatePicker(
        context: context,
        firstDate: selectedTimeFrom,
        lastDate: DateTime.now(),
        initialDate: selectedTimeTo , builder: (BuildContext context, Widget child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child,
      );});

    if (picked_s != null)
      setState(() {
        selectedTimeTo = picked_s;
        _toDate.text = DateFormat('dd-MMM-yyyy').format(selectedTimeTo);
      });
  }

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    _selectTimeFrom(context);
                  },
                  child: Container(
                    width: SizeConfig.getScreenWidth(context) * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xFFF9F9F9),
                        border: Border.all(color: Colors.grey,width: 0.2)

                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_fromDate.text.isEmpty ? 'From' : _fromDate.text,style: TextStyles.heading1,),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12,),
                InkWell(
                  onTap: (){
                    _selectTimeTO(context);
                  },
                  child: Container(
                    width: SizeConfig.getScreenWidth(context) * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xFFF9F9F9),
                      border: Border.all(color: Colors.grey,width: 0.2)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_toDate.text.isEmpty ? 'To' : _toDate.text,style: TextStyles.heading1,),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
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
