import 'package:flutter/material.dart';

class AppCheckBox extends StatefulWidget {



  @override
  _AppCheckBoxState createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: Colors.white,
      ),
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Theme.of(context).primaryColor)
        ),
        child: Checkbox(
          value: _value,
          checkColor: Theme.of(context).primaryColor,
          activeColor: Colors.white,
          onChanged: (val){
            setState(() {
              _value = val;
            });
          },
        ),
      ),
    );
  }
}
