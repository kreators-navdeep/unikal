import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manipaldubai/constants/constants.dart';
import 'package:manipaldubai/models/dailyAttendanceModel.dart';
import 'package:manipaldubai/utils/Api/apis.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/showLoading.dart';
import 'package:provider/provider.dart';

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


  @override
  void initState() {
    super.initState();
    _toDate.text = DateFormat('yyyy-MM-dd').format(selectedTimeTo);
  }

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
        selectedTimeTo = DateTime.now();
        _toDate.text = DateFormat('yyyy-MM-dd').format(selectedTimeTo);
        selectedTimeFrom = picked_s;
        _fromDate.text = DateFormat('yyyy-MM-dd').format(selectedTimeFrom);
      });
  }

  // Future<Null> _selectTimeTO(BuildContext context) async {
  //   final DateTime picked_s = await showDatePicker(
  //       context: context,
  //       firstDate: selectedTimeFrom,
  //       lastDate: DateTime.now(),
  //       initialDate: selectedTimeTo , builder: (BuildContext context, Widget child) {
  //     return MediaQuery(
  //       data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
  //       child: child,
  //     );});
  //
  //   if (picked_s != null)
  //     {
  //       setState(() {
  //         selectedTimeTo = picked_s;
  //         _toDate.text = DateFormat('yyyy-MM-dd').format(selectedTimeTo);
  //
  //       });
  //
  //     }
  // }

  _buildAttendanceBlock(){
    return FutureBuilder(
      future: Provider.of<ApiProvider>(context,listen: false).getDailyAttendance(fromDate: _fromDate.text,toDate: _toDate.text),
      builder: (ctx,snapshot){
      if(snapshot.hasData){
        DailyAttendanceModel _attendance = snapshot.data;
        return Container(
          height: SizeConfig.getScreenHeight(context) * 0.7,
          child: RefreshIndicator(
            onRefresh: (){
              return Future.delayed(Duration(milliseconds: 1000),(){
                setState(() {});
              });
            },
            child: ListView.builder(
                itemBuilder: (ctx,index){
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
                              Container(
                                  width: SizeConfig.getScreenWidth(context) * 0.6,
                                  child: Text('${_attendance.attendancedetails[index].description}',style: TextStyles.heading2,)),
                              SizedBox(height: 6,),
                              Text('Type - ${_attendance.attendancedetails[index].subjectType}',style: TextStyles.bodyText1Black,),
                              SizedBox(height: 4,),
                              Text('${_attendance.attendancedetails[index].subjectClass}',style: TextStyles.bodyText1Black,),
                              SizedBox(height: 4,),
                              Text('${_attendance.attendancedetails[index].subjectCode}',style: TextStyles.subTitle,)
                            ],
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: _attendance.attendancedetails[index].status.toLowerCase() == 'absent' ? Theme.of(context).errorColor.withOpacity(0.2) : themeColor.withOpacity(0.2) ,
                                border: Border.all(color: _attendance.attendancedetails[index].status.toLowerCase() == 'absent' ? Theme.of(context).errorColor: themeColor,width: 0.2)
                            ),
                            child: Text(_attendance.attendancedetails[index].status.toLowerCase() == 'absent' ? 'A' : 'P',style: TextStyle(fontWeight: FontWeight.w500,fontSize: SizeConfig.textMultiplier * 2.5,color: _attendance.attendancedetails[index].status.toLowerCase() == 'absent' ? Theme.of(context).errorColor : themeColor) ,),
                          )
                        ],
                      ),
                    ),
                  );
                },
              itemCount: _attendance.attendancedetails.length,
            ),
          ),
        );
        // return Column(
        //   children: List.generate(_attendance.attendancedetails.length, (index) {
        //     return Card(
        //       elevation: 3,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(6),
        //         side: BorderSide(color: Theme.of(context).dividerColor,width: 0.2),
        //       ),
        //       child: Container(
        //         padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Container(
        //                     width: SizeConfig.getScreenWidth(context) * 0.6,
        //                     child: Text('${_attendance.attendancedetails[index].description}',style: TextStyles.heading2,)),
        //                 SizedBox(height: 6,),
        //                 Text('Type - ${_attendance.attendancedetails[index].subjectType}',style: TextStyles.bodyText1Black,),
        //                 SizedBox(height: 4,),
        //                 Text('${_attendance.attendancedetails[index].subjectClass}',style: TextStyles.bodyText1Black,),
        //                 SizedBox(height: 4,),
        //                 Text('${_attendance.attendancedetails[index].subjectCode}',style: TextStyles.subTitle,)
        //               ],
        //             ),
        //             Container(
        //               width: 40,
        //               height: 40,
        //               alignment: Alignment.center,
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(6),
        //                   color: _attendance.attendancedetails[index].status.toLowerCase() == 'absent' ? Theme.of(context).errorColor.withOpacity(0.2) : themeColor.withOpacity(0.2) ,
        //                   border: Border.all(color: _attendance.attendancedetails[index].status.toLowerCase() == 'absent' ? Theme.of(context).errorColor: themeColor,width: 0.2)
        //               ),
        //               child: Text(_attendance.attendancedetails[index].status.toLowerCase() == 'absent' ? 'A' : 'P',style: TextStyle(fontWeight: FontWeight.w500,fontSize: SizeConfig.textMultiplier * 2.5,color: _attendance.attendancedetails[index].status.toLowerCase() == 'absent' ? Theme.of(context).errorColor : themeColor) ,),
        //             )
        //           ],
        //         ),
        //       ),
        //     );
        //   }),
        // );
      }else if(snapshot.hasError){
        return SizedBox();
       }
      // else if(snapshot.data == null){
      //   return Center(
      //     child: Text(_fromDate.text.isEmpty || _toDate.text.isEmpty ? 'Please select a range of date' : 'NO DATA AVAILABLE'),
      //   );
      // }
      else{
        return ShowLoading();
       }
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.getScreenHeight(context) * 0.75,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 14,),
            InkWell(
              onTap: (){
                _selectTimeFrom(context);
              },
              child: Container(
                width: SizeConfig.getScreenWidth(context) * 0.9,
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
            SizedBox(height: 14,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAttendanceBlock()
              ],
            )
          ],
        ),
      ),
    );
  }
}
