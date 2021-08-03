import 'package:flutter/material.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/widgets/app_button.dart';

class BottomButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;

  BottomButton({this.title,this.onPressed});
  @override
  _BottomButtonState createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.only(left: 40,right: 40,bottom: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            boxShadow: [
            BoxShadow(spreadRadius: 1,blurRadius: 5,color: Theme.of(context).shadowColor.withOpacity(0.2))
          ]
        ),
        alignment: Alignment.center,
        width: SizeConfig.getScreenWidth(context),
        height: SizeConfig.getScreenHeight(context) * 0.12,
        child: AppButton(
          text: widget.title,
          onPressed: widget.onPressed,
          isFullWidth: true,

        ),
      ),
    );
  }
}
