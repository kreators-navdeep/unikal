import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/app_button.dart';
import 'package:manipaldubai/utils/widgets/app_outline_botton.dart';
import 'package:manipaldubai/utils/widgets/textfield.dart';

class PersonalDetail extends StatefulWidget {
  @override
  _PersonalDetailState createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {

  _buildPersonalInfo(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6,),
          Text('Personal Info',style: TextStyles.heading1,),
          SizedBox(height: 6,),
          AppTextField(
            title: 'Title',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'First Name',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Last Name',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Name of Certificate',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Email ID',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Mobile Number',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Current Location',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Nationality',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Alternative Mobile Number',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Country of Residence',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'City',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'DOB',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Gender',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Blood Group',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Name as per Passport',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Country of Birth',
            defaultValidators: [],
          ),
          AppTextField(
            title: 'Emirates ID',
            defaultValidators: [],
          ),
          SizedBox(height: 10,),

          Text("Parent's Detail",style: TextStyles.heading1,),
          SizedBox(height: 6,),
          AppTextField(
            title: "Father's Name",
            defaultValidators: [],
          ),
          AppTextField(
            title: "Father's Occupation",
            defaultValidators: [],
          ),
          AppTextField(
            title: "Mother's Name",
            defaultValidators: [],
          ),
          AppTextField(
            title: "Mother's Occupation",
            defaultValidators: [],
          ),
          SizedBox(height: 10,),

          Text("Parent's Detail",style: TextStyles.heading1,),
          SizedBox(height: 6,),
          AppTextField(
            title: "Guardian's Name",
            defaultValidators: [],
          ),
          AppTextField(
            title: "Guardian's Email ID",
            defaultValidators: [],
          ),
          AppTextField(
            title: "Relation",
            defaultValidators: [],
          ),
          AppTextField(
            title: "Address",
            defaultValidators: [],
          ),
          AppTextField(
            title: "Mobile Number",
            defaultValidators: [],
          ),
          AppTextField(
            title: "Tel. Number",
            defaultValidators: [],
          ),
          SizedBox(height: 10,),

          Text("Emergency Contact",style: TextStyles.heading1,),
          SizedBox(height: 6,),
          AppTextField(
            title: "Person Name",
            defaultValidators: [],
          ),
          AppTextField(
            title: "Mobile Number",
            defaultValidators: [],
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
      child: _buildPersonalInfo(),
    );
  }
}
