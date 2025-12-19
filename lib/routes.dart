import 'package:flutter/material.dart';
import 'package:tieng_trung_123/auth/forget_password_screen.dart';
import 'package:tieng_trung_123/auth/login_screen.dart';
import 'package:tieng_trung_123/auth/mail_confirmation_screen.dart';
import 'package:tieng_trung_123/auth/register_screen.dart';
import 'package:tieng_trung_123/auth/splash_screen.dart';

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
    default:
      return MaterialPageRoute(builder: (context) => LoginScreen());
  }
}
