import 'package:flutter/material.dart';
import 'package:tieng_trung_123/commons/widgets/image.dart';
import 'package:tieng_trung_123/core/colors.dart';
import 'package:tieng_trung_123/models/word.dart';

import '../commons/widgets/rounded_image.dart';

class ExerciseScreen extends StatefulWidget {
  static const String route = 'ExerciseScreen';

  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  late PageController _pageController;
  bool isShowAnswer = false;
  int currIndex = 0;

  List<Word> vocabularyWords = [
    Word(word: '你好', phonetic: 'nǐ hǎo', type: 'Thán từ', meanning: 'Xin chào'),
    Word(word: '谢谢', phonetic: 'xiè xie', type: 'Động từ', meanning: 'Cảm ơn'),
    Word(word: '朋友', phonetic: 'péng you', type: 'Danh từ', meanning: 'Bạn bè'),
    Word(word: '美丽', phonetic: 'měi lì', type: 'Tính từ', meanning: 'Xinh đẹp'),
    Word(word: '快乐', phonetic: 'kuài lè', type: 'Tính từ', meanning: 'Vui vẻ'),
    Word(word: '喜欢', phonetic: 'xǐ huan', type: 'Động từ', meanning: 'Thích / Yêu thích'),
    Word(word: '学习', phonetic: 'xué xí', type: 'Động từ', meanning: 'Học tập'),
    Word(word: '工作', phonetic: 'gōng zuò', type: 'Danh từ / Động từ', meanning: 'Công việc / Làm việc'),
    Word(word: '家庭', phonetic: 'jiā tíng', type: 'Danh từ', meanning: 'Gia đình'),
    Word(word: '世界', phonetic: 'shì jiè', type: 'Danh từ', meanning: 'Thế giới'),
  ];

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
              height: height / 1.66,
              width: width - 48,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.neutral_200),
              child: PageView.builder(
                controller: _pageController,
                itemCount: vocabularyWords.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildCard(screenWidth: width, screenHeight: height, word: vocabularyWords[index]);
                },
              ),
            ),
            Expanded(child: const SizedBox()),
            GestureDetector(
              onTap: () {
                setState(() {
                  currIndex += currIndex < vocabularyWords.length - 1 ? 1 : 0;
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
                  currIndex == vocabularyWords.length - 1 ? 'Kết thúc' : 'Tiếp tục',
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
