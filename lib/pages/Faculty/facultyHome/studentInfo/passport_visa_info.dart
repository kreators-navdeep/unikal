import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/data_container.dart';

class PassportVisaInfo extends StatefulWidget {
  @override
  _PassportVisaInfoState createState() => _PassportVisaInfoState();
}

class _PassportVisaInfoState extends State<PassportVisaInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DataContainer(
            title: 'Pass Port Number :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Pass Port Issued Date :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Pass Port Expiry Date :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Visa Number :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Visa Issued Date :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Visa Expiry Date :',
            text: 'SOME TEXT',
          ),
        ],
      ),
    );
  }
}
