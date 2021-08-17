import 'package:flutter/material.dart';
import 'package:unikul/pages/help/expansion_tile_widget.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Help',
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Have a Question?',),
            subtitle: Text("see our FAQ's below"),
          ),
          Column(
            children: [
              ExpansionTileWidget(
                title: 'How to report a charging station? ',
                children: [
                  Text('Go to Account, tap on complaint, select appropriate option and tell us more about it.',style: TextStyles.subTitle,)
                ],
              ),
              ExpansionTileWidget(
                title: 'How to earn more points? ',
                children: [
                  Text('Go to Account, tap on complaint, select appropriate option and tell us more about it.',style: TextStyles.subTitle,)
                ],
              ),
              ExpansionTileWidget(
                title: 'How to redeem Points? ',
                children: [
                  Text('Go to Account, tap on complaint, select appropriate option and tell us more about it.',style: TextStyles.subTitle,)
                ],
              ),
              ExpansionTileWidget(
                title: 'My payment got stuck, what to do now?',
                children: [
                  Text('Go to Account, tap on complaint, select appropriate option and tell us more about it.',style: TextStyles.subTitle,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
