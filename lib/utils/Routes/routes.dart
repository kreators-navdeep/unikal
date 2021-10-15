import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:manipaldubai/pages/AdmissionOfficer/studentDetails/student_details_page.dart';
import 'package:manipaldubai/pages/Faculty/facultyAttendance/attendance_report_page.dart';
import 'package:manipaldubai/pages/Faculty/facultyAttendance/class_attendance_summary_page.dart';

import 'package:manipaldubai/pages/Faculty/facultyHome/studentInfo/student_info_page.dart';
import 'package:manipaldubai/pages/Faculty/facultyInternalMarks/pending_marks_page.dart';
import 'package:manipaldubai/pages/Faculty/facultyInternalMarks/publish_internal_marks_page.dart';
import 'package:manipaldubai/pages/ao_landing_page.dart';
import 'package:manipaldubai/pages/auth/auth_page.dart';
import 'package:manipaldubai/pages/auth/forgot_password_page.dart';
import 'package:manipaldubai/pages/auth/otp_verify_page.dart';
import 'package:manipaldubai/pages/auth/reset_password_page.dart';
import 'package:manipaldubai/pages/courses/course_detail_page.dart';
import 'package:manipaldubai/pages/faculty_landing_page.dart';
import 'package:manipaldubai/pages/help/help_page.dart';
import 'package:manipaldubai/pages/home/enquiry_page.dart';
import 'package:manipaldubai/pages/home/enquiry_submitted_page.dart';
import 'package:manipaldubai/pages/home/home_page.dart';
import 'package:manipaldubai/pages/landing_page.dart';
import 'package:manipaldubai/pages/myEnquiry/fill_enrollment_form_page.dart';
import 'package:manipaldubai/pages/myEnquiry/my_enquiry_detail_page.dart';
import 'package:manipaldubai/pages/notification/notification_page.dart';
import 'package:manipaldubai/pages/profile/edit_profile_page.dart';
import 'package:manipaldubai/pages/settings/notification_settings.dart';
import 'package:manipaldubai/pages/settings/privacy_policy_page.dart';
import 'package:manipaldubai/pages/settings/sp_settings_page.dart';
import 'package:manipaldubai/pages/settings/t_and_c_page.dart';
import 'package:manipaldubai/pages/sp_landing_page.dart';
import 'package:manipaldubai/pages/splash/splash_page.dart';

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


  static MaterialPageRoute enquiry() => _makeRoute(EnquiryPage());

  static MaterialPageRoute enquirySubmitted() => _makeRoute(EnquirySubmittedPage());

  static MaterialPageRoute courseDetail({String title}) => _makeRoute(CourseDetailPage(title: title,));

  static MaterialPageRoute studentDetails({String title}) => _makeRoute(StudentDetailsPage(title: title,));

  static MaterialPageRoute studentInfo({String title}) => _makeRoute(StudentInfoPage(title: title,));


  static MaterialPageRoute editProfile() => _makeRoute(EditProfilePage());

  static MaterialPageRoute myEnquiryDetail() => _makeRoute(MyEnquiryDetailPage());

  static MaterialPageRoute enrollmentForm() => _makeRoute(FillEnrollmentFormPage());

  static MaterialPageRoute spSettings() => _makeRoute(SpSettingsPage());

  static MaterialPageRoute notificationSettings() => _makeRoute(NotificationSettings());

  static MaterialPageRoute help() => _makeRoute(HelpPage());


  ///FACULTY

  static MaterialPageRoute publishInternalMarks({
    String title,
    String subject,
    String course,
    String section
  }) => _makeRoute(PublishInternalMarksPage(title: title,course: course,section: section,subject: subject,));

  static MaterialPageRoute pendingMarks() => _makeRoute(PendingMarksPage());

  static MaterialPageRoute classAttendanceSummary() => _makeRoute(ClassAttendanceSummaryPage());

  static MaterialPageRoute attendanceReport() => _makeRoute(AttendanceReportPage());


  ///

  static MaterialPageRoute notification() => _makeRoute(NotificationPage());

  static MaterialPageRoute tAndC() => _makeRoute(TAndCPage());

  static MaterialPageRoute privacyPolicy() => _makeRoute(PrivacyPolicyPage());


}