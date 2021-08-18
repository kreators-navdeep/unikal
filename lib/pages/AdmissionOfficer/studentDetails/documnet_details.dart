import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/app_drop_down2.dart';
import 'package:unikul/utils/widgets/app_outline_botton.dart';

class DocumentDetails extends StatefulWidget {
  @override
  _DocumentDetailsState createState() => _DocumentDetailsState();
}

class _DocumentDetailsState extends State<DocumentDetails> {

  _buildTrail({String text}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/pdf.svg'),
            SizedBox(width: 12,),
            Text(text,style: TextStyle(fontSize: SizeConfig.textMultiplier * 2,fontWeight: FontWeight.w500),)
          ],
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFE9F9F5),
                  borderRadius: BorderRadius.circular(8)
              ),
              padding: const EdgeInsets.all(12),
              child: Icon(Icons.file_download,color: Color(0xFF01CC99),size: SizeConfig.imageSizeMultiplier * 6,),
            ),
            SizedBox(width: 16,),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFE4E4),
                  borderRadius: BorderRadius.circular(8)
              ),
              padding: const EdgeInsets.all(12),
              child: Icon(Icons.delete_outline_outlined,color: Color(0xFFF12626),size: SizeConfig.imageSizeMultiplier * 6,),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6,),
          Text('Upload Documents',style: TextStyles.heading1,),
          SizedBox(height: 12,),
          AppDropDown2(
            title: 'Document Category',
            items: [],
            onChanged: (val){

            },
          ),
          SizedBox(height: 12,),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                // height: 230,
                margin: const EdgeInsets.only(bottom: 25),
                width: SizeConfig.getScreenWidth(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).accentColor.withOpacity(0.2)
                ),
                padding:  EdgeInsets.only(left: SizeConfig.getScreenWidth(context) * 0.1,right: SizeConfig.getScreenWidth(context) * 0.1,top: 40,bottom: 35),
                child: Column(
                  children: [
                    DottedBorder(
                      color: Theme.of(context).accentColor,
                      strokeWidth: 1,
                      borderType: BorderType.Circle,
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: (){},
                          child: Icon(Icons.add_rounded,size: SizeConfig.imageSizeMultiplier * 12,),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text('Upload a Document',style: TextStyle(color: Color(0xFF464646),fontWeight: FontWeight.w500,fontSize: SizeConfig.textMultiplier * 2.5),),
                    SizedBox(height: 15,),
                    Text('Upload your document by importing or scanning with your camera',textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF9D9D9D)),)
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5
                    ),
                    color: Colors.white
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.camera_alt,color: Color(0xFF48009C),),
                      SizedBox(width: 8,),
                      Text('Use Camera',style: TextStyle(fontWeight: FontWeight.w500,color: Color(0xFF48009C),fontSize: SizeConfig.textMultiplier * 2),)
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 25,),
          _buildTrail(text: '10th Marksheet.pdf'),
          SizedBox(height: 20,),
          _buildTrail(text : '12th Marksheet.pdf'),
          SizedBox(height: 25,),
          Row(
            children: [
              Expanded(child: AppOutlineButton(text: 'Save',onPressed: (){},)),
              SizedBox(width: 20,),
              Expanded(child: AppButton(text: 'Submit', onPressed: (){}))
            ],
          ),
          SizedBox(height: 25,),
        ],
      ),
    );
  }
}
