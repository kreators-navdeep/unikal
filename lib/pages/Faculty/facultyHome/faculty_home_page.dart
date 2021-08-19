import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:unikul/constants/constants.dart';
import 'package:unikul/utils/Routes/routes.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/app_drop_down2.dart';
import 'package:unikul/utils/widgets/my_app_bar_2.dart';
import 'package:unikul/utils/widgets/textfield.dart';

class FacultyHomePage extends StatefulWidget {
  @override
  _FacultyHomePageState createState() => _FacultyHomePageState();
}

class _FacultyHomePageState extends State<FacultyHomePage> {

  _buildStudentDetail(){
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: InkWell(
        onTap: (){
          Navigator.push(context, Routes.studentInfo(title: 'Pandya Niyati Vijaykumar'));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pandya Niyati Vijaykumar',style: TextStyles.heading1,),
                  SizedBox(height: 4,),
                  Text('Reg No: 190106029',style: TextStyles.subTitle,),
                  SizedBox(height: 4,),
                  Text('BTech - Mechanical Engineering',style: TextStyle(color: Colors.grey[800],fontSize: SizeConfig.textMultiplier * 1.6),)
                ],
              ),
              OutlinedButton(
                  onPressed: (){},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Theme.of(context).accentColor.withOpacity(0.2),

                  ),
                  child: Text('WINTER',
                    style: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 2,
                        color: Theme.of(context).accentColor
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
                items: [
                  Image.asset('assets/images/banner1.png',fit: BoxFit.fill,),
                  Image.asset('assets/images/banner1.png',fit: BoxFit.fill,),
                  Image.asset('assets/images/banner1.png',fit: BoxFit.fill,),
                  Image.asset('assets/images/banner1.png',fit: BoxFit.fill,),
                ],
                options: CarouselOptions(
                  // height: 200,
                  aspectRatio: 16/7,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  onPageChanged: (index,reason){

                  },
                  scrollDirection: Axis.horizontal,
                )
            ),
            SizedBox(height: 25,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: themeGreen.withOpacity(0.1),
                              border: Border.all(color: themeGreen,width: 0.2)
                          ),
                          height: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('09',style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 3.5,
                                  fontWeight: FontWeight.w500,
                                  color: themeGreen
                              ),),
                              SizedBox(height: 6,),
                              Text('Internal Marks Entry',style: TextStyles.bodyText1Black,)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Theme.of(context).primaryColor.withOpacity(0.1),
                              border: Border.all(color: Theme.of(context).primaryColor,width: 0.2)

                          ),
                          height: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('02',style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 3.5,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor
                              ),),
                              SizedBox(height: 6,),
                              Text("Attendance",style: TextStyles.bodyText1Black,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Search Student',style: TextStyles.heading1,),
                      SizedBox(height: 12,),
                      AppDropDown2(title: 'Course',items: [],
                        onChanged: (val){

                        },
                      ),
                      AppTextField(

                        title: 'Name',
                        defaultValidators: [],
                      )
                    ],
                  ),
                  SizedBox(height: 25,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.getScreenWidth(context) * 0.1),
                    child: AppButton(text: 'Search', onPressed: (){}),
                  ),
                  SizedBox(height: 20,),
                  _buildStudentDetail(),
                  SizedBox(height: 20,),
                ],
               ),
            ),

          ],
        ),
      ),
    );
  }
}
