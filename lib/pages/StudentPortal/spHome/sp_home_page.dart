import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manipaldubai/utils/widgets/no_connection.dart';
import 'package:provider/provider.dart';
import 'package:manipaldubai/constants/constants.dart';
import 'package:manipaldubai/utils/Api/apis.dart';
import 'package:manipaldubai/utils/Routes/routes.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/my_app_bar_2.dart';
import 'package:manipaldubai/utils/widgets/showLoading.dart';

class SpHomePage extends StatefulWidget {
  @override
  _SpHomePageState createState() => _SpHomePageState();
}

class _SpHomePageState extends State<SpHomePage> {

  _buildFields({String name,String max,String obtain,Color bgColor}){
    return  FittedBox(
      child: Container(
        color: bgColor,
        width: SizeConfig.getScreenWidth(context),
        padding: const EdgeInsets.symmetric(vertical: 9,horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: SizeConfig.getScreenWidth(context) * 0.4 - 20,
              child: Text(name,
                style: TextStyles.subTitle,
              ),
            ),
            Container(
              width: SizeConfig.getScreenWidth(context) * 0.6 - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(max,
                    style: TextStyles.subTitle,
                  ),
                  SizedBox(width: 10,),
                  Text(obtain,
                    style: TextStyles.subTitle,
                  ),
                ],
              ),
            )
          ],
        ),
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
                _buildHeading(title:'INTERNAL'),
                _buildFields(name: 'Internal Session 1',max: "20.0",obtain: "0.0"),
                _buildFields(name: 'Internal Session 2',max: "20.0",obtain: "0.0"),

                _buildHeading(title:'ASSIGNMENT'),
                _buildFields(name: 'Assignment 1',max: "30.0",obtain: "0.0"),

              ],
            )
          ],
        ),
      ),
    );
  }

  _buildHeading({String title}){
    return Container(
      color: Theme.of(context).accentColor.withOpacity(0.2),
      padding: const EdgeInsets.symmetric(vertical: 9,horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: SizeConfig.getScreenWidth(context) * 0.4 - 20,
            child: Text(title,
              style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 1.5,
                  color: Theme.of(context).accentColor
              ),
            ),
          ),
          Container(
            width: SizeConfig.getScreenWidth(context) * 0.6 - 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('MAX MARKS',
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 1.5,
                      color: Theme.of(context).accentColor
                  ),
                ),
                SizedBox(width: 10,),
                Text('MARKS OBTAINED',
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 1.5,
                      color: Theme.of(context).accentColor
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildRecommended(){
    return Container(
      width: SizeConfig.getScreenWidth(context),
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemBuilder: (ctx,index){
         return ClipRRect(
           borderRadius: BorderRadius.circular(12),
           child: Container(
             width: 200,
             height: 140,
             decoration: BoxDecoration(
               border: Border.all(width: 0.8,color: Colors.grey),
               borderRadius: BorderRadius.circular(12),
             ),
             child: Stack(
               children: [
                 Image.asset('assets/images/banner1.png'),
                 Positioned(
                   bottom: 0,
                   child: Container(
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                     ),
                     height: 70,
                     width: 200,
                     padding: const EdgeInsets.only(left: 6),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('MBA',style: TextStyles.heading1,),
                         SizedBox(height: 4,),
                         Text('University of London',style: TextStyles.heading1,)
                       ],
                     ),
                   )
                 )
               ],
             ),
           ),
         );
        },
        separatorBuilder: (ctx,index){
            return SizedBox(width: 8,);
           },
        itemCount: 6
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: (){
          return Future.delayed(Duration(milliseconds: 1000),(){
            setState(() {});
          });
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<ApiProvider>(
                  builder: (cntx,api,child){
                return FutureBuilder(
                    future: api.getCarouselImages(),
                    builder: (ctx,snapshot){
                      final data = snapshot.data;
                      if(snapshot.hasData){
                        if(data == 'error'){
                          api.logout(context);
                        }
                        return HomeCarouselSlider(data: data,);
                      }else{
                        return ShowLoading();
                      }
                    });
              }),
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
                              color: themeGreen.withOpacity(0.1),
                              border: Border.all(color: themeGreen,width: 0.1)
                            ),
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FutureBuilder(
                                    future: Provider.of<ApiProvider>(context, listen: false).getOverallAttendancePercentage(),
                                    builder: (ctx,snapshot){
                                  if(snapshot.hasData){
                                    return Text('${snapshot.data['OverallAttendancePercentage']}%',style: TextStyle(
                                        fontSize: SizeConfig.textMultiplier * 3.5,
                                        fontWeight: FontWeight.w500,
                                        color: themeGreen
                                    ),);
                                  }else if(snapshot.hasError){
                                    return SizedBox();
                                  }else{
                                    return Text('loading...');
                                  }
                                }),
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
                              color: Theme.of(context).primaryColor.withOpacity(0.1),
                                border: Border.all(color: Theme.of(context).primaryColor,width: 0.2)

                            ),
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FutureBuilder(
                                    future: Provider.of<ApiProvider>(context, listen: false).getOverallAttendancePercentage(),
                                    builder: (ctx,snapshot){
                                      if(snapshot.hasData){
                                        return Text('${snapshot.data['DailyAttendancePercentage']}%',style: TextStyle(
                                            fontSize: SizeConfig.textMultiplier * 3.5,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context).primaryColor
                                        ),);
                                      }else if(snapshot.hasError){
                                        return SizedBox();
                                      }else{
                                        return Text('loading...');
                                      }
                                    }),
                                SizedBox(height: 6,),
                                Text("Today's Attendance",style: TextStyles.bodyText1Black,)
                                ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12,),
                    _buildProjectPlanning(),
                    SizedBox(height: 14,),
                    _buildRecommended()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

  }


}

class HomeCarouselSlider extends StatefulWidget {
  final data;
  HomeCarouselSlider({this.data});
  @override
  _HomeCarouselSliderState createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
            items: List.generate(widget.data.length, (index){
              return Image.network(widget.data[index],fit: BoxFit.fitWidth,width: SizeConfig.getScreenWidth(context),);
            }),
            options: CarouselOptions(
              // height: 200,
              aspectRatio: 16/8,
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
                setState(() {
                  _current = index;
                });
              },
              scrollDirection: Axis.horizontal,
            )
        ),
        Positioned(
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.data.length, (index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Theme.of(context).primaryColor
                        : Color.fromRGBO(0, 0, 0, 0.4)),
              );
            }),
          ),
        )
      ],
    );
  }
}

