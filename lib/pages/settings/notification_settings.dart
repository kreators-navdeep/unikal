import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unikul/utils/widgets/app_switch.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Notifications',
      ),
      body: ListTile(
        title: Text('Allow Notifications'),
        trailing: CupertinoSwitch(
          onChanged: (val){},
          value: true,
          activeColor: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
