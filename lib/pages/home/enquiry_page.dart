import 'package:flutter/material.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/widgets/bottom_button.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';
import 'package:unikul/utils/widgets/textfield.dart';

class EnquiryPage extends StatefulWidget {
  @override
  _EnquiryPageState createState() => _EnquiryPageState();
}

class _EnquiryPageState extends State<EnquiryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Enquiry',
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15,top: 25,right: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppTextField(
                    defaultValidators: [],
                    title: 'Full Name',
                  ),
                  SizedBox(height: 10,),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Gender',
                  ),
                  SizedBox(height: 10,),
                  AppTextField(
                    defaultValidators: [],
                    title: 'DOB',
                  ),
                  SizedBox(height: 10,),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Email',
                  ),
                  SizedBox(height: 10,),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Mobile Number',
                  ),
                  SizedBox(height: 10,),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Nationality',
                  ),
                  SizedBox(height: 10,),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Previous Qualification',
                  ),
                  SizedBox(height: 10,),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Academic Year',
                  ),
                  SizedBox(height: 10,),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Drive',
                  ),
                  SizedBox(height: 10,),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Applying For',
                  ),
                  SizedBox(height: 10,),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Course',
                  ),
                  SizedBox(height: 10,),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Timing',
                  ),
                  SizedBox(height: 10,),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Admission Type',
                  ),
                  SizedBox(height: SizeConfig.getScreenHeight(context) * 0.14,),
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'Submit Enquiry',
            onPressed: (){},
          )
        ],
      ),
    );
  }
}
