import 'package:flutter/material.dart';
import 'package:unikul/utils/Routes/routes.dart';
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
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Full Name',
                  ),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Gender',
                  ),
                  AppTextField(
                    defaultValidators: [],
                    title: 'DOB',
                  ),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Email',
                  ),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Mobile Number',
                  ),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Nationality',
                  ),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Previous Qualification',
                  ),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Academic Year',
                  ),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Drive',
                  ),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Applying For',
                  ),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Course',
                  ),
                  AppTextField(
                    defaultValidators: [],
                    title: 'Timing',
                  ),
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
            onPressed: (){
              Navigator.push(context, Routes.enquirySubmitted());
            },
          )
        ],
      ),
    );
  }
}
