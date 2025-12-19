import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tieng_trung_123/auth/login_screen.dart';
import 'package:tieng_trung_123/auth/splash_screen.dart';
import 'package:tieng_trung_123/core/colors.dart';
import 'package:dashed_divider/dashed_divider.dart';

import '../commons/widgets/clipper.dart';

class MailConfirmationScreen extends StatefulWidget {
  static const String route = 'MailConfirmationScreen';

  const MailConfirmationScreen({super.key});

  @override
  State<MailConfirmationScreen> createState() => _MailConfirmationScreenState();
}

class _MailConfirmationScreenState extends State<MailConfirmationScreen> {
  int time = 30;
  bool isButtonActive = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer timer) {
      if (time == 0) {
        setState(() {
          timer.cancel();
          isButtonActive = true;
        });
      } else {
        setState(() {
          time--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenHeight * 0.25,
            pinned: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(background: Image.asset("assets/images/img.png", fit: BoxFit.cover)),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: AppColors.neutral_400,
              style: IconButton.styleFrom(backgroundColor: AppColors.neutral_0),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: screenHeight * 0.75 - 60,
              padding: EdgeInsets.fromLTRB(16, 20, 16, 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vui lòng kiểm tra hộp thư của bạn.',
                        style: TextStyle(color: AppColors.neutral_500, fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 16),
                      DashedDivider(color: AppColors.neutral_200, thickness: 2),
                      const SizedBox(height: 16),
                      Text.rich(
                        TextSpan(
                          text: 'Chúng tôi vừa gửi 1 email xác minh đến: ',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.neutral_500),
                          children: [
                            TextSpan(
                              text: 'email',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.neutral_500),
                            ),
                            TextSpan(
                              text: '. Vui lòng nhấn vào liên kết trong email để hoàn tất đăng ký',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.neutral_500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Không thấy email?',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.neutral_500),
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Hãy kiểm tra thư mục Spam hoặc nhấn ',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.neutral_500),
                          children: [
                            TextSpan(
                              text: 'Gửi lại',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.primary_500),
                            ),
                            if (!isButtonActive)
                              TextSpan(
                                text: ' sau 0:$time s.',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.neutral_500),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      DashedDivider(color: AppColors.neutral_200, thickness: 2),
                    ],
                  ),
                  isButtonActive
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              time = 30;
                              isButtonActive = false;
                            });
                            startTimer();
                          },
                          child: Container(
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: AppColors.primary_500),
                            child: Text(
                              'Gửi lại email',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Container(
                              height: 48,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: AppColors.neutral_200),
                              child: Text(
                                'Gửi lại email',
                                style: TextStyle(color: AppColors.neutral_300, fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text.rich(
                              TextSpan(
                                text: 'Xác thực tài khoản thành công? ',
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.neutral_300),
                                children: [
                                  TextSpan(
                                    text: 'Đi đến Đăng nhập',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primary_500),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).pushNamedAndRemoveUntil(SplashScreen.route, (Route<dynamic> route) => false);
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
