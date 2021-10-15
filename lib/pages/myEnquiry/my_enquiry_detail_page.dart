import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/Routes/routes.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/widgets/bottom_button.dart';
import 'package:manipaldubai/utils/widgets/data_container.dart';
import 'package:manipaldubai/utils/widgets/my_app_bar.dart';

class MyEnquiryDetailPage extends StatefulWidget {
  @override
  _MyEnquiryDetailPageState createState() => _MyEnquiryDetailPageState();
}

class _MyEnquiryDetailPageState extends State<MyEnquiryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'My Enquiry',
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  DataContainer(
                    title: 'Full Name',
                    text: 'Aisha Parihar',
                  ),
                  DataContainer(
                    title: 'Gender',
                    text: 'Female',
                  ),
                  DataContainer(
                    title: 'DOB',
                    text: '19 jan 2000',
                  ),
                  DataContainer(
                    title: 'Email Id',
                    text: 'aishaparihar@gmail.com',
                  ),
                  DataContainer(
                    title: 'Mobile',
                    text: '+91 9321314138',
                  ),
                  DataContainer(
                    title: 'Nationality',
                    text: 'Indian',
                  ),
                  DataContainer(
                    title: 'Previous Qualification',
                    text: 'Higher Secondary',
                  ),
                  DataContainer(
                    title: 'Academic Year',
                    text: '2020-2021',
                  ),
                  DataContainer(
                    title: 'Drive',
                    text: 'TEXT',
                  ),
                  DataContainer(
                    title: 'Applying for Graduation',
                    text: 'BBA',
                  ),
                  DataContainer(
                    title: 'Timing',
                    text: 'TEXT',
                  ),
                  SizedBox(
                    height: SizeConfig.getScreenHeight(context) * 0.12,

                  )
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'Proceed to fill other details',
            onPressed: (){
              Navigator.push(context, Routes.enrollmentForm());
            },
          )
        ],
      ),
    );
  }
}
