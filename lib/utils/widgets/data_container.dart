import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';

class DataContainer extends StatefulWidget {
  final String title;
  final Widget data;
  final String text;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;

  DataContainer({this.title,this.data,this.text,this.padding = const  EdgeInsets.symmetric(vertical: 10,horizontal: 14),this.onPressed});

  @override
  _DataContainerState createState() => _DataContainerState();
}

class _DataContainerState extends State<DataContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.getScreenWidth(context),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFA5B0C2),width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: widget.onPressed,
        child: Padding(
          padding: widget.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             widget.title != null ? Column(
               children: [
                 Text(widget.title,style: TextStyle(color: Color(0xFF252B2D).withOpacity(0.6)),),
                 SizedBox(height: 4,)
               ],
             ):SizedBox(),
              widget.data != null ? widget.data : Text(widget.text,style: TextStyle(fontSize: SizeConfig.textMultiplier * 2,fontWeight: FontWeight.w400),),
            ],
          ),
        ),
      ),
    );
  }
}
