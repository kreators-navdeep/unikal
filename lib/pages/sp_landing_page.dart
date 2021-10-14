import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unikul/pages/StudentPortal/attendance/attandence_page.dart';
import 'package:unikul/pages/StudentPortal/internal_marks/internal_marks_page.dart';
import 'package:unikul/pages/StudentPortal/spHome/sp_home_page.dart';
import 'package:unikul/pages/home/home_page.dart';
import 'package:unikul/pages/myEnquiry/my_enquiry_page.dart';
import 'package:unikul/pages/profile/profile_page.dart';
import 'package:unikul/utils/Api/apis.dart';
import 'package:unikul/utils/Routes/routes.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/my_app_bar_2.dart';
class SPLandingPage extends StatefulWidget {
  @override
  _SPLandingPageState createState() => _SPLandingPageState();
}

class _SPLandingPageState extends State<SPLandingPage> {

  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _buildDrawerItem({IconData icon,String text,Function onTap}){
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(text),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: MyAppBar2(
          leading: IconButton(
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
            icon: Icon(Icons.menu,color: Theme.of(context).iconTheme.color,),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: SizeConfig.heightMultiplier * 30,
                width: double.infinity,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    // color: Theme.of(context).primaryColor.withOpacity(0.8),
                    gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor.withOpacity(0.8),
                          Color(0xFF00CCFF),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/avatar.png',height: SizeConfig.heightMultiplier * 10,),
                      SizedBox(height: 16,),
                      Text(Provider.of<ApiProvider>(context, listen: false).userName,style: TextStyle(color: Colors.white,fontSize: TextStyles.heading2.fontSize),),
                      SizedBox(height: 8,),
                      Text(Provider.of<ApiProvider>(context, listen: false).email,style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
              _buildDrawerItem(
                text: 'Home',
                icon: Icons.home_outlined,
                onTap: (){
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 0;
                  });
                }
              ),
              _buildDrawerItem(
                text: 'Attendance',
                icon: Icons.format_list_numbered_sharp,
                onTap: (){
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 1;
                  });
                }
              ),
              _buildDrawerItem(
                text: 'Internal Marks',
                icon: Icons.list_alt_rounded,
                onTap: (){
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 2;
                  });
                }
              ),
              _buildDrawerItem(
                text: 'Notifications',
                icon: Icons.notifications_none_outlined,
                onTap: (){
                  Navigator.push(context, Routes.notification());
                }
              ),
              _buildDrawerItem(
                text: 'Privacy Policy',
                icon: Icons.info_outline_rounded,
                onTap: (){
                  Navigator.push(context, Routes.privacyPolicy());
                }
              ),
              _buildDrawerItem(
                text: 'Terms & condition',
                icon: Icons.subject,
                onTap: (){
                  Navigator.push(context, Routes.tAndC());
                }
              ),
              Divider(),
              _buildDrawerItem(
                text: 'Logout',
                icon: Icons.logout,
                onTap: (){
                  Provider.of<ApiProvider>(context, listen: false).logout(context);
                }
              ),
            ],
          ),
        ),
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
