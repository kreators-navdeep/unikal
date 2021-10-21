import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/size_config.dart';

class NoConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content:Container(
        height: SizeConfig.heightMultiplier * 25,
        width: SizeConfig.widthMultiplier * 80,
        child: Center(
          child:
          FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Icon(Icons.signal_cellular_connected_no_internet_4_bar_rounded,size: SizeConfig.imageSizeMultiplier * 10,),
                Text('\nSlow or no internet connection'),
                SizedBox(height: 40),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
