import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:manipaldubai/constants/constants.dart';
import 'package:manipaldubai/models/overallAttendanceModel.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/Api/apis.dart';
import 'package:manipaldubai/utils/widgets/showLoading.dart';

class OverallAttendance extends StatefulWidget {
  @override
  _OverallAttendanceState createState() => _OverallAttendanceState();
}

class _OverallAttendanceState extends State<OverallAttendance> {

  _buildSubjectReportBlock({List<SemAttendanceDetail> attendanceList}){
    return Container(
      height: SizeConfig.getScreenHeight(context) * 0.62,
      child: RefreshIndicator(
        onRefresh: (){
          return Future.delayed(Duration(milliseconds: 1000),(){
            setState(() {});
          });
        },
        child: ListView.builder(itemBuilder: (ctx,index){
          return Card(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: SizeConfig.getScreenWidth(context) * 0.6,
                                child: Text('${attendanceList[index].subjectName}',style: TextStyles.heading1,)
                            ),
                            SizedBox(height: 4,),
                            Text('AY : ${attendanceList[index].academicYear}',style: TextStyles.bodyText1Black,),
                            SizedBox(height: 6,),
                            Text('Subject Code : ${attendanceList[index].subjectCode}',style: TextStyles.subTitle,)
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: themeGreen
                            ),
                            color:  themeGreen.withOpacity(0.2),
                          ),
                          child: Text('${attendanceList[index].subjectClass}',
                            style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 2,
                                color: themeGreen
                            ),
                          ),
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
                              Text('${attendanceList[index].totalClass}',style: TextStyles.heading1,),
                              SizedBox(height: 4,),
                              Text('Total Classes',style: TextStyles.subTitle,)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('${attendanceList[index].totalPresent}',style: TextStyles.heading1,),
                              SizedBox(height: 4,),
                              Text('Days Present',style: TextStyles.subTitle,)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('${attendanceList[index].totalAbsent}',style: TextStyles.heading1,),
                              SizedBox(height: 4,),
                              Text('Days Absent',style: TextStyles.subTitle,)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('${attendanceList[index].attendancepercentage}%',style: TextStyle(
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
        },
        itemCount: attendanceList.length,
        ),
      ),
    );
  }

  String _selectedSem = 'I';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.getScreenHeight(context) * 0.75,
      child: FutureBuilder(
        future: Provider.of<ApiProvider>(context, listen: false).getOverallAttendance(sem: '$_selectedSem'),
        builder: (ctx,snapshot){
          if(snapshot.hasData){
            OverallAttendanceModel _attendance = snapshot.data;
            return Column(
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
                        onChanged: (val){
                          setState(() {
                            print(val);
                            _selectedSem = val;
                          });
                        },
                        value: _selectedSem,
                        hint: Text('Select'),
                        items: [
                          DropdownMenuItem(child: Text('Semester I'),value: 'I',),
                          DropdownMenuItem(child: Text('Semester II'),value: 'II',),
                          DropdownMenuItem(child: Text('Semester III'),value: 'III',),
                          DropdownMenuItem(child: Text('Semester IV'),value: 'IV',),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${_attendance.data.overallSemAttendancePercentage}',style: TextStyle(
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
                _buildSubjectReportBlock(attendanceList : _attendance.data.semAttendanceDetails)
              ],
            );

          }else if(snapshot.hasError){
            return SizedBox();
          }else{
            return ShowLoading();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
