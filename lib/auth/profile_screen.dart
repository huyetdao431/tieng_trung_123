import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:tieng_trung_123/auth/setting_screen.dart';
import 'package:tieng_trung_123/commons/widgets/circle_button.dart';
import 'package:tieng_trung_123/commons/widgets/rounded_image.dart';
import 'package:tieng_trung_123/core/colors.dart';
import 'package:dashed_divider/dashed_divider.dart';

import '../commons/widgets/image.dart';

class ProfileScreen extends StatefulWidget {
  static const String route = 'ProfileScreen';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    var screenWidth = screenSize.width;
    return Scaffold(
      extendBody: true,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/background.png'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 62, 20, 0),
          child: Column(
            children: [
              _buildProfileField(
                screenWidth: screenWidth,
                onTap: () {
                  Navigator.of(context).pushNamed(SettingScreen.route);
                },
              ),
              const SizedBox(height: 24),
              _buildNavigationField(),
              const SizedBox(height: 24),
              _buildAchievementField(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildCardField({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.neutral_0,
        boxShadow: [
          BoxShadow(color: AppColors.shadow, offset: Offset(3, 5)),
          BoxShadow(color: AppColors.innerShadow, offset: Offset(0, -4), inset: true),
        ],
      ),
      child: child,
    );
  }

  Widget _buildProfileField({required double screenWidth, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: _buildCardField(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                roundedImage(size: 56, assetPath: 'assets/images/avatar.png'),
                Row(
                  children: [
                    circleButton(
                      backgroundSize: 32,
                      backgroundPath: 'assets/images/circle_button.png',
                      iconSize: 16,
                      iconPath: 'assets/icons/setting.png',
                      onTap: () {},
                    ),
                    const SizedBox(width: 16),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        circleButton(
                          backgroundSize: 32,
                          backgroundPath: 'assets/images/circle_button.png',
                          iconSize: 16,
                          iconPath: 'assets/icons/notification.png',
                          onTap: () {},
                        ),
                        Positioned(
                          top: -2,
                          right: -2,
                          child: Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.red_500),
                            clipBehavior: Clip.hardEdge,
                            alignment: Alignment.center,
                            child: Text(
                              '2',
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.neutral_0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Long Anh',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.neutral_500),
                    ),
                    Text(
                      'Tham gia từ 5/2023',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.neutral_500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                  width: screenWidth / 3.7 - 20,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 16,
                        top: 4,
                        bottom: 4,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 8, 0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(32), bottomRight: Radius.circular(32)),
                            color: Color(0xFFFF8B2D),
                          ),
                          child: Text(
                            'LV1-2',
                            style: TextStyle(color: AppColors.neutral_0, fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Positioned(left: 0, child: image(size: 32, assetPath: 'assets/icons/crown.png')),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationField() {
    return _buildCardField(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    image(size: 20, assetPath: 'assets/icons/star.png'),
                    const SizedBox(width: 8),
                    Text(
                      'Yêu thích',
                      style: TextStyle(color: AppColors.neutral_500, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Icon(Icons.navigate_next_rounded, size: 24),
              ],
            ),
          ),
          const SizedBox(height: 16),
          DashedDivider(color: AppColors.neutral_200, thickness: 2),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    image(size: 20, assetPath: 'assets/icons/cup.png'),
                    const SizedBox(width: 8),
                    Text(
                      'Mục tiêu học tập',
                      style: TextStyle(color: AppColors.neutral_500, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Icon(Icons.navigate_next_rounded, size: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementField() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildAchievementComponent(asset: 'assets/images/note.png', size: 40, title: '2 / 490', content: 'Thời gian học tập', onTap: () {}),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildAchievementComponent(asset: 'assets/images/streak.png', size: 40, title: '2 days', content: 'Chuỗi hiện tại', onTap: () {}),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildAchievementComponent(asset: 'assets/images/wooden.png', size: 40, title: '3 words', content: 'Tổng xp', onTap: () {}),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildAchievementComponent(asset: 'assets/images/pink_star.png', size: 40, title: '138 P', content: 'Huy hiệu hiện tại', onTap: () {}),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAchievementComponent({
    required String asset,
    required double size,
    required String title,
    required String content,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: _buildCardField(
        child: Column(
          children: [
            image(size: size, assetPath: asset),
            const SizedBox(height: 16),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.neutral_500),
                ),
                Text(
                  content,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.neutral_500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return SizedBox(
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.neutral_0,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildNavItem(index: 0, assetPath: 'assets/icons/home.png', assetPath2: 'assets/images/home.png'),
                _buildNavItem(index: 1, assetPath: 'assets/icons/hat.png', assetPath2: 'assets/images/cap.png'),
                _buildNavItem(index: 2, assetPath: 'assets/icons/cup_2.png', assetPath2: 'assets/images/champion.png'),
                _buildNavItem(index: 3, assetPath: 'assets/icons/profile.png', assetPath2: 'assets/images/avatar.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({required int index, required String assetPath, required String assetPath2}) {
    bool isSelected = selectedIndex == index;
    if (isSelected) {
      return Transform.translate(
        offset: const Offset(0, -16),
        child: Container(
          width: 80,
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: AppColors.neutral_0, shape: BoxShape.circle),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              roundedImage(size: 40, assetPath: assetPath2),
              Container(
                width: 10,
                height: 4,
                decoration: BoxDecoration(color: AppColors.orange, borderRadius: BorderRadius.circular(12)),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: image(size: 32, assetPath: assetPath),
      ),
    );
  }
}
