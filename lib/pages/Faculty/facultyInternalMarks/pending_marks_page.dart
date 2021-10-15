import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/Routes/routes.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/my_app_bar.dart';

class PendingMarksPage extends StatefulWidget {
  @override
  _PendingMarksPageState createState() => _PendingMarksPageState();
}

class _PendingMarksPageState extends State<PendingMarksPage> {

  _buildPendingListItem(){
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(color: Colors.grey,width: 0.5)
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context, Routes.publishInternalMarks(
              title : 'Internal Session 1',subject: 'MME 2152 - MANUFACTURING TECHNOLOGY',course: '0106 - BTech - Mechanical Engineering',section: 'Section A')
          );
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      OutlinedButton(
                          onPressed: (){},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Theme.of(context).accentColor.withOpacity(0.1),

                          ),
                          child: Text('INTERNAL SESSION 1',
                            style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 1.5,
                                color: Theme.of(context).accentColor
                            ),
                          )
                      ),
                      SizedBox(width: 10,),
                      Text('Section A',style: TextStyle(fontWeight: FontWeight.w400,),)
                    ],
                  ),
                  Text('Released',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w400,fontSize: SizeConfig.textMultiplier * 2),)
                ],
              ),
              SizedBox(height: 6,),
              Text('0106 - BTech - Mechanical Engineering',style: TextStyles.subTitle,),
              SizedBox(height: 6,),
              Text('MME 2152 - MANUFACTURING TECHNOLOGY',style: TextStyles.bodyText1BlackLarge,),
              SizedBox(height: 6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('CORE',style: TextStyles.subTitle,),
                  Text('Semester III',style: TextStyles.subTitle,),
                  Text('23 Nov 2020',style: TextStyles.subTitle,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Pending Marks Entry',),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: List.generate(10, (index) {
              return _buildPendingListItem();
            }),
          ),
        ),
      ),
    );
  }
}
