import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/widgets/data_container.dart';

class AdmissionInfo extends StatefulWidget {
  @override
  _AdmissionInfoState createState() => _AdmissionInfoState();
}

class _AdmissionInfoState extends State<AdmissionInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DataContainer(
            title: 'Registration Number :',
            text: '200401002',
          ),
          DataContainer(
            title: 'Application Number :',
            text: 'APP202100058',
          ),
          DataContainer(
            title: 'Name (As Per 12th Marks Card) :',
            text: 'AYESHA SAMRA',
          ),
          DataContainer(
            title: 'Academic Year :',
            text: '2020-2021',
          ),
          DataContainer(
            title: 'Program / Branch :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'DOJ - Class start date :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'DOB - MM/DD/YYYY :',
            text: '02 Nov 2002',
          ),
          DataContainer(
            title: 'Gender :',
            text: 'Female',
          ),
          DataContainer(
            title: 'Student Mobile Number :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Personal Mobile Number :',
            text: '971-0506889699',
          ),
          DataContainer(
            title: 'Email ID :',
            text: 'ayeshasamra.b@gmail.com',
          ),
          DataContainer(
            title: 'Blood Group :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Nationality :',
            text: 'IN',
          ),
          DataContainer(
            title: 'Emirate ID :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Mother Tongue :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Marital Status :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Session :',
            text: 'REGULAR',
          ),

        ],
      ),
    );
  }
}
