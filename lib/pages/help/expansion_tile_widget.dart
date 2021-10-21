import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/size_config.dart';

class ExpansionTileWidget extends StatefulWidget {
  final String title;
  final List<Widget> children;
  ExpansionTileWidget({this.title,this.children});
  @override
  _ExpansionTileWidgetState createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {

  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return  ExpansionTile(
      trailing: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 1.5,color: Colors.grey[600])
        ),
        child: Icon(_expanded ? Icons.remove : Icons.add,color: Colors.grey,),
      ),
      onExpansionChanged: (val){
        setState(() {
          _expanded = val;
        });
      },
      expandedAlignment: Alignment.centerLeft,
      title: Text(widget.title),
      childrenPadding:  EdgeInsets.only(left: 16,right: SizeConfig.getScreenWidth(context) * 0.2,bottom: 16),
      children: widget.children,

    );
  }
}
