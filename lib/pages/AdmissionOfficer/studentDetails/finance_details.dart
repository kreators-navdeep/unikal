import 'package:flutter/material.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/appCheckBox.dart';
import 'package:manipaldubai/utils/widgets/app_button.dart';
import 'package:manipaldubai/utils/widgets/app_drop_down2.dart';

class FinanceDetails extends StatefulWidget {
  @override
  _FinanceDetailsState createState() => _FinanceDetailsState();
}

class _FinanceDetailsState extends State<FinanceDetails> {


  List<String> _discounts = ['Additional 5%','Additional 5%'];

  _buildDiscountBlock(index){
    return Container(
      padding: const EdgeInsets.only(top: 12,left: 12,right: 12),
      margin: const EdgeInsets.only(bottom: 12),
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
              Text(_discounts[index],style: TextStyle(fontWeight: FontWeight.w500,fontSize: SizeConfig.textMultiplier * 2),),
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
                    // padding: const EdgeInsets.all(4),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(8),
                    //   color: Color(0xFFE5E5E5)
                    // ),
                    child: AppCheckBox(),
                  )
                ],
              ),
              SizedBox(height: 16,),
              TextButton(
                onPressed: (){
                  setState(() {
                    _discounts.removeAt(index);
                  });
                },
                  child: Text('Remove',style: TextStyle(color: Theme.of(context).errorColor),))
            ],
          )
        ],
      ),
    );
  }


  _buildDiscountSheet(){
    return Container(
      height: SizeConfig.getScreenHeight(context) * 0.8,
      padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('SELECT DISCOUNT',style: TextStyles.heading1,),
              IconButton(icon: Icon(Icons.cancel_outlined,size: 30,color: Theme.of(context).disabledColor,), onPressed: (){
                Navigator.pop(context);
              })
            ],
          ),
          SizedBox(height: 25,),
          Container(
            height: SizeConfig.getScreenHeight(context) * 0.65,
            child: ListView.separated(itemBuilder: (ctx,index){
              return InkWell(
                  onTap: (){
                    _discounts.add('Additional 5%');
                    Navigator.pop(context);
                  },
                  child: Text('Additional 5%',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.6),));
            }, separatorBuilder: (ctx,index){
              return SizedBox(height: 20,);
            }, itemCount: 10),
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
          Column(
            children: List.generate(_discounts.length, (index) {
              return _buildDiscountBlock(index);
            }),
          ),
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
                  onPressed: ()async{
                    await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(25)),
                        ),
                        builder: (builder){
                          return _buildDiscountSheet();
                        }
                    );
                    setState(() {

                    });
                  },
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
