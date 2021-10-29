import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manipaldubai/utils/widgets/no_connection.dart';
import 'package:provider/provider.dart';
import 'package:manipaldubai/utils/Api/apis.dart';
import 'package:manipaldubai/utils/Routes/routes.dart';
import 'package:manipaldubai/utils/size_config.dart';
import 'package:manipaldubai/utils/styles/text.dart';
import 'package:manipaldubai/utils/widgets/app_button.dart';
import 'package:manipaldubai/utils/widgets/app_drop_down2.dart';
import 'package:manipaldubai/utils/widgets/showLoading.dart';
import 'package:manipaldubai/utils/widgets/textfield.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  String _value = 'Student portal';

  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeySignUp = GlobalKey<FormState>();

  TabController _controller;
  int _selectedIndex = 1;

  TextEditingController _userIdController = TextEditingController();
  TextEditingController _passController = TextEditingController();


  List<Widget> list = [
    Tab(child: Text('Create Account',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.4),)),
    Tab(child: Text('Login',style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.4))),
  ];

  List<String> users = ['Applicant','Admission officer','Student portal','Faculty'];
  bool _connectionStatus = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        setState(() => _connectionStatus = true);
        break;
      case ConnectivityResult.none:
        setState(() => _connectionStatus = false);
        break;
      default:
        setState(() => _connectionStatus = false);
        break;
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
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

            Text('LogIn',style: TextStyle(color:Colors.grey[800],fontWeight: FontWeight.w800,fontSize: SizeConfig.textMultiplier * 3),),
            SizedBox(height: 20,),
            Container(
              width: 150,
              child: DropdownButton<String>(
                value: _value,
                onChanged: (val){
                  print(val);
                  setState(() {
                    _value = val;
                  });
                },
                items: users.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child:  Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20,),
            // _buildSocialLoginButton(text: 'Continue with Linkedin',icon: 'linkedin'),
            // SizedBox(height: 14,),
            // _buildSocialLoginButton(text: 'Continue with Google',icon: 'google'),
            // SizedBox(height: 20,),
            // Row(
            //   children: [
            //     Expanded(child: Container(height: 1,color: Theme.of(context).dividerColor,)),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 35),
            //       child: Text('or',style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.8),),
            //     ),
            //     Expanded(child: Container(height: 1,color: Theme.of(context).dividerColor,)),
            //   ],
            // ),
            SizedBox(height: 20,),
            AppTextField(
              defaultValidators: [
                DefaultValidators.REQUIRED,
              ],
              controller: _userIdController,
              prefix: Icon(Icons.person_outline),
              hint: 'User ID',
            ),
            SizedBox(height: 14,),
            AppTextField(
              defaultValidators: [
                DefaultValidators.VALID_PASSWORD
              ],
              controller: _passController,
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
      resizeToAvoidBottomInset: true,
      body: !_connectionStatus ? NoConnection() : Container(
        height: SizeConfig.getScreenHeight(context),
        child: Consumer<ApiProvider>(
          builder: (ctx,api,child){
            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: SizeConfig.getScreenHeight(context) * 0.9,
                          width: SizeConfig.getScreenWidth(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(height: SizeConfig.getScreenHeight(context) * 0.06,),
                              Image.asset('assets/images/logo.png',height: SizeConfig.getScreenHeight(context) * 0.14,),
                              SizedBox(height: SizeConfig.getScreenHeight(context) * 0.1,),
                              _buildLogin(),
                              SizedBox(height: SizeConfig.getScreenHeight(context) * 0.05,),
                              // Container(
                              //   height: SizeConfig.getScreenHeight(context) * 0.06,
                              //   width: SizeConfig.getScreenWidth(context),
                              //   child: TabBar(
                              //     controller: _controller,
                              //     tabs: list,
                              //     labelColor: Colors.black,
                              //   ),
                              // ),
                              // Container(
                              //   width: SizeConfig.getScreenWidth(context),
                              //   height: SizeConfig.getScreenHeight(context) * 0.62 - 40,
                              //   child: TabBarView(
                              //     controller: _controller,
                              //     physics: NeverScrollableScrollPhysics(),
                              //     children: [
                              //       _buildCreateAccount(),
                              //       _buildLogin()
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                        ),
                        Container(
                          height: SizeConfig.getScreenHeight(context) * 0.1,
                          width: SizeConfig.getScreenWidth(context),
                          child: AppButton(
                            text: _selectedIndex == 0 ?'Sign Up': 'Login',
                            isFullWidth: true,
                            onPressed: ()async{
                              FocusScope.of(context).unfocus();

                              if(_selectedIndex == 0){
                                if (!_formKeySignUp.currentState.validate()) return;
                                _formKeyLogin.currentState.save();
                              }else{
                                if (!_formKeyLogin.currentState.validate()) return;
                                _formKeyLogin.currentState.save();

                                switch(_value){
                                  case 'Applicant' : Navigator.push(context, Routes.landing());
                                  break;

                                  case 'Admission officer' : Navigator.push(context, Routes.aoLanding());
                                  break;

                                  case 'Student portal' : Navigator.push(context, Routes.spLanding());
                                  break;

                                  case 'Faculty' : Navigator.push(context, Routes.facultyLanding());
                                  break;
                                }

                                final res = await api.login(userId: _userIdController.text.trim(),password: _passController.text.trim());
                                Fluttertoast.showToast(msg: res['message'], toastLength: Toast.LENGTH_SHORT);
                                if(res['status'].toString().toLowerCase() == 'success'){
                                  Navigator.pushReplacement(context, Routes.spLanding());
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if(api.isLoading)
                Container(
                  width: SizeConfig.getScreenWidth(context),
                  height: SizeConfig.getScreenHeight(context),
                  color: Colors.grey.withOpacity(0.5),
                  child: ShowLoading()
                )
              ],
            );
          },
        ),
      ),
    );
  }

  _onStudentLogin(){}
}
