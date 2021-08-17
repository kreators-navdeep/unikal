import 'package:flutter/material.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/app_drop_down2.dart';
import 'package:unikul/utils/widgets/textfield.dart';

class SearchBottomSheet extends StatefulWidget {
  @override
  _SearchBottomSheetState createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,top: 20,right: 20),
      height: SizeConfig.getScreenHeight(context) * 0.95,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SEARCH',style: TextStyles.heading2,),
            SizedBox(height: 12,),
            AppTextField(
              title: 'Applicant No./Name/Mobile',
              defaultValidators: [],
            ),
            AppDropDown2(title: 'Drive',items: []),
            AppDropDown2(title: 'Assigned to',items: []),
            AppDropDown2(title: 'Status',items: []),
            AppDropDown2(title: 'Programme level',items: []),
            AppDropDown2(title: 'Programs',items: []),
            AppDropDown2(title: 'Timings',items: []),
            AppDropDown2(title: 'Student Year',items: []),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppButton(text: 'Search', onPressed: (){}),
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
