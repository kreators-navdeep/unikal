import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:unikul/constants/constants.dart';
import 'package:unikul/pages/AdmissionOfficer/search_bottomSheet.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/app_drop_down.dart';
import 'package:unikul/utils/widgets/my_app_bar_2.dart';

class AOHomePage extends StatefulWidget {
  @override
  _AOHomePageState createState() => _AOHomePageState();
}

class _AOHomePageState extends State<AOHomePage> {

  dynamic pendingValue;
  dynamic assignedToValue;

  _buildApplication(){
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 14),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pandya Niyati Vijaykumar',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.2,fontWeight: FontWeight.w500),),
                    SizedBox(height: 4,),
                    Text('APP202101996',style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.8,fontWeight: FontWeight.w500),),
                    SizedBox(height: 4,),
                    Text('91-9725939763',style: TextStyles.subTitle,),
                  ],
                ),
                OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: themeGreen.withOpacity(0.2),

                    ),
                    child: Text('FALL',
                      style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2,
                          color: themeGreen
                      ),
                    )
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Under Graduate AY 2020-2021',style: TextStyles.subTitle,),
                    SizedBox(height: 4,),
                    RichText(text: TextSpan(
                      text: 'Admission Type : ',
                      style: TextStyles.subTitle,
                      children: [
                        TextSpan(text: 'Regular',style: TextStyles.heading1)
                      ]
                    )),
                    SizedBox(height: 4,),
                    Text('Applied on : 18 Jan 2021',style: TextStyles.subTitle,),
                  ],
                ),
                Column(
                  children: [
                    AppDropDown(
                      width: SizeConfig.getScreenWidth(context) * 0.35,
                      onChanged: (val){},
                      value: pendingValue,
                      hint: 'Pending AH A',
                      items: [
                        DropdownMenuItem(child: Text('Pending AH A'))
                      ],
                    ),
                    SizedBox(height: 8,),
                    AppDropDown(
                      width: SizeConfig.getScreenWidth(context) * 0.35,
                      hint: 'Assigned to',
                      onChanged: (val){},
                      items: [
                        DropdownMenuItem(child: Text('Assigned to'))
                      ],
                    )
                  ],
                )
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
      appBar: MyAppBar2(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        icon: Icon(Icons.search,color: Colors.white,),
        label:Text('SEARCH',style: TextStyle(color: Colors.white),),
        onPressed: (){
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(25)),
              ),
              builder: (builder){
                return SearchBottomSheet();
              }
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Applications',style: TextStyles.heading2,),
                  Column(
                    children: List.generate(10, (index) {
                      return _buildApplication();
                    }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
