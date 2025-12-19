import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tieng_trung_123/auth/account_setting_screen.dart';
import 'package:tieng_trung_123/auth/splash_screen.dart';
import 'package:tieng_trung_123/auth/update_password_screen.dart';
import 'package:tieng_trung_123/commons/widgets/circle_button.dart';
import 'package:tieng_trung_123/commons/widgets/image.dart';
import 'package:tieng_trung_123/commons/widgets/rounded_image.dart';
import 'package:tieng_trung_123/core/colors.dart';

class SettingScreen extends StatelessWidget {
  static const String route = 'SettingScreen';

  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cài đặt',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.neutral_500),
        ),
        centerTitle: true,
        // leading: circleButton(
        //   backgroundSize: 32,
        //   backgroundPath: 'assets/images/circle_button.png',
        //   iconSize: 17,
        //   iconPath: 'assets/icons/arrow_back.png',
        //   onTap: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: roundedImage(size: 16, assetPath: 'assets/images/back_button.png'),
          ),
        ),
        backgroundColor: AppColors.neutral_0,
      ),
      backgroundColor: AppColors.neutral_0,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
        child: Column(
          children: [
            Column(
              children: [
                userField(
                  onTap: () {
                    Navigator.of(context).pushNamed(AccountSettingScreen.route);
                  },
                ),
                const SizedBox(height: 16),
                navigationComponent(
                  asset: 'assets/icons/key.png',
                  title: 'Thay đổi mật khẩu',
                  onTap: () {
                    Navigator.of(context).pushNamed(UpdatePasswordScreen.route);
                  },
                ),
                const SizedBox(height: 16),
                navigationComponent(asset: 'assets/icons/headphone.png', title: 'Support', onTap: () {}),
                const SizedBox(height: 16),
                navigationComponent(asset: 'assets/icons/language.png', title: 'Language', onTap: () {}),
              ],
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(SplashScreen.route, (Route<dynamic> route) => false);
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColors.neutral_100, borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        image(size: 24, assetPath: 'assets/icons/logout.png'),
                        const SizedBox(width: 12),
                        Text(
                          'Đăng xuất',
                          style: TextStyle(color: AppColors.red_500, fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userField({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: AppColors.supportBackground_1),
        child: Row(
          children: [
            roundedImage(size: 48, assetPath: 'assets/images/avatar.png'),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Long Anh',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.neutral_0),
                  ),
                  Text(
                    'Tham gia từ 5/2023',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.neutral_0),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            image(size: 20, assetPath: 'assets/icons/pen.png'),
          ],
        ),
      ),
    );
  }

  Widget navigationComponent({required String asset, required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.neutral_200, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                image(size: 24, assetPath: asset),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(color: AppColors.neutral_500, fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            image(size: 24, assetPath: 'assets/icons/light_navigator_next.png'),
          ],
        ),
      ),
    );
  }
}
