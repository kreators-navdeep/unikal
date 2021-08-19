import 'package:flutter/material.dart';
import 'package:unikul/utils/widgets/data_container.dart';

class SponsorInfo extends StatefulWidget {
  @override
  _SponsorInfoState createState() => _SponsorInfoState();
}

class _SponsorInfoState extends State<SponsorInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DataContainer(
            title: 'Name :',
            text: 'SOME TEXT',
          ),
          DataContainer(
            title: 'Relation :',
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
            title: 'State :',
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
        ],
      ),
    );
  }
}
