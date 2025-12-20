import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tieng_trung_123/auth/exercise_screen.dart';
import 'package:tieng_trung_123/auth/grammar_preview.dart';
import 'package:tieng_trung_123/commons/widgets/image.dart';
import 'package:tieng_trung_123/services/providers/grammar_provider.dart';
import 'package:tieng_trung_123/services/providers/word_provider.dart';

import '../commons/widgets/rounded_image.dart';
import '../core/colors.dart';
import '../models/example.dart';
import '../models/grammar.dart';
import '../models/word.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  static const String route = 'FavoriteScreen';

  const FavoriteScreen({super.key});

  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  late PageController _pageController;
  int currPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = kToolbarHeight;
    double totalTopHeight = statusBarHeight + appBarHeight;

    final grammarState = ref.watch(grammarNotifierProvider);
    final wordState = ref.watch(wordNotifierProvider);

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
          padding: EdgeInsets.only(top: totalTopHeight + 3),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  currPageIndex = 0;
                                });
                                _pageController.jumpToPage(currPageIndex);
                              },
                              child: Container(
                                height: 48,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: currPageIndex == 0 ? AppColors.primary_500 : AppColors.neutral_0,
                                  borderRadius: BorderRadius.circular(96),
                                  boxShadow: [
                                    BoxShadow(color: AppColors.shadow, offset: Offset(3, 5)),
                                    BoxShadow(color: Colors.black.withAlpha(13), offset: Offset(0, -4), inset: true),
                                  ],
                                ),
                                child: Text(
                                  'Từ vựng',
                                  style: TextStyle(
                                    color: currPageIndex == 0 ? AppColors.neutral_0 : AppColors.neutral_500,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  currPageIndex = 1;
                                });
                                _pageController.jumpToPage(currPageIndex);
                              },
                              child: Container(
                                height: 48,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: currPageIndex == 1 ? AppColors.primary_500 : AppColors.neutral_0,
                                  borderRadius: BorderRadius.circular(96),
                                  boxShadow: [
                                    BoxShadow(color: AppColors.shadow, offset: Offset(3, 5)),
                                    BoxShadow(color: Colors.black.withAlpha(13), offset: Offset(0, -4), inset: true),
                                  ],
                                ),
                                child: Text(
                                  'Ngữ pháp',
                                  style: TextStyle(
                                    color: currPageIndex == 1 ? AppColors.neutral_0 : AppColors.neutral_500,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return _buildFavoriteVocabulary(words: wordState, ref: ref);
                            } else {
                              return _buildFavoriteGrammar(grammars: grammarState, ref: ref);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (currPageIndex == 0)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 144,
                  child: IgnorePointer(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.4, 1.0],
                          colors: [AppColors.neutral_0.withAlpha(0), AppColors.neutral_0.withAlpha(103), AppColors.neutral_0],
                        ),
                      ),
                    ),
                  ),
                ),
              if (currPageIndex == 0)
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(ExerciseScreen.route);
                            },
                            child: Container(
                              height: 48,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.primary_500,
                                borderRadius: BorderRadius.circular(96),
                                boxShadow: [BoxShadow(color: Colors.black.withAlpha(13), offset: Offset(-1, -4), inset: true)],
                              ),
                              child: Text(
                                'Luyện tập',
                                style: TextStyle(color: AppColors.neutral_0, fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 48,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.primary_500,
                                borderRadius: BorderRadius.circular(96),
                                boxShadow: [BoxShadow(color: Colors.black.withAlpha(13), offset: Offset(-1, -4), inset: true)],
                              ),
                              child: Text(
                                'Kiểm tra',
                                style: TextStyle(color: AppColors.neutral_0, fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteVocabulary({required List<Word> words, required WidgetRef ref}) {
    return words.isNotEmpty
        ? ListView.builder(
            padding: EdgeInsets.only(bottom: 120),
            itemCount: words.length,
            itemBuilder: (BuildContext context, index) {
              return Column(
                children: [
                  _buildWordCard(
                    word: words[index],
                    onTap: () {
                      ref.read(wordNotifierProvider.notifier).removeWord(words[index]);
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              );
            },
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image(size: 128, assetPath: 'assets/images/word.png'),
              const SizedBox(height: 24),
              Text(
                'Bạn chưa có từ vựng yêu thích nào',
                style: TextStyle(color: AppColors.neutral_500, fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          );
  }

  Widget _buildFavoriteGrammar({required List<Grammar> grammars, required WidgetRef ref}) {
    return grammars.isNotEmpty
        ? ListView.builder(
            padding: EdgeInsets.only(bottom: 40),
            itemCount: grammars.length,
            itemBuilder: (BuildContext context, index) {
              return Column(
                children: [
                  _buildGrammarCard(
                    grammar: grammars[index],
                    onTap: () {
                      ref.read(grammarNotifierProvider.notifier).removeGrammar(grammars[index]);
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              );
            },
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image(size: 128, assetPath: 'assets/images/word.png'),
              const SizedBox(height: 24),
              Text(
                'Bạn chưa có ngữ pháp yêu thích nào',
                style: TextStyle(color: AppColors.neutral_500, fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          );
  }

  Widget _buildWordCard({required Word word, required VoidCallback onTap}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: AppColors.neutral_0, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: '${word.word} ',
                  style: TextStyle(color: AppColors.neutral_500, fontSize: 18, fontWeight: FontWeight.w800),
                  children: [
                    TextSpan(
                      text: word.phonetic,
                      style: TextStyle(color: AppColors.neutral_300, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  image(size: 20, assetPath: 'assets/icons/light_headphone.png'),
                  const SizedBox(width: 16),
                  image(size: 20, assetPath: 'assets/icons/turtle.png'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            word.type,
            style: TextStyle(color: AppColors.neutral_300, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                word.meanning,
                style: TextStyle(color: AppColors.neutral_500, fontSize: 14, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: onTap,
                child: image(size: 20, assetPath: 'assets/icons/favorite.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGrammarCard({required Grammar grammar, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(GrammarPreview.route, arguments: {'grammar': grammar});
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(color: AppColors.neutral_0, borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              grammar.structure,
              style: TextStyle(color: AppColors.neutral_500, fontSize: 14, fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 13),
                child: image(size: 20, assetPath: 'assets/icons/favorite.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
