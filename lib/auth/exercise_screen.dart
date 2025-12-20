import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tieng_trung_123/commons/widgets/image.dart';
import 'package:tieng_trung_123/core/colors.dart';
import 'package:tieng_trung_123/models/word.dart';
import 'package:tieng_trung_123/services/providers/word_provider.dart';

import '../commons/widgets/rounded_image.dart';

class ExerciseScreen extends ConsumerStatefulWidget {
  static const String route = 'ExerciseScreen';

  const ExerciseScreen({super.key});

  @override
  ConsumerState<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends ConsumerState<ExerciseScreen> {
  late PageController _pageController;
  bool isShowAnswer = false;
  int currIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    final wordState = ref.watch(wordNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: roundedImage(size: 16, assetPath: 'assets/images/close_button.png'),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: roundedImage(size: 32, assetPath: 'assets/images/light_setting_button.png'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 32, 24, 48),
        child: Column(
          children: [
            Container(
              height: height / 1.6,
              width: width - 48,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.neutral_200),
              child: PageView.builder(
                controller: _pageController,
                itemCount: wordState.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildCard(screenWidth: width, screenHeight: height, word: wordState[index]);
                },
              ),
            ),
            Expanded(child: const SizedBox()),
            GestureDetector(
              onTap: () {
                setState(() {
                  currIndex += currIndex < wordState.length - 1 ? 1 : 0;
                  isShowAnswer = false;
                });
                _pageController.jumpToPage(currIndex);
              },
              child: Container(
                height: 48,
                width: width / 2.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: AppColors.primary_500, borderRadius: BorderRadius.circular(96)),
                child: Text(
                  currIndex == wordState.length - 1 ? 'Kết thúc' : 'Tiếp tục',
                  style: TextStyle(color: AppColors.neutral_0, fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required double screenWidth, required double screenHeight, required Word word}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isShowAnswer
            ? Column(
                children: [
                  Text(
                    word.phonetic,
                    style: TextStyle(color: AppColors.primary_500, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    word.word,
                    style: TextStyle(color: AppColors.neutral_500, fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    word.type,
                    style: TextStyle(color: AppColors.primary_500, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    word.meanning,
                    style: TextStyle(color: AppColors.primary_500, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            : Text(
                word.word,
                style: TextStyle(color: AppColors.neutral_500, fontSize: 32, fontWeight: FontWeight.w700),
              ),
        const SizedBox(height: 24),
        image(size: (screenWidth - 48) / 1.86, assetPath: 'assets/images/exercise.png'),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isShowAnswer = true;
                });
              },
              child: roundedImage(size: 56, assetPath: 'assets/images/headphone_button.png'),
            ),
            const SizedBox(width: 24),
            GestureDetector(
              onTap: () {},
              child: roundedImage(size: 56, assetPath: 'assets/images/turtle_button.png'),
            ),
          ],
        ),
      ],
    );
  }
}
