import 'package:flutter/material.dart';
import 'package:unikul/constants/constants.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/app_drop_down2.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';
import 'package:unikul/utils/widgets/textfield.dart';


class ClassAttendanceSummaryPage extends StatefulWidget {
  @override
  _ClassAttendanceSummaryPageState createState() => _ClassAttendanceSummaryPageState();
}

class _ClassAttendanceSummaryPageState extends State<ClassAttendanceSummaryPage> {


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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('190103017',style: TextStyles.subTitle,),
                          SizedBox(height: 6,),
                          Text('MUHAMMED FAYEZ YUSUF',style: TextStyles.heading2,),
                          SizedBox(height: 4,),
                        ],
                      ),
                      Text('Roll No. 23',style: TextStyle(),)
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

  _buildAttendanceSummary(){
    return Container(
      height: SizeConfig.getScreenHeight(context) * 0.7,
      padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Attendance Summary',style: TextStyles.heading2,),
            SizedBox(height: 16,),
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
              child: AppButton(text: 'Submit', onPressed: (){
              }),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Class Attendance Summary',
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        icon: Icon(Icons.search,color: Colors.white,),
        label:Text('SEARCH',style: TextStyle(color: Colors.white),),
        onPressed: (){
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(25)),
              ),
              builder: (builder){
                return _buildAttendanceSummary();
              }
          );
        },
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            FittedBox(
              child: Container(
                width: SizeConfig.getScreenWidth(context),
                height: SizeConfig.getScreenHeight(context) * 0.15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mechanical Lab -I',style: TextStyles.bodyText1BlackLarge,),
                    SizedBox(height: 10,),
                    Text('Section A     Semester III',style: TextStyles.subTitle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('1 Nov 2020 - 31 Dec 2020',style: TextStyles.bodyText1BlackLarge,),
                        OutlinedButton(
                            onPressed: (){},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Theme.of(context).accentColor.withOpacity(0.1),

                            ),
                            child: Text('AY 2020-2021',
                              style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 2,
                                  color: Theme.of(context).accentColor
                              ),
                            )
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: SizeConfig.getScreenHeight(context) * 0.85 - MyAppBar().height - MediaQuery.of(context).padding.top,
              child: ListView.separated(itemBuilder: (ctx,index){
                return _buildSubjectReportBlock();
              }, separatorBuilder: (ctx,index){
                return SizedBox(height: 10,);
              }, itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}
