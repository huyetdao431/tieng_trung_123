import 'package:flutter/material.dart';
import 'package:tieng_trung_123/auth/onboarding_screen.dart';

import 'auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: OnboardingScreen(),
      // home: Scaffold(body: LoginScreen()),
    );
  }
}
