import 'package:flutter/material.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/my_app_bar_2.dart';

class InternalMarksPage extends StatefulWidget {
  @override
  _InternalMarksPageState createState() => _InternalMarksPageState();
}

class _InternalMarksPageState extends State<InternalMarksPage> {
  _buildFields({String name,String max,String obtain,Color bgColor}){
    return  FittedBox(
      child: Container(
        color: bgColor,
        width: SizeConfig.getScreenWidth(context),
        padding: const EdgeInsets.symmetric(vertical: 9,horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: SizeConfig.getScreenWidth(context) * 0.4 - 20,
              child: Text(name,
                style: TextStyles.subTitle,
              ),
            ),
            Container(
              width: SizeConfig.getScreenWidth(context) * 0.6 - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(max,
                    style: TextStyles.subTitle,
                  ),
                  SizedBox(width: 10,),
                  Text(obtain,
                    style: TextStyles.subTitle,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildProjectPlanning(){
    return Container(
      width: SizeConfig.getScreenWidth(context),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Color(0xFFFEFEFE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Column(
            children: [
              _buildHeading(title:'INTERNAL'),
              _buildFields(name: 'Internal Session 1',max: "20.0",obtain: "0.0"),
              _buildFields(name: 'Internal Session 2',max: "20.0",obtain: "0.0"),

              _buildHeading(title:'ASSIGNMENT'),
              _buildFields(name: 'Assignment 1',max: "30.0",obtain: "0.0"),

            ],
          )
        ],
      ),
    );
  }

  _buildHeading({String title}){
    return Container(
      color: Theme.of(context).accentColor.withOpacity(0.2),
      padding: const EdgeInsets.symmetric(vertical: 9,horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: SizeConfig.getScreenWidth(context) * 0.4 - 20,
            child: Text(title,
              style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 1.5,
                  color: Theme.of(context).accentColor
              ),
            ),
          ),
          Container(
            width: SizeConfig.getScreenWidth(context) * 0.6 - 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('MAX MARKS',
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 1.5,
                      color: Theme.of(context).accentColor
                  ),
                ),
                SizedBox(width: 10,),
                Text('MARKS OBTAINED',
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 1.5,
                      color: Theme.of(context).accentColor
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 15,left: 15),
        child: Column(
          children: [
            FittedBox(
              child: Container(
                height: SizeConfig.getScreenHeight(context) * 0.12,
                width: SizeConfig.getScreenWidth(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Internal Marks',style: TextStyles.heading2,),
                        Container(
                          width: SizeConfig.getScreenWidth(context) * 0.4,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xFFF9F9F9),
                              border: Border.all(color: Colors.grey,width: 0.2)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: SizedBox(),
                            onChanged: (val){},
                            hint: Text('Select'),
                            items: [
                              DropdownMenuItem(child: Text('Semester 1')),
                              DropdownMenuItem(child: Text('Semester 2')),
                              DropdownMenuItem(child: Text('Semester 3')),
                              DropdownMenuItem(child: Text('Semester 4')),
                              DropdownMenuItem(child: Text('Semester 5')),
                              DropdownMenuItem(child: Text('Semester 6')),
                            ],
                          ),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Registration No: 200108002',style: TextStyles.subTitle,),
                        Text('SLCM No: 379469',style: TextStyles.subTitle,),
                      ],
                    ),
                    SizedBox(height: 14,),
                  ],
                ),
              ),
            ),
            Container(
              height: SizeConfig.getScreenHeight(context) * 0.7,
              child: ListView.separated(
                  itemBuilder: (ctx,index){
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      child: Container(
                        // padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                        child: ExpansionTile(
                            title: Text('Enterpreneurship & Project Planing',style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 2.4,fontWeight: FontWeight.w400
                            ),),
                            subtitle: Text('BBA 202'),
                            trailing: Icon(Icons.keyboard_arrow_down_rounded),
                          children: [
                            _buildProjectPlanning()
                          ],
                        )
                      ),
                    );
                  },
                  separatorBuilder: (ctx,index){
                    return SizedBox(height: 12,);
                  },
                  itemCount: 10
              ),
            ),
          ],
        ),
      ),
    );
  }
}
