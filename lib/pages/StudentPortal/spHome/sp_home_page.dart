import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unikul/constants/constants.dart';
import 'package:unikul/utils/Routes/routes.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';

class SpHomePage extends StatefulWidget {
  @override
  _SpHomePageState createState() => _SpHomePageState();
}

class _SpHomePageState extends State<SpHomePage> {

  _buildFields({String name,String max,String obtain}){
    return  Container(
      padding: const EdgeInsets.symmetric(vertical: 9,horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name,
            style: TextStyles.subTitle,
          ),
          Row(
            children: [
              Text(max,
                style: TextStyles.subTitle,
              ),
              SizedBox(width: 10,),
              Text(obtain,
                style: TextStyles.subTitle,
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildProjectPlanning(){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Container(
        width: SizeConfig.getScreenWidth(context),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Color(0xFFFEFEFE)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enterprenaurship & Project Planing',style: TextStyles.heading2,),
                  SizedBox(height: 4,),
                  Text('BBA 202',style: TextStyles.subTitle,),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                Container(
                  color: Theme.of(context).accentColor.withOpacity(0.2),
                  padding: const EdgeInsets.symmetric(vertical: 9,horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('INTERNAL',
                        style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            color: Theme.of(context).accentColor
                        ),
                      ),
                      Row(
                        children: [
                          Text('MAX MARKS',
                            style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 1.8,
                                color: Theme.of(context).accentColor
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text('MARKS OBTAINED',
                            style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 1.8,
                                color: Theme.of(context).accentColor
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                _buildFields(name: 'Internal Session 1',max: "20.0",obtain: "0.0"),
                _buildFields(name: 'Internal Session 2',max: "20.0",obtain: "0.0"),

                Container(
                  color: Theme.of(context).accentColor.withOpacity(0.2),
                  padding: const EdgeInsets.symmetric(vertical: 9,horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Assignment',
                        style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            color: Theme.of(context).accentColor
                        ),
                      ),
                      Row(
                        children: [
                          Text('MAX MARKS',
                            style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 1.8,
                                color: Theme.of(context).accentColor
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text('MARKS OBTAINED',
                            style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 1.8,
                                color: Theme.of(context).accentColor
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                _buildFields(name: 'Assignment 1',max: "30.0",obtain: "0.0"),

              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Image.asset('assets/images/logo1.png',),
        actions: [
          SvgPicture.asset('assets/icons/locate.svg'),
          IconButton(icon: Icon(Icons.notifications_none_outlined,color: Colors.grey,), onPressed: (){
            Navigator.push(context, Routes.notification());
          })
        ],
      ),
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
              padding: const EdgeInsets.only(right: 15,left: 15,bottom: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Registration No: 200108002',style: TextStyles.subTitle,),
                      Text('SLCM No: 379469',style: TextStyles.subTitle,),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            color: themeGreen.withOpacity(0.2),
                            border: Border.all(color: themeGreen,width: 0.2)
                          ),
                          height: 160,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('82.4 %',style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 3.5,
                                fontWeight: FontWeight.w500,
                                color: themeGreen
                              ),),
                              SizedBox(height: 6,),
                              Text('Overall Attendance',style: TextStyles.bodyText1Black,)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Theme.of(context).primaryColor.withOpacity(0.2),
                              border: Border.all(color: Theme.of(context).primaryColor,width: 0.2)

                          ),
                          height: 160,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('82.4 %',style: TextStyle(
                                  fontSize: SizeConfig.textMultiplier * 3.5,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor
                              ),),
                              SizedBox(height: 6,),
                              Text("Today's Attendance",style: TextStyles.bodyText1Black,)
                              ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  _buildProjectPlanning()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
