import 'package:flutter/material.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/appCheckBox.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/app_outline_botton.dart';
import 'package:unikul/utils/widgets/textfield.dart';

class TransportDetails extends StatefulWidget {
  @override
  _TransportDetailsState createState() => _TransportDetailsState();
}

class _TransportDetailsState extends State<TransportDetails> {

  _buildTransport(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 6,),
        Text('Transport Application',style: TextStyles.heading1,),
        SizedBox(height: 20,),
        Row(
          children: [
            AppCheckBox(),
            SizedBox(width: 12,),
            Text('Transport Required?',style: TextStyle(fontWeight: FontWeight.w300,fontSize: SizeConfig.textMultiplier * 2),)
          ],
        ),
        SizedBox(height: 20,),
        AppTextField(
          title: 'Pickup Location',
          defaultValidators: [],
        ),
        SizedBox(height: 40,),
        SizedBox(height: 25,),
        Row(
          children: [
            Expanded(child: AppOutlineButton(text: 'Save',onPressed: (){},)),
            SizedBox(width: 20,),
            Expanded(child: AppButton(text: 'Submit', onPressed: (){}))
          ],
        ),
        SizedBox(height: 25,),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return _buildTransport();
  }
}
