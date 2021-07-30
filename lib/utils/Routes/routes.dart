import 'package:flutter/material.dart';
import 'package:unikul/pages/auth/auth_page.dart';
import 'package:unikul/pages/auth/forgot_password_page.dart';
import 'package:unikul/pages/auth/otp_verify_page.dart';
import 'package:unikul/pages/auth/reset_password_page.dart';
import 'package:unikul/pages/courses/course_detail_page.dart';
import 'package:unikul/pages/home/enquiry_page.dart';
import 'package:unikul/pages/home/home_page.dart';
import 'package:unikul/pages/splash/splash_page.dart';

class Routes {
  static MaterialPageRoute _makeRoute(Widget page) =>
      MaterialPageRoute(
        builder: (context) => page,
      );

  static MaterialPageRoute splash() => _makeRoute(SplashPage());

  static MaterialPageRoute auth() => _makeRoute(AuthPage());

  static MaterialPageRoute forgotPassword() => _makeRoute(ForgotPasswordPage());

  static MaterialPageRoute verifyOTP() => _makeRoute(OTPVerifyPage());

  static MaterialPageRoute resetPassword() => _makeRoute(ResetPasswordPage());

  static MaterialPageRoute home() => _makeRoute(HomePage());

  static MaterialPageRoute enquiry() => _makeRoute(EnquiryPage());

  static MaterialPageRoute courseDetail({String title}) => _makeRoute(CourseDetailPage(title: title,));


}