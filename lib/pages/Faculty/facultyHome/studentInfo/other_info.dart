import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/widgets/data_container.dart';

class OtherInfo extends StatefulWidget {
  @override
  _OtherInfoState createState() => _OtherInfoState();
}

class _OtherInfoState extends State<OtherInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DataContainer(
            title: 'Official Correspondence Email :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Official Correspondence Mobile Number :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Emergency Contact Number :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Transfer Admission to Higher Semester: YES / NO :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'If Yes, admission to which Semester: III / V :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Number of Credits Earned :',
            text: 'SOME TEXT',
          ),
          SizedBox(height: 16,),
          Text('Note : Relevant to Lateral/Credit Transfer',style: TextStyle(color: Colors.red[600],fontSize: SizeConfig.textMultiplier * 1.8,),)
        ],
      ),
    );
  }
}
