import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unikul/utils/Routes/routes.dart';
import 'package:unikul/utils/size_config.dart';
import 'package:unikul/utils/styles/text.dart';
import 'package:unikul/utils/widgets/app_button.dart';
import 'package:unikul/utils/widgets/textfield.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {

  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeySignUp = GlobalKey<FormState>();

  TabController _controller;
  int _selectedIndex = 0;


  List<Widget> list = [
    Tab(child: Text('Create Account',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.4),)),
    Tab(child: Text('Login',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.4))),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: list.length, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  _buildSocialLoginButton({String icon,String text}){
    return Container(
      width: double.infinity,
      child: OutlinedButton(
          onPressed: (){},
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            side: BorderSide(width: 1,color: Colors.grey),
            padding: const EdgeInsets.symmetric(vertical: 13)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/$icon.svg'),
              SizedBox(width: 8,),
              Text(text,style: TextStyle(fontSize: SizeConfig.textMultiplier * 2,color: Theme.of(context).textTheme.bodyText1.color),)
            ],
          )
      ),
    );
  }

  _buildCreateAccount(){
    return SingleChildScrollView(
      child: Form(
        key: _formKeySignUp,
        child: Column(
          children: [
            SizedBox(height: 20,),
            _buildSocialLoginButton(text: 'Continue with Linkedin',icon: 'linkedin'),
            SizedBox(height: 14,),
            _buildSocialLoginButton(text: 'Continue with Google',icon: 'google'),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: Container(height: 1,color: Theme.of(context).dividerColor,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Text('or',style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.8),),
                ),
                Expanded(child: Container(height: 1,color: Theme.of(context).dividerColor,)),
              ],
            ),
            SizedBox(height: 20,),
            AppTextField(
              defaultValidators: [
                DefaultValidators.VALID_EMAIL
              ],
              prefix: Icon(Icons.email_outlined),
              hint: 'Email',
            ),
            SizedBox(height: 14,),
            AppTextField(
              defaultValidators: [
                DefaultValidators.VALID_PASSWORD
              ],
              prefix: Icon(Icons.lock_outline_rounded),
              hint: 'Password',
            ),
            SizedBox(height: 14,),
            AppTextField(
              defaultValidators: [
                DefaultValidators.VALID_PASSWORD
              ],
              prefix: Icon(Icons.lock_outline_rounded),
              hint: 'Confirm Password',
            ),
            SizedBox(height: 16,),
            Text.rich(
              TextSpan(
                text: 'By creating an account you agree to our',
                children: [
                  TextSpan(
                    text : 'Terms and Condition',
                    style: TextStyle(decoration: TextDecoration.underline),
                    children: [],
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text : 'Privacy and Cookie Statement',
                    style: TextStyle(decoration: TextDecoration.underline),
                    children: [],
                  ),
                ]
              )
            ),
            SizedBox(height: 16,),


          ],
        ),
      ),
    );
  }

  _buildLogin(){
    return SingleChildScrollView(
      child: Form(
        key: _formKeyLogin,
        child: Column(
          children: [
            SizedBox(height: 20,),
            _buildSocialLoginButton(text: 'Continue with Linkedin',icon: 'linkedin'),
            SizedBox(height: 14,),
            _buildSocialLoginButton(text: 'Continue with Google',icon: 'google'),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: Container(height: 1,color: Theme.of(context).dividerColor,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Text('or',style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.8),),
                ),
                Expanded(child: Container(height: 1,color: Theme.of(context).dividerColor,)),
              ],
            ),
            SizedBox(height: 20,),
            AppTextField(
              defaultValidators: [
                DefaultValidators.VALID_EMAIL,
              ],
              prefix: Icon(Icons.email_outlined),
              hint: 'Email',
            ),
            SizedBox(height: 14,),
            AppTextField(
              defaultValidators: [
                DefaultValidators.VALID_PASSWORD
              ],
              prefix: Icon(Icons.lock_outline_rounded),
              hint: 'Password',
            ),
            SizedBox(height: 16,),
            TextButton(
                onPressed: (){
                  Navigator.push(context, Routes.forgotPassword());
                },
                child: Text('Forgot Password?',style: TextStyle(color: Theme.of(context).errorColor,decoration: TextDecoration.underline,fontSize: SizeConfig.textMultiplier * 2),))
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 25,right: 25),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: SizeConfig.getScreenHeight(context) * 0.9,
                width: SizeConfig.getScreenWidth(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: SizeConfig.getScreenHeight(context) * 0.1,),
                    Image.asset('assets/images/logo.png',height: SizeConfig.getScreenHeight(context) * 0.15,),
                    SizedBox(height: 40,),
                    Container(
                      height: SizeConfig.getScreenHeight(context) * 0.06,
                      width: SizeConfig.getScreenWidth(context),
                      child: TabBar(
                        controller: _controller,
                        tabs: list,
                        labelColor: Colors.black,
                      ),
                    ),
                    Container(
                      width: SizeConfig.getScreenWidth(context),
                      height: SizeConfig.getScreenHeight(context) * 0.59 - 40,
                      child: TabBarView(
                        controller: _controller,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          _buildCreateAccount(),
                          _buildLogin()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: SizeConfig.getScreenHeight(context) * 0.1,
                width: SizeConfig.getScreenWidth(context),
                child: AppButton(
                  text: _selectedIndex == 0 ?'Sign Up': 'Login',
                  isFullWidth: true,
                  onPressed: (){
                    FocusScope.of(context).unfocus();
                    if(_selectedIndex == 0){
                      if (!_formKeySignUp.currentState.validate()) return;
                      _formKeyLogin.currentState.save();
                    }else{
                      if (!_formKeyLogin.currentState.validate()) return;
                      _formKeyLogin.currentState.save();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
