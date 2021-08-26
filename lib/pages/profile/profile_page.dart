import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:unikul/utils/Routes/routes.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/data_container.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unikul/utils/widgets/my_app_bar_2.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File profileImage;
  final picker = ImagePicker();

  Future getProfileImage() async {
    final pickedFile =
    await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2(),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    getProfileImage();
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                            height: 100,
                            width: 100,
                            child: profileImage != null ? Image.file(profileImage) :Image.asset('assets/images/avatar.png')),
                      ),
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
                  onPressed: (){
                    Navigator.push(context, Routes.help());
                  },
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
                onPressed: (){
                  Phoenix.rebirth(context);
                },
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
