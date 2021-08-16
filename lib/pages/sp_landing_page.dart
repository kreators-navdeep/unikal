import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unikul/pages/StudentPortal/attendance/attandence_page.dart';
import 'package:unikul/pages/StudentPortal/internal_marks/internal_marks_page.dart';
import 'package:unikul/pages/StudentPortal/spHome/sp_home_page.dart';
import 'package:unikul/pages/home/home_page.dart';
import 'package:unikul/pages/myEnquiry/my_enquiry_page.dart';
import 'package:unikul/pages/profile/profile_page.dart';
class SPLandingPage extends StatefulWidget {
  @override
  _SPLandingPageState createState() => _SPLandingPageState();
}

class _SPLandingPageState extends State<SPLandingPage> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).accentColor,
          elevation: 20,
          backgroundColor: Theme.of(context).cardColor,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/home.svg'),label: 'Home',activeIcon:  SvgPicture.asset('assets/icons/home.svg',color: Theme.of(context).accentColor,)),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/myEnquiry.svg'),label: 'Attendance',activeIcon:  SvgPicture.asset('assets/icons/attendance.svg',color: Theme.of(context).accentColor,)),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/myEnquiry.svg'),label: 'Internal Marks',activeIcon:  SvgPicture.asset('assets/icons/marks.svg',color: Theme.of(context).accentColor,)),
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
            ? SpHomePage() : _selectedIndex == 1
            ? AttendancePage() : _selectedIndex == 2
            ? InternalMarksPage() : _selectedIndex == 3
            ? ProfilePage() : SizedBox()
    );
  }
}
