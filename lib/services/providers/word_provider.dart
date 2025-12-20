import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tieng_trung_123/models/word.dart';

class WordProvider extends AutoDisposeNotifier<List<Word>> {
  @override
  List<Word> build() {
    return const [
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
  }

  void removeWord(Word word) {
    if (state.contains(word)) {
      state = state.where((element) => element != word).toList();
    }
  }
}

final wordNotifierProvider = AutoDisposeNotifierProvider<WordProvider, List<Word>>(() {
  return WordProvider();
});
