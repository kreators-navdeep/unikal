import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/Routes/routes.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/my_app_bar.dart';

class MyEnquiryPage extends StatefulWidget {
  @override
  _MyEnquiryPageState createState() => _MyEnquiryPageState();
}

class _MyEnquiryPageState extends State<MyEnquiryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/logo1.png',),
            Icon(Icons.notifications_none_outlined,color: Colors.grey,)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Enquiries',style: TextStyles.heading2,),
            SizedBox(height: 16,),
            Container(
              height: SizeConfig.getScreenHeight(context) -15 -56 -120,
              child: ListView.separated(
                  itemBuilder: (ctx,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, Routes.myEnquiryDetail());
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/icons/collegeLogo.png'),
                                  SizedBox(width: 14,),
                                  Text('Manipal University',style: TextStyles.heading3,)
                                ],
                              ),
                              SizedBox(height: 16,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Graduation',style: TextStyles.heading1,),
                                  Text('24 Months',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2,color: Color(0xFF83898D)),)
                                ],
                              ),
                              SizedBox(height: 6,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('BBA',style: TextStyles.heading2,),
                                  Text('Full Time',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2,color: Color(0xFF83898D)),)
                                ],
                              )

                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx,index){
                    return SizedBox(height: 8,);
                  },
                  itemCount: 1
              ),
            )
          ],
        ),
      ),
    );
  }
}
