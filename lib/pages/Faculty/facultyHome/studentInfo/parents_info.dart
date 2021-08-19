import 'package:flutter/material.dart';
import 'package:unikul/utils/widgets/data_container.dart';

class ParentsInfo extends StatefulWidget {
  @override
  _ParentsInfoState createState() => _ParentsInfoState();
}

class _ParentsInfoState extends State<ParentsInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DataContainer(
            title: 'Father Name :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Father Occupation :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Father Contact Number :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Father Email ID :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Mother Name :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Mother Occupation :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Mother Contact Number :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Mother Email ID :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Guardian Occupation :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Guardian Contact Number :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Guardian Email ID :',
            text: 'SOME TEXT',
          ),
        ],
      ),
    );
  }
}
