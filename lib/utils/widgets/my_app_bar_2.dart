import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unikul/utils/Routes/routes.dart';

class MyAppBar2 extends PreferredSize {
  final List<Widget> actions;
  final double height;
  final Color bgColor;
  final Widget leading;
  MyAppBar2({this.actions,this.height = kToolbarHeight,this.bgColor,this.leading});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      title: Image.asset('assets/images/logo1.png',),
      automaticallyImplyLeading: false,
      leading: leading,
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
