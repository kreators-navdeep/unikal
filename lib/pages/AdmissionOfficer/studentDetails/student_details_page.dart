import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:unikul/pages/AdmissionOfficer/studentDetails/PersonlDetail.dart';
import 'package:unikul/pages/AdmissionOfficer/studentDetails/academic_detail.dart';
import 'package:unikul/pages/AdmissionOfficer/studentDetails/basic_detail.dart';
import 'package:unikul/pages/AdmissionOfficer/studentDetails/documnet_details.dart';
import 'package:unikul/pages/AdmissionOfficer/studentDetails/finance_details.dart';
import 'package:unikul/pages/AdmissionOfficer/studentDetails/transport_details.dart';
import 'package:unikul/pages/AdmissionOfficer/studentDetails/visa_details.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';

class StudentDetailsPage extends StatefulWidget {
  final String title;
  StudentDetailsPage({this.title});
  @override
  _StudentDetailsPageState createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage>  with TickerProviderStateMixin,AfterLayoutMixin<StudentDetailsPage> {

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
      width: 120,
      alignment: Alignment.center,
      child: Text(text,style: TextStyle(fontSize: SizeConfig.textMultiplier * 2,color: _selectedIndex == index ? Colors.white : Colors.black),),
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
    // Calling the same function "after layout" to resolve the issue.
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
      Tab(child: _buildTab('Basic',0),),
      Tab(child: _buildTab('Personal',1)),
      Tab(child: _buildTab('Academic',2)),
      Tab(child: _buildTab('Documents',3)),
      Tab(child: _buildTab('Finance',4)),
      Tab(child: _buildTab('Visa',5)),
      Tab(child: _buildTab('Transport',6)),
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
              height: SizeConfig.getScreenHeight(context) * 0.1,
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
                  SizedBox(height: 12,),
                  Text('Application No. : APP202101996',style: TextStyles.subTitle,),                ],
              ),
            ),
            Container(
              height: SizeConfig.getScreenHeight(context) * 0.9 - MyAppBar().height - MediaQuery.of(context).padding.top,
              child: _selectedIndex == 0
                  ? BasicDetail(controller: _controller) : _selectedIndex == 1
                  ? PersonalDetail() : _selectedIndex == 2
                  ? AcademicDetail() : _selectedIndex == 3
                  ? DocumentDetails() : _selectedIndex == 4
                  ? FinanceDetails() : _selectedIndex == 5
                  ? VisaDetails() : _selectedIndex == 6
                  ? TransportDetails() : SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
