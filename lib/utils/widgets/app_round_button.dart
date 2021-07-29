import 'package:flutter/material.dart';

class AppRoundButton extends StatefulWidget {
  final VoidCallback onTap;
  final Icon icon;

  AppRoundButton({this.onTap,this.icon});
  @override
  _AppRoundButtonState createState() => _AppRoundButtonState();
}

class _AppRoundButtonState extends State<AppRoundButton> {
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
            padding: const EdgeInsets.all(10),
            child: widget.icon),
      ),
    );
  }
}
