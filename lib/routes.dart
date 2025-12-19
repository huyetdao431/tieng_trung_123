import 'package:flutter/material.dart';
import 'package:tieng_trung_123/auth/account_setting_screen.dart';
import 'package:tieng_trung_123/auth/forget_password_screen.dart';
import 'package:tieng_trung_123/auth/login_screen.dart';
import 'package:tieng_trung_123/auth/mail_confirmation_screen.dart';
import 'package:tieng_trung_123/auth/profile_screen.dart';
import 'package:tieng_trung_123/auth/register_screen.dart';
import 'package:tieng_trung_123/auth/setting_screen.dart';
import 'package:tieng_trung_123/auth/splash_screen.dart';
import 'package:tieng_trung_123/auth/update_password_screen.dart';

import 'auth/onboarding_screen.dart';

Route<dynamic>? mainRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.route:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case LoginScreen.route:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case RegisterScreen.route:
      return MaterialPageRoute(builder: (context) => RegisterScreen());
    case OnboardingScreen.route:
      return MaterialPageRoute(builder: (context) => OnboardingScreen());
    case MailConfirmationScreen.route:
      return MaterialPageRoute(builder: (context) => MailConfirmationScreen());
    case ForgetPasswordScreen.route:
      return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());
    case ProfileScreen.route:
      return MaterialPageRoute(builder: (context) => ProfileScreen());
    case SettingScreen.route:
      return MaterialPageRoute(builder: (context) => SettingScreen());
    case AccountSettingScreen.route:
      return MaterialPageRoute(builder: (context) => AccountSettingScreen());
    case UpdatePasswordScreen.route:
      return MaterialPageRoute(builder: (context) => UpdatePasswordScreen());
    default:
      return MaterialPageRoute(builder: (context) => LoginScreen());
  }
}
