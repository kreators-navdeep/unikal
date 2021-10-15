import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:manipaldubai/pages/Faculty/facultyHome/studentInfo/address_info.dart';
import 'package:manipaldubai/pages/Faculty/facultyHome/studentInfo/admission_info.dart';
import 'package:manipaldubai/pages/Faculty/facultyHome/studentInfo/other_info.dart';
import 'package:manipaldubai/pages/Faculty/facultyHome/studentInfo/parents_info.dart';
import 'package:manipaldubai/pages/Faculty/facultyHome/studentInfo/passport_visa_info.dart';
import 'package:manipaldubai/pages/Faculty/facultyHome/studentInfo/qualifying_exma_info.dart';
import 'package:manipaldubai/pages/Faculty/facultyHome/studentInfo/sponsor_info.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/my_app_bar.dart';

class StudentInfoPage extends StatefulWidget {
  final String title;
  StudentInfoPage({this.title});
  @override
  _StudentInfoPageState createState() => _StudentInfoPageState();
}

class _StudentInfoPageState extends State<StudentInfoPage>  with TickerProviderStateMixin,AfterLayoutMixin<StudentInfoPage>{

  TabController _controller;
  int _selectedIndex = 0;

   _buildTab(String text,index){
    return Container(
      decoration: BoxDecoration(
          color: _controller.index == index ? Theme.of(context).accentColor : Colors.white  ,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey,width: 0.3)
      ),
      padding: const EdgeInsets.symmetric(vertical: 6,),
      width: 140,
      alignment: Alignment.center,
      child: Text(text,style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.8,color: _selectedIndex == index ? Colors.white : Colors.black),),
    );
  }

  List<Widget> list = [
    Tab(child: Text('Basic')),
    Tab(child: Text('Basic')),
    Tab(child: Text('Basic')),
    Tab(child: Text('Basic')),
    Tab(child: Text('Basic')),
    Tab(child: Text('Basic')),
    Tab(child: Text('Basic')),
  ];


  @override
  void afterFirstLayout(BuildContext context) {
    // Calling the same fxunction "after layout" to resolve the issue.
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: list.length, vsync: this);

    // _controller.addListener(() {
    //   setState(() {
    //     _selectedIndex = _controller.index;
    //   });
    //   print("Selected Index: " + _controller.index.toString());
    // });
  }



  @override
  Widget build(BuildContext context) {


    list = [
      Tab(child: _buildTab('Admission Details',0),),
      Tab(child: _buildTab('Qualifying Exam',1)),
      Tab(child: _buildTab('Address',2)),
      Tab(child: _buildTab('Passport/Visa',3)),
      Tab(child: _buildTab('Parents',4)),
      Tab(child: _buildTab('Sponsor',5)),
      Tab(child: _buildTab('Other Details',6)),
    ];

    return Scaffold(
      appBar: MyAppBar(
        title: widget.title,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              height: SizeConfig.getScreenHeight(context) * 0.08,
              width: SizeConfig.getScreenWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    controller: _controller,
                    tabs: list,
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.black,
                    isScrollable: true,
                    onTap: (val){
                      print(val);
                      setState(() {
                        _selectedIndex = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.getScreenHeight(context) * 0.92 - MyAppBar().height - MediaQuery.of(context).padding.top,
              child: _selectedIndex == 0
                  ? AdmissionInfo() : _selectedIndex == 1
                  ? QualifyingExamInfo() : _selectedIndex == 2
                  ? AddressInfo() : _selectedIndex == 3
                  ? PassportVisaInfo() : _selectedIndex == 4
                  ? ParentsInfo() : _selectedIndex == 5
                  ? SponsorInfo() : _selectedIndex == 6
                  ? OtherInfo() : SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
