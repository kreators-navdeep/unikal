import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unikul/pages/home/enquiry_page.dart';
import 'package:unikul/pages/home/home_page.dart';
import 'package:unikul/pages/myEnquiry/my_enquiry_page.dart';
import 'package:unikul/pages/profile/profile_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        elevation: 20,
        backgroundColor: Theme.of(context).cardColor,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/home.svg'),label: 'Home',activeIcon:  SvgPicture.asset('assets/icons/home.svg',color: Theme.of(context).accentColor,)),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/myEnquiry.svg'),label: 'My Enquiry',activeIcon:  SvgPicture.asset('assets/icons/myEnquiry.svg',color: Theme.of(context).accentColor,)),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/user.svg'),label: 'User',activeIcon:  SvgPicture.asset('assets/icons/user.svg',color: Theme.of(context).accentColor,)),
        ],
        currentIndex: _selectedIndex,
        onTap: (val){
          setState(() {
            _selectedIndex = val;
          });
        },
      ),
      body: _selectedIndex == 0
          ? HomePage() : _selectedIndex == 1
          ? MyEnquiryPage() : _selectedIndex == 2
          ? ProfilePage() : SizedBox()
    );
  }
}
