import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unikul/constants/constants.dart';
import 'package:unikul/utils/styles/text.dart';


class AppSwitch extends StatefulWidget {
  final String title;
  final void Function(bool) onChanged;
  final bool value;

  AppSwitch({this.title,this.onChanged,this.value});
  @override
  _AppSwitchState createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title,style: TextStyles.heading1),
      contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
      trailing: CupertinoSwitch(
        activeColor: themeColor,
        onChanged: widget.onChanged,
        value: widget.value,
      ),
    );
  }
}
