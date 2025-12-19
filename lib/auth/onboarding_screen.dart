import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tieng_trung_123/auth/profile_screen.dart';
import 'package:tieng_trung_123/core/colors.dart';
import 'package:tieng_trung_123/models/onboarding_question.dart';
import 'package:tieng_trung_123/services/providers/auth_provider/auth_provider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  static const String route = 'OnboardingScreen';

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> with TickerProviderStateMixin {
  List<OnboardingQuestion> questions = [
    OnboardingQuestion(
      id: '1',
      question: 'Bạn có thể đọc và hiểu những chữ Hán cơ bản (ví dụ: 你好, 谢谢, 中国)?',
      answers: ['Không đọc được', 'Đọc được một vài chữ', 'Đọc được khá nhiều chữ'],
    ),
    OnboardingQuestion(id: '2', question: 'Khi nghe câu đơn giản như “你好吗？”, bạn có hiểu không?', answers: ['Không hiểu', 'Hiểu được một chút', 'Hiểu tốt']),
    OnboardingQuestion(
      id: '3',
      question: 'Bạn có thể tự giới thiệu bản thân bằng tiếng Trung không?',
      answers: ['Không hiểu', 'Có thể nói đơn giản(tên, tuổi, quốc tịch)', 'Có thể giới thiệu chi tiết (sở thích, công việc, gia đình)'],
    ),
    OnboardingQuestion(id: '4', question: 'Khi viết, bạn thường dùng:', answers: ['Chỉ Pinyin', 'Một số chữ Hán cơ bản', 'Nhiều chữ Hán']),
    OnboardingQuestion(
      id: '5',
      question: 'Bạn đã từng thi chứng chỉ HSK/HSKK chưa? Nếu có, đạt cấp độ nào? ',
      answers: ['Chưa thi', 'HSK 1', 'HSK 2', 'HSK 3', 'HSK 4', 'HSK 5 trở lên'],
    ),
  ];
  List<int> selectedAnswerIndex = [-1, -1, -1, -1, -1];
  late PageController _pageController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    bool isLoading = authState.isLoading;
    ref.listen(authNotifierProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${next.error}', style: TextStyle(color: AppColors.neutral_0)),
            backgroundColor: AppColors.red_500,
          ),
        );
      }
    });

    var screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                // await ref.read(authNotifierProvider.notifier).logout();
                Navigator.of(context).pushNamed(ProfileScreen.route);
              },
              color: AppColors.neutral_400,
              style: IconButton.styleFrom(backgroundColor: AppColors.neutral_200),
              icon: Icon(Icons.close),
            ),
          ),
        ],
        title: Text.rich(
          TextSpan(
            text: '${_currentPageIndex + 1}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.primary_500),
            children: [
              TextSpan(
                text: '/5',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.neutral_300),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          children: [
            SizedBox(
              height: 16,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(color: AppColors.secondary_100, borderRadius: BorderRadius.circular(16)),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: (screenSize.width - 40) / 5 * (_currentPageIndex + 1),
                      decoration: BoxDecoration(color: AppColors.secondary_500, borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: Text(questions[index].question, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                      ),
                      for (var idx = 0; idx < questions[index].answers.length; idx++)
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAnswerIndex[index] = selectedAnswerIndex[index] == idx ? -1 : idx;
                                });
                              },
                              child: selectedAnswerIndex[index] != idx
                                  ? Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.neutral_200, width: 1),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Text(questions[index].answers[idx], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                    )
                                  : Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                                      decoration: BoxDecoration(
                                        color: AppColors.secondary_100,
                                        border: Border.all(color: AppColors.secondary_500, width: 1),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Text(questions[index].answers[idx], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                    ),
                            ),
                            const SizedBox(height: 18),
                          ],
                        ),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _currentPageIndex = _currentPageIndex > 0 ? _currentPageIndex - 1 : 0;
                      });
                      _pageController.animateToPage(_currentPageIndex, duration: Duration(milliseconds: 200), curve: Curves.ease);
                    },
                    iconSize: 24,
                    color: AppColors.neutral_400,
                    style: IconButton.styleFrom(backgroundColor: AppColors.neutral_200),
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _currentPageIndex += _currentPageIndex < 4 ? 1 : 0;
                      });
                      if (_currentPageIndex < 4) {
                        _pageController.animateToPage(_currentPageIndex, duration: Duration(milliseconds: 200), curve: Curves.ease);
                      } else {
                        Navigator.of(context).pushNamed(ProfileScreen.route);
                      }
                      print(_currentPageIndex == 4 ? 'start $selectedAnswerIndex' : 'continue');
                    },

                    child: Container(
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: Colors.green),
                      child: Text(
                        _currentPageIndex == 4 ? 'Bắt đầu' : 'Tiếp tục',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
