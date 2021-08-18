
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unikul/constants/constants.dart';
import 'package:unikul/utils/size_config.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final IconData suffixIcon;
  final VoidCallback onPressed;
  final bool isBoxShadow;
  final WrapAlignment alignment;
  final bool isFullWidth;

  const AppButton({
    this.bgColor = themeColor ,
    @required this.text,
    this.suffixIcon,
    @required this.onPressed,
    this.isBoxShadow = false,
    this.alignment = WrapAlignment.center,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: alignment,
      children: [
        Container(
          width: isFullWidth ? double.infinity : null,
          decoration: BoxDecoration(
            boxShadow: isBoxShadow
                ? [
              BoxShadow(
                offset: Offset(0.00, 3.00),
                color: Color(0xff000000).withOpacity(0.16),
                blurRadius: 6,
              )
            ]
                : [],
          ),
          // height: 40.0 +
          //     (bottomInset ? MediaQuery.of(context).padding.bottom - 10 : 0),
          child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(
                horizontal: 30,vertical: 13
            ),
            color: bgColor,
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: SizeConfig.textMultiplier * 2.2),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
