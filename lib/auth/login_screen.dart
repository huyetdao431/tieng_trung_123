import 'package:flutter/material.dart';
import 'package:tieng_trung_123/auth/login_form.dart';
import 'package:tieng_trung_123/auth/register_form.dart';
import 'package:tieng_trung_123/commons/widgets/clipper.dart';

import '../core/colors.dart';

class LoginScreen extends StatefulWidget {
  static const String route = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(top: 0, left: 0, right: 0, child: Image.asset("assets/images/img.png")),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: CustomShape(),
              child: RegisterForm(height: screenSize.height),
            ),
          ),
        ],
      ),
    );
  }
}
