import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/bottom_button.dart';
import 'package:unikul/utils/widgets/my_app_bar.dart';

class CourseDetailPage extends StatefulWidget {
  final String title;
  CourseDetailPage({this.title});
  @override
  _CourseDetailPageState createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: widget.title,
        actions: [
          IconButton(icon: Icon(Icons.notifications_none_outlined,color: Colors.grey,), onPressed: (){})
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: SizeConfig.getScreenHeight(context),
            padding: const EdgeInsets.only(left: 15,right: 15,top: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Programme Duration:',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2,color: Colors.grey[600]),),
                      Text('36 Months',style: TextStyles.heading1,)
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Application Headline:',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2,color: Colors.grey[600]),),
                      Text('31 March 2021',style: TextStyles.heading1,)
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Application Deadline:',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2,color: Colors.grey[600]),),
                      Text('31 March 2021',style: TextStyles.heading1,)
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Modes of Study:',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2,color: Colors.grey[600]),),
                      Text('In Academy',style: TextStyles.heading1,)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('About this Course',style: TextStyles.heading1,),
                      SizedBox(height: 8,),
                      Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet massa nunc sem sodales tempus magna egestas. Massa eu dignissim dui rhoncus nisl, volutpat. Ut nibh posuere urna accumsan sit lacus, quam eget facilisi. Quis sed libero, laoreet et nulla. Placerat gravida ullamcorper quis hac scelerisque non vitae nulla dictum. Porta massa adipiscing aenean viverra facilisis velit vestibulum aliquet. Mauris sit amet orci et rutrum pellentesque. Rhoncus, sodales quam et tellus tristique est congue pellentesque. Vitae cursus netus sit aenean et nulla at. Leo libero scelerisque donec elit est potenti quisque auctor. Auctor sit nunc nisl urna viverra ipsum in dolor. Etiam posuere ac integer lobortis amet elementum, nunc. Mauris amet in ullamcorper sodales vulputate lobortis imperdiet morbi.',
                        style: TextStyles.subTitle,
                      )
                    ],
                  ),
                  SizedBox(height: 8,),
                  Text('Specialization',style: TextStyles.heading2,),
                  SizedBox(height: 8,),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 30),
                        height: 47,
                        width: SizeConfig.getScreenWidth(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Text('Marketing',style: TextStyles.heading1,),
                      ),
                      SizedBox(height: 8,),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 30),
                        height: 47,
                        width: SizeConfig.getScreenWidth(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Text('Finance',style: TextStyles.heading1,),
                      ),
                      SizedBox(height: 8,),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 30),
                        height: 47,
                        width: SizeConfig.getScreenWidth(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Text('Human Resource',style: TextStyles.heading1,),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'Enquire',
            onPressed: (){},
          )
        ],
      ),
    );
  }
}
