import 'package:flutter/material.dart';
import 'package:unikul/utils/size_config.dart';

class AppDropDown2 extends StatefulWidget {
  final String title;
  final List<String> items;
  final void Function(dynamic) onChanged;
  final dynamic value;
  final String hint;

  AppDropDown2({this.title,this.items,this.onChanged,this.value,this.hint = ''});
  @override
  _AppDropDown2State createState() => _AppDropDown2State();
}

class _AppDropDown2State extends State<AppDropDown2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title != null ? Padding(
            padding: const EdgeInsets.only(bottom: 4,left: 4),
            child: Text(widget.title,style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.8),),
          ) : SizedBox(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(width: 1,color: Colors.grey),
                boxShadow: [
                  BoxShadow(spreadRadius: 0,blurRadius: 2,offset: Offset(0,2),color: Colors.grey[400])
                ]
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              onChanged: widget.onChanged,
              value: widget.value,
              icon: Icon(Icons.keyboard_arrow_down_rounded),
              underline: SizedBox(),
              hint: Text(widget.hint),
              items: widget.items.map((String e){
                return DropdownMenuItem<String>(
                  value: e,
                    child: Text(e)
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
