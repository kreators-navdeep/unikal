import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unikul/utils/Routes/routes.dart';

class MyAppBar2 extends PreferredSize {

  final String title;
  final List<Widget> actions;
  final double height;
  final Color bgColor;
  MyAppBar2({this.title,this.actions,this.height = kToolbarHeight,this.bgColor});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      title: Image.asset('assets/images/logo1.png',),
      centerTitle: false,
      actions: [
        SvgPicture.asset('assets/icons/locate.svg'),
        IconButton(icon: Icon(Icons.notifications_none_outlined,color: Colors.grey,), onPressed: (){
          Navigator.push(context, Routes.notification());
        })
      ],
    );
  }

}
