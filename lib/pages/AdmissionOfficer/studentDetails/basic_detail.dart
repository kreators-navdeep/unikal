import 'package:flutter/material.dart';
import 'package:unikul/constants/constants.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/app_drop_down2.dart';
import 'package:unikul/utils/widgets/app_outline_botton.dart';

class BasicDetail extends StatefulWidget {
  final TabController controller;
  BasicDetail({this.controller});
  @override
  _BasicDetailState createState() => _BasicDetailState();
}

class _BasicDetailState extends State<BasicDetail> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6,),
          Text('Program Applying For',style: TextStyles.heading1,),
          SizedBox(height: 12,),
          AppDropDown2(
            items: [],
            title: 'Admission Year',
          ),
          AppDropDown2(
            items: [],
            title: 'Drive',
          ),
          AppDropDown2(
            items: [],
            title: 'Graduation Applying For',
          ),
          AppDropDown2(
            items: [],
            title: 'Course',
          ),
          AppDropDown2(
            items: [],
            title: 'Timing',
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Reg Amount : ',style: TextStyles.subTitle,),
                  Text('Rs 1000',style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.8,fontWeight: FontWeight.w500),)
                ],
              ),
              TextButton(
                  onPressed: (){},
                  child: Text('Proceed to Pay',style : TextStyle(color: Colors.white)),
                style: TextButton.styleFrom(
                  backgroundColor: themeGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)
                  )
                ),
              )
            ],
          ),
          SizedBox(height: 25,),
          Row(
            children: [
              Expanded(child: AppOutlineButton(text: 'Save',onPressed: (){},)),
              SizedBox(width: 20,),
              Expanded(child: AppButton(text: 'Submit', onPressed: (){}))
            ],
          )
        ],
      ),
    );
  }
}
