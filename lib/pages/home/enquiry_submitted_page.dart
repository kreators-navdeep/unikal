import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/bottom_button.dart';
import 'package:manipaldubai/utils/widgets/my_app_bar.dart';

class EnquirySubmittedPage extends StatefulWidget {
  @override
  _EnquirySubmittedPageState createState() => _EnquirySubmittedPageState();
}

class _EnquirySubmittedPageState extends State<EnquirySubmittedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Enquiry',
      ),
      body: Stack(
        children: [
          Container(
            width: SizeConfig.getScreenWidth(context),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.getScreenHeight(context) * 0.08,),
                Image.asset('assets/images/logoLarge.png'),
                SizedBox(height: 30,),
                Container(
                  width: SizeConfig.getScreenWidth(context) * 0.7,
                  child: Text('Your enquiry has been submitted successfully.',textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF92DE38),fontWeight: FontWeight.w700,fontSize: SizeConfig.textMultiplier * 2.2),),
                ),
                SizedBox(height: 16,),
                Text('Your Applicant ID is - IRHS28SD',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2,fontWeight: FontWeight.w400),),
                SizedBox(height: 25,),
                Text('We have also mailed you Applicant ID',style: TextStyles.subTitle,),
                SizedBox(height: 4,),
                Text('Please make the payment to proceed further',style: TextStyles.subTitle,),
                SizedBox(height: SizeConfig.getScreenHeight(context) * 0.1,),
                Column(
                  children: [
                    Text('Payment',style: TextStyles.heading1,),
                    SizedBox(height: 14,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Application Fee',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2,color: Color(0xFF83898D),fontWeight: FontWeight.w600),),
                        Text('Rs. 100',style: TextStyles.heading1,)
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Registration Fee',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2,color: Color(0xFF83898D),fontWeight: FontWeight.w600),),
                        Text('Rs. 900',style: TextStyles.heading1,)
                      ],
                    ),
                    Divider(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Amount',style: TextStyles.heading2),
                        Text('Rs. 35600',style: TextStyles.heading2,)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          BottomButton(
            title: 'Proceed to Payment',
            onPressed: (){

            },
          )
        ],
      ),
    );
  }
}
