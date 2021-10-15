import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manipaldubai/pages/AdmissionOfficer/ao_home_page.dart';
import 'package:manipaldubai/pages/profile/profile_page.dart';

class AOLandingPage extends StatefulWidget {
  @override
  _AOLandingPageState createState() => _AOLandingPageState();
}

class _AOLandingPageState extends State<AOLandingPage> {

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
            ? AOHomePage() : _selectedIndex == 1
            ? ProfilePage(): SizedBox()
    );
  }
}
