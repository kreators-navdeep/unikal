import 'package:flutter/material.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/app_drop_down2.dart';

class FinanceDetails extends StatefulWidget {
  @override
  _FinanceDetailsState createState() => _FinanceDetailsState();
}

class _FinanceDetailsState extends State<FinanceDetails> {

  _buildDiscountBlock(){
    return Container(
      padding: const EdgeInsets.only(top: 12,left: 12,right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5,color: Colors.grey)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Additional 5%',style: TextStyle(fontWeight: FontWeight.w500,fontSize: SizeConfig.textMultiplier * 2),),
              SizedBox(height: 12,),
              Text('Sub-Type: Additional',style: TextStyle(color: Colors.grey[800],fontSize: SizeConfig.textMultiplier * 1.6),)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('Auto Approved',style: TextStyle(color: Colors.grey[600],fontSize: SizeConfig.textMultiplier * 1.6),),
                  SizedBox(width: 6,),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFE5E5E5)
                    ),
                    child: Icon(Icons.check,color: Theme.of(context).primaryColor,),
                  )
                ],
              ),
              SizedBox(height: 16,),
              TextButton(
                  child: Text('Remove',style: TextStyle(color: Theme.of(context).errorColor),))
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6,),
          Text('Discount/Scholarship/Installment',style: TextStyles.heading1,),
          SizedBox(height: 6,),
          _buildDiscountBlock(),
          SizedBox(height: 12,),
          _buildDiscountBlock(),
          SizedBox(height: 12,),
          Container(
            width: SizeConfig.getScreenWidth(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).accentColor.withOpacity(0.1)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 16),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: (){},
                  child: Icon(Icons.add_rounded,size: SizeConfig.imageSizeMultiplier * 12,),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                ),
                SizedBox(width: 16,),
                Text('Add Discount',style: TextStyle(color: Theme.of(context).accentColor,fontSize: SizeConfig.textMultiplier * 2),)
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: SizeConfig.getScreenWidth(context) * 0.42,
                child: AppDropDown2(
                  items: [],
                  title: 'Installments',
                ),
              ),
              Container(
                width: SizeConfig.getScreenWidth(context) * 0.42,
                child: AppDropDown2(
                  items: [],
                  hint: '',
                  title: 'Fee Classification',
                ),
              ),
            ],
          ),
          AppDropDown2(
            items: [],
            hint: '',
            title: 'Hostel Installments',
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppButton(text: 'Submit', onPressed: (){}),
          ),
          SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Fee List',style: TextStyles.heading1,),
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Application Fee'),
                  Text('100',style: TextStyles.heading1,)
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Registeration Fee'),
                  Text('900',style: TextStyles.heading1,)
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tuition Fees I'),
                  Text('17000',style: TextStyles.heading1,)
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tuition Fees II'),
                  Text('17000',style: TextStyles.heading1,)
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Caution Deposit'),
                  Text('500',style: TextStyles.heading1,)
                ],
              ),
              SizedBox(height: 12,),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){}, child: Text('Fee advice',style: TextStyle(decoration: TextDecoration.underline),)))

            ],
          )
        ],
      ),
    );
  }
}