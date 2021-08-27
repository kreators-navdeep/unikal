import 'package:flutter/material.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/appCheckBox.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';
import 'package:unikul/utils/widgets/textfield.dart';

class FillEnrollmentFormPage extends StatefulWidget {
  @override
  _FillEnrollmentFormPageState createState() => _FillEnrollmentFormPageState();
}

class _FillEnrollmentFormPageState extends State<FillEnrollmentFormPage> {

  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;



  _buildPersonalInfo(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        SizedBox(height: 40,),
        AppButton(text: 'Save & Next', onPressed: (){
          continued();
        })
      ],
    );
  }

  _buildQualificationDetail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            AppCheckBox(
            ),
            SizedBox(width: 12,),
            Text('Hostel Required?',style: TextStyle(fontWeight: FontWeight.w300,fontSize: SizeConfig.textMultiplier * 2),)
          ],
        ),
        SizedBox(height: 40,),
        AppButton(text: 'Save & Next', onPressed: (){
          continued();
        })
      ],
    );
  }

  _buildVisaApplication(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            AppCheckBox(),
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
        SizedBox(height: 40,),
        AppButton(text: 'Save & Next', onPressed: (){
          continued();
        })
      ],
    );
  }

  _buildTransportApplication(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        AppButton(text: 'Submit', onPressed: (){
          continued();
        })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'My Enquiry',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('Please fill thi Enrollment form',style: TextStyles.heading1,),
            ),
            SizedBox(height: 16,),
            Container(
              width: SizeConfig.getScreenWidth(context),
              height: SizeConfig.getScreenHeight(context) - MyAppBar().height - MediaQuery.of(context).padding.top - 36 -20,
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue:  continued,
                onStepCancel: cancel,
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return SizedBox();
                },
                steps: <Step>[
                  Step(
                    title: SizedBox(),
                    content: _buildPersonalInfo(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: SizedBox(),
                    content: _buildQualificationDetail() ,
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: SizedBox(),
                    content: _buildVisaApplication(),
                    isActive:_currentStep >= 0,
                    state: _currentStep >= 3 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: SizedBox(),
                    content:_buildTransportApplication(),
                    isActive:_currentStep >= 0,
                    state: _currentStep >= 4 ?
                    StepState.complete : StepState.disabled,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 3 ?
    setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }

}
