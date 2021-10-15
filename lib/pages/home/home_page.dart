import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/Routes/routes.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/textfield.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _buildListItem(){
    return Container(
      width: SizeConfig.getScreenWidth(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          onTap: (){
            Navigator.push(context, Routes.courseDetail(title: 'BCA'));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/bca.png',),
                  SizedBox(width: 22,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('BCA',style: TextStyles.heading1,),
                      SizedBox(height: 6,),
                      Text('36 Months',style: TextStyles.subTitle,)
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12,bottom: 12),
                child: Text('In Academy',style: TextStyle(color: Colors.grey[600],fontSize: SizeConfig.textMultiplier * 2),),
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
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/logo1.png',),
            IconButton(icon: Icon(Icons.notifications_none_outlined,color: Colors.grey,), onPressed: (){
              Navigator.push(context, Routes.notification());
            })
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              padding: const EdgeInsets.only(top: 15,right: 15,left: 15,bottom: 15),
              child: Column(
                children: [
                  AppTextField(
                    hint: 'Search Courses',
                    defaultValidators: [],
                    prefix: Icon(Icons.search,color: Colors.grey,),
                  )
                ],
              ),
            ),
            Container(
              height: 34,
              width: SizeConfig.getScreenWidth(context),
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx,index){
                    return index == 0 ?TextButton(
                        onPressed: (){},
                        child: Text('Undergraduate',style: TextStyle(color: Colors.white) ,),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF40A8FF),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        padding: const EdgeInsets.symmetric(horizontal: 20)
                      ),
                    ) : OutlinedButton(
                        onPressed: (){},
                        child: Text('Undergraduate',style: TextStyle(color: Colors.black),),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        side: BorderSide(color: Color(0xFF464646))
                      ),
                    );
                  },
                  separatorBuilder: (ctx,index){
                    return SizedBox(width: 8,);
                  },
                  itemCount: 5
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15,right: 15,left: 15),
              child: Column(
                children: List.generate(6, (index){
                  return _buildListItem();
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
