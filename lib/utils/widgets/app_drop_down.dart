import 'package:flutter/material.dart';
import 'package:unikul/utils/size_config.dart';

class AppDropDown extends StatefulWidget {
  final List<DropdownMenuItem> items;
  final String hint;
  final double width;
  final dynamic value;
  final void Function(dynamic) onChanged;
  AppDropDown({this.items,this.hint = '',this.width = 100,this.onChanged,this.value});
  @override
  _AppDropDownState createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: widget.width,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xFFF9F9F9),
          border: Border.all(color: Colors.grey,width: 0.2)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton(
        isExpanded: true,
        underline: SizedBox(),
        onChanged: widget.onChanged,
        hint: Text(widget.hint),
        items: widget.items,
        value: widget.value,
      ),
    );
  }
}
