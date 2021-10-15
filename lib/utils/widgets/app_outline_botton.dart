import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/size_config.dart';

class AppOutlineButton extends StatefulWidget {
  final String text;
  final Color bgColor;
  final VoidCallback onPressed;
  final bool isFullWidth;
  AppOutlineButton({this.text,this.bgColor,this.onPressed,this.isFullWidth = false});
  @override
  _AppOutlineButtonState createState() => _AppOutlineButtonState();
}

class _AppOutlineButtonState extends State<AppOutlineButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.isFullWidth ? double.infinity : null,
      child: OutlinedButton(
          onPressed: widget.onPressed,
          child: Text(widget.text,style: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.w600,fontSize: SizeConfig.textMultiplier * 2.2),),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6),
          side: BorderSide(
            color: Theme.of(context).accentColor,
            width: 0.5,
          )
          ),
          padding: EdgeInsets.symmetric(
              horizontal: 30,vertical: 13
          ),
        ),
      ),
    );
  }
}
