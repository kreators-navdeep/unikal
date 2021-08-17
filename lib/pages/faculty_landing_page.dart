import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unikul/pages/Faculty/facultyHome/faculty_home_page.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';

class FacultyLandingPage extends StatefulWidget {
  @override
  _FacultyLandingPageState createState() => _FacultyLandingPageState();
}

class _FacultyLandingPageState extends State<FacultyLandingPage> {
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
            ?  FacultyHomePage() :SizedBox()
    );
  }
}
