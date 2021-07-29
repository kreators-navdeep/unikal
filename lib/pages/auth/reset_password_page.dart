import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';
import 'package:unikul/utils/widgets/textfield.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  bool _success = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Reset Password',
      ),
      body:  _success ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/success.png'),
            SizedBox(height: 16,),
            Text(' Your Password has been reset successfully',style: TextStyle(color: Color(0xFF92DE38),fontSize: SizeConfig.textMultiplier * 2),)
          ],
        ),
      ) : Padding(
        padding: const EdgeInsets.only(left: 25,right: 25,top: 60),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Please enter a new password',style: TextStyles.heading1,),
            SizedBox(height: 16,),
            AppTextField(
              defaultValidators: [
                DefaultValidators.VALID_PASSWORD,
              ],
              hint: 'Password',
            ),
            SizedBox(height: 14,),
            AppTextField(
              defaultValidators: [
                DefaultValidators.VALID_PASSWORD,
              ],
              hint: 'Confirm Password',
            ),
            SizedBox(height: 14,),
            AppButton(text: 'Reset', onPressed: (){
              setState(() {
                _success = true;
              });
            })
          ],
        ),
      ),
    );
  }
}
