import 'package:flutter/material.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/app_outline_botton.dart';
import 'package:unikul/utils/widgets/textfield.dart';


class VisaDetails extends StatefulWidget {
  @override
  _VisaDetailsState createState() => _VisaDetailsState();
}

class _VisaDetailsState extends State<VisaDetails> {

  _buildVisaApplication(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 6,),
        Text('Visa Application',style: TextStyles.heading1,),
        SizedBox(height: 6,),
        AppTextField(
          title: 'Passport Number',
          defaultValidators: [],
        ),
        AppTextField(
          title: 'Expiry Date',
          defaultValidators: [],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (val){},

            ),
            SizedBox(width: 12,),
            Text('Visa Required?',style: TextStyle(fontWeight: FontWeight.w300,fontSize: SizeConfig.textMultiplier * 2),)
          ],
        ),
        SizedBox(height: 20,),
        AppTextField(
          title: 'Current Visa Status',
          defaultValidators: [],
        ),
        AppTextField(
          title: 'Visa Type',
          defaultValidators: [],
        ),
        SizedBox(height: 12,),
        Text('You can not pay for visa fee as of now, Please make Registration fee payment to proceed for visa fee payment. Click on save to capture your visa choice.',
        style: TextStyle(color: Colors.red[800]),
        ),
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
    return _buildVisaApplication();
  }
}
