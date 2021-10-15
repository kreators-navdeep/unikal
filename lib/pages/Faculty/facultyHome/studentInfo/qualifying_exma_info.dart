import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/widgets/data_container.dart';

class QualifyingExamInfo extends StatefulWidget {
  @override
  _QualifyingExamInfoState createState() => _QualifyingExamInfoState();
}

class _QualifyingExamInfoState extends State<QualifyingExamInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DataContainer(
            title: 'Qualifying Board / University :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'College Last Studied :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Qualifying Exam :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Year Of Passing :',
            text: '2020-2021',
          ),
          DataContainer(
            title: 'Exam Marks / Grades / Points :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: '10th Marks/Grades/Points :',
            text: 'SOME TEXT',
          ),
        ],
      ),
    );
  }
}
