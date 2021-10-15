import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/app_button.dart';
import 'package:manipaldubai/utils/widgets/app_outline_botton.dart';
import 'package:manipaldubai/utils/widgets/textfield.dart';

class AcademicDetail extends StatefulWidget {
  @override
  _AcademicDetailState createState() => _AcademicDetailState();
}

class _AcademicDetailState extends State<AcademicDetail> {

  _buildQualificationDetail(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6,),
          Text('Qualification Details',style: TextStyles.heading1,),
          SizedBox(height: 6,),
          AppTextField(
            title: 'Name of previous qualification',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Country of previous qualification',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Academic Level',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Board/University',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Institute Name',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Institute Type',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Study Period From',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Grading Scale',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Final Result',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'NATA Score',
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
              Text('Hostel Required?',style: TextStyle(fontWeight: FontWeight.w300,fontSize: SizeConfig.textMultiplier * 2),)
            ],
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
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildQualificationDetail(),
    );
  }
}
