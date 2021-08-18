import 'package:flutter/material.dart';
import 'package:unikul/pages/AdmissionOfficer/studentDetails/student_details_page.dart';
import 'package:unikul/pages/ao_landing_page.dart';
import 'package:unikul/pages/auth/auth_page.dart';
import 'package:unikul/pages/auth/forgot_password_page.dart';
import 'package:unikul/pages/auth/otp_verify_page.dart';
import 'package:unikul/pages/auth/reset_password_page.dart';
import 'package:unikul/pages/courses/course_detail_page.dart';
import 'package:unikul/pages/faculty_landing_page.dart';
import 'package:unikul/pages/help/help_page.dart';
import 'package:unikul/pages/home/enquiry_page.dart';
import 'package:unikul/pages/home/enquiry_submitted_page.dart';
import 'package:unikul/pages/home/home_page.dart';
import 'package:unikul/pages/landing_page.dart';
import 'package:unikul/pages/myEnquiry/fill_enrollment_form_page.dart';
import 'package:unikul/pages/myEnquiry/my_enquiry_detail_page.dart';
import 'package:unikul/pages/notification/notification_page.dart';
import 'package:unikul/pages/profile/edit_profile_page.dart';
import 'package:unikul/pages/settings/notification_settings.dart';
import 'package:unikul/pages/settings/sp_settings_page.dart';
import 'package:unikul/pages/sp_landing_page.dart';
import 'package:unikul/pages/splash/splash_page.dart';

class Routes {
  static MaterialPageRoute _makeRoute(Widget page) =>
      MaterialPageRoute(
        builder: (context) => page,
      );
  static MaterialPageRoute landing() => _makeRoute(LandingPage());

  static MaterialPageRoute spLanding() => _makeRoute(SPLandingPage());

  static MaterialPageRoute aoLanding() => _makeRoute(AOLandingPage());

  static MaterialPageRoute facultyLanding() => _makeRoute(FacultyLandingPage());



  static MaterialPageRoute splash() => _makeRoute(SplashPage());

  static MaterialPageRoute auth() => _makeRoute(AuthPage());

  static MaterialPageRoute forgotPassword() => _makeRoute(ForgotPasswordPage());

  static MaterialPageRoute verifyOTP() => _makeRoute(OTPVerifyPage());

  static MaterialPageRoute resetPassword() => _makeRoute(ResetPasswordPage());

  static MaterialPageRoute home() => _makeRoute(HomePage());

  static MaterialPageRoute notification() => _makeRoute(NotificationPage());

  static MaterialPageRoute enquiry() => _makeRoute(EnquiryPage());

  static MaterialPageRoute enquirySubmitted() => _makeRoute(EnquirySubmittedPage());

  static MaterialPageRoute courseDetail({String title}) => _makeRoute(CourseDetailPage(title: title,));

  static MaterialPageRoute studentDetails({String title}) => _makeRoute(StudentDetailsPage(title: title,));


  static MaterialPageRoute editProfile() => _makeRoute(EditProfilePage());

  static MaterialPageRoute myEnquiryDetail() => _makeRoute(MyEnquiryDetailPage());

  static MaterialPageRoute enrollmentForm() => _makeRoute(FillEnrollmentFormPage());

  static MaterialPageRoute spSettings() => _makeRoute(SpSettingsPage());

  static MaterialPageRoute notificationSettings() => _makeRoute(NotificationSettings());

  static MaterialPageRoute help() => _makeRoute(HelpPage());


}