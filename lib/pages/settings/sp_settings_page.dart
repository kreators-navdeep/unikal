import 'package:flutter/material.dart';
import 'package:unikul/utils/Api/apis.dart';
import 'package:unikul/utils/Routes/routes.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';
import 'package:unikul/utils/widgets/my_app_bar_2.dart';
class SpSettingsPage extends StatefulWidget {
  @override
  _SpSettingsPageState createState() => _SpSettingsPageState();
}

class _SpSettingsPageState extends State<SpSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Settings',
      ),
      body: Column(
        children: [
          ListTile(
            onTap: (){
              Navigator.push(context, Routes.notificationSettings());
            },
            title: Text('Notifications'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            title: Text('Change Password'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            title: Text('Privacy Policy'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: (){
              Navigator.push(context, Routes.privacyPolicy());
            },
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, Routes.tAndC());
            },
            title: Text('Terms & Conditions'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            title: Text('About Us'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
