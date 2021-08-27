import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';
import 'package:unikul/utils/widgets/textfield.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {


  File profileImage;
  final picker = ImagePicker();

  Future getProfileImage() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

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
      appBar: MyAppBar(
        title: 'Edit Profile',
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 25,bottom: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      getProfileImage();
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: profileImage != null ? Image.file(profileImage,height: 100,width: 100,) : Image.asset('assets/images/bca.png',width: 100,height: 100,fit: BoxFit.cover,)),
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
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 45,),
                  AppTextField(
                    title: 'Name',
                    defaultValidators: [],
                  ),
                  AppTextField(
                    title: 'Email ID',
                    defaultValidators: [],
                  ),
                  AppTextField(
                    title: 'Mobile Number',
                    defaultValidators: [],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              AppButton(text: 'Save', onPressed: (){
                Navigator.pop(context);
              },bgColor: Theme.of(context).accentColor,)
            ],
          ),
        ),
      ),
    );
  }
}
