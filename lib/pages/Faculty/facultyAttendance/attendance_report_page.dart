import 'package:flutter/material.dart';
import 'package:unikul/utils/Routes/routes.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/app_drop_down2.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';
import 'package:unikul/utils/widgets/textfield.dart';

class AttendanceReportPage extends StatefulWidget {
  @override
  _AttendanceReportPageState createState() => _AttendanceReportPageState();
}

class _AttendanceReportPageState extends State<AttendanceReportPage> {

  _buildReportBottomSheet(){
    return Container(
      height: SizeConfig.getScreenHeight(context) * 0.7,
      padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ATTENDANCE REPORT',style: TextStyles.heading2,),
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

  _buildListItem(){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6)
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('01/11/2020',style: TextStyles.subTitle,),
                Text('Sunday',style: TextStyles.subTitle,)
              ],
            ),
            SizedBox(height: 6,),
            Text('Engineering Mathematics - III',style: TextStyles.heading2,),
            SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('MAT 2151',style: TextStyles.bodyText1BlackLarge,),
                OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Theme.of(context).accentColor.withOpacity(0.1),

                    ),
                    child: Text('P',
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
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Attendance Report',
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
                return _buildReportBottomSheet();
              }
          );
        },
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: SizeConfig.getScreenWidth(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('MUHAMMED FAYEZ YUSUF',style: TextStyles.bodyText1BlackLarge,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('Reg No: ',style: TextStyles.subTitle,),
                            Text('190103017',style: TextStyles.bodyText1Black,)
                          ],
                        ),
                        Row(
                          children: [
                            Text('Roll No: ',style: TextStyles.subTitle,),
                            Text('19',style: TextStyles.bodyText1Black,)
                          ],
                        ),
                      ],
                    ),
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
              Column(
                children: List.generate(10, (index) {
                  return _buildListItem();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
