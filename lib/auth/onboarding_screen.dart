import 'package:flutter/material.dart';
import 'package:tieng_trung_123/core/colors.dart';
import 'package:tieng_trung_123/models/onboarding_question.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String route = 'OnboardingScreen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
  int currentQuestion = 1;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          ),
        ],
        title: Text('$currentQuestion/5'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
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
                            width: (screenSize.width - 40) / 5 * currentQuestion,
                            decoration: BoxDecoration(color: AppColors.secondary_500, borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Text(questions[currentQuestion - 1].question, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  ),
                  for (var index = 0; index < questions[currentQuestion - 1].answers.length; index++)
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAnswerIndex[currentQuestion - 1] = selectedAnswerIndex[currentQuestion - 1] == index ? -1 : index;
                            });
                          },
                          child: selectedAnswerIndex[currentQuestion - 1] != index
                              ? Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.neutral_200, width: 1),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(questions[currentQuestion - 1].answers[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
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
                                  child: Text(questions[currentQuestion - 1].answers[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                ),
                        ),
                        const SizedBox(height: 18),
                      ],
                    ),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  setState(() {
                    currentQuestion += currentQuestion < 5 ? 1 : 0;
                  });
                  print(currentQuestion == 5 ? 'start $selectedAnswerIndex' : 'continue');
                },
                child: Container(
                  height: 64,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: Colors.green),
                  child: Text(
                    currentQuestion == 5 ? 'Bắt đầu' : 'Tiếp tục',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
