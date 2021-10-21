import 'package:flutter/material.dart';
import 'package:manipaldubai/models/helpModel.dart';
import 'package:manipaldubai/pages/help/expansion_tile_widget.dart';
import 'package:manipaldubai/utils/Api/apis.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/my_app_bar.dart';
import 'package:manipaldubai/utils/widgets/showLoading.dart';
import 'package:provider/provider.dart';

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
          FutureBuilder(
              future: Provider.of<ApiProvider>(context, listen: false).getHelpData(),
              builder: (ctx,snapshot){
            if(snapshot.hasData){

              HelpModel _helpQuestions = snapshot.data;

              return Column(
                children: List.generate(_helpQuestions.details.length, (index) {
                  return   ExpansionTileWidget(
                    title: '${_helpQuestions.details[index].question}',
                    children: [
                      Text('${_helpQuestions.details[index].answer}',style: TextStyles.subTitle,)
                    ],
                  );
                })
                ,
              );
            }else if(snapshot.hasError){
              return SizedBox();
            }else{
              return ShowLoading();
            }
          })
        ],
      ),
    );
  }
}
