import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unikul/utils/Routes/routes.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/data_container.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/logo1.png',),
            Icon(Icons.notifications_none_outlined,color: Colors.grey,)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/avatar.png'),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius:  BorderRadius.circular(50),
                            color: Color(0xFF92DE38),
                          ),
                          child: Icon(Icons.add_rounded,color: Colors.white,size: 16,),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                DataContainer(text: 'Aisha Parihar',title: 'Name',),
                DataContainer(title: 'Email ID',text: 'aishaparihar@gmail.com',),
                DataContainer(title: 'Mobile Number',text: '+91 90113241432',),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  width: SizeConfig.getScreenWidth(context),
                  child: OutlinedButton(
                    child: Text('Edit Profile',style: TextStyle(color: Theme.of(context).accentColor,fontSize: SizeConfig.textMultiplier * 2),),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      side: BorderSide(color: Theme.of(context).accentColor,width: 0.5),
                      padding: const EdgeInsets.symmetric(vertical: 13)
                    ),
                    onPressed: (){
                      Navigator.push(context, Routes.editProfile());
                    },
                  ),
                ),
                SizedBox(height: 14,),
                DataContainer(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                    data: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Help',style: TextStyle(fontWeight: FontWeight.w400,fontSize: SizeConfig.textMultiplier * 2),),
                        Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    )
                ),
                SizedBox(height: 6,),
                DataContainer(
                  onPressed: (){
                    Navigator.push(context, Routes.spSettings());
                  },
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                    data: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Settings',style: TextStyle(fontWeight: FontWeight.w400,fontSize: SizeConfig.textMultiplier * 2),),
                        Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    )
                ),

              ],
            ),
            Container(
              child: TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Icon(Icons.logout,color: Color(0xFF464646)),
                    SizedBox(width: 16,),
                    Text('Logout',style: TextStyle(color: Color(0xFF464646),fontSize: SizeConfig.textMultiplier *2),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
