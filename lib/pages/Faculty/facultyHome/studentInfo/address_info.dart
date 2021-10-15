import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/data_container.dart';

class AddressInfo extends StatefulWidget {
  @override
  _AddressInfoState createState() => _AddressInfoState();
}

class _AddressInfoState extends State<AddressInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Permanent Address Details',style: TextStyles.heading1,),
              SizedBox(height: 14,),
              DataContainer(
                title: 'Permanent Address Line 1 :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Permanent Address Line 2 :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Permanent Address Line 1 :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Place :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'State :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Country :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Pin code :',
                text: 'SOME TEXT',
              ),
            ],
          ),
          SizedBox(height: 16,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Present Address Details',style: TextStyles.heading1,),
              SizedBox(height: 14,),
              DataContainer(
                title: 'Mobile No :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Email Id :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Address Line 1 :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Address Line 2 :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Address Line 3 :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Place :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Country :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Pin Code :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Communication Address :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Hostel Block :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Hostel Room Number :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Hostel Allotted On :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Hostel Vacated on :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Type of Room :',
                text: 'SOME TEXT',
              ),
              DataContainer(
                title: 'Hostel Contact Number (Landline) :',
                text: 'SOME TEXT',
              ),



            ],
          )
        ],
      ),
    );
  }
}
