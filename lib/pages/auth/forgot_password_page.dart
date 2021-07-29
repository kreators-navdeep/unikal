import 'package:flutter/material.dart';
import 'package:unikul/utils/Routes/routes.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';
import 'package:unikul/utils/widgets/textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Forgot Password',),
      body: Container(
        padding: const EdgeInsets.only(top: 50,left: 25,right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Please enter your registered email id',style: TextStyles.heading1,),
            SizedBox(height: 16,),
            AppTextField(
              defaultValidators: [],
              hint: 'Email iD',
            ),
            SizedBox(height: 36,),
            AppButton(text: 'Get OTP', onPressed: (){
              Navigator.push(context, Routes.verifyOTP());
            },isFullWidth: true,),

          ],
        ),
      ),
    );
  }
}
