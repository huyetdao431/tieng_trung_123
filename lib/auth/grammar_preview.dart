import 'package:flutter/material.dart';
import 'package:tieng_trung_123/core/colors.dart';

import '../commons/widgets/rounded_image.dart';
import '../models/example.dart';
import '../models/grammar.dart';

class GrammarPreview extends StatelessWidget {
  static const String route = 'GrammarPreview';
  final Grammar grammar;
  const GrammarPreview({super.key, required this.grammar});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = kToolbarHeight;
    double totalTopHeight = statusBarHeight + appBarHeight;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: roundedImage(size: 16, assetPath: 'assets/images/back_button.png'),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFFE3FBF0),
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/cloud.png'), alignment: Alignment.topCenter, fit: BoxFit.fitWidth),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, totalTopHeight + 3, 20, 0),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.neutral_0, borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Cấu trúc: ${grammar.structure}',
                  style: TextStyle(color: AppColors.neutral_500, fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '- Cú pháp:',
                      style: TextStyle(color: AppColors.neutral_500, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '   ${grammar.syntax}',
                      style: TextStyle(color: AppColors.neutral_500, fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Divider(color: AppColors.neutral_200, thickness: 2),
                const SizedBox(height: 8),
                Text(
                  'Ví dụ:',
                  style: TextStyle(color: AppColors.neutral_500, fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                for (int i = 0; i < grammar.examples.length; i++) _buildExample(index: i + 1, example: grammar.examples[i]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExample({required int index, required Example example}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$index - ${example.sentence}.',
          style: TextStyle(color: AppColors.neutral_500, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(
          example.phonetic,
          style: TextStyle(color: AppColors.neutral_300, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 4),
        Text(
          example.meaning,
          style: TextStyle(color: AppColors.neutral_500, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
