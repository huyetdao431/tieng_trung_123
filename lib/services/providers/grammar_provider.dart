import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tieng_trung_123/models/grammar.dart';

import '../../models/example.dart';

class GrammarNotifier extends AutoDisposeNotifier<List<Grammar>> {
  @override
  List<Grammar> build() {
    return const [
      Grammar(
        id: 'G01',
        structure: 'Câu trần thuật cơ bản (SVO)',
        syntax: 'Chủ ngữ + Động từ + Tân ngữ',
        examples: [
          Example(sentence: '我爱你', phonetic: 'wǒ ài nǐ', meaning: 'Anh yêu em / Tôi yêu bạn'),
          Example(sentence: '他吃苹果', phonetic: 'tā chī píng guǒ', meaning: 'Anh ấy ăn táo'),
        ],
      ),
      Grammar(
        id: 'G02',
        structure: 'Câu hỏi Có/Không với “吗 (ma)”',
        syntax: 'Câu trần thuật + 吗?',
        examples: [
          Example(sentence: '你是中国人吗？', phonetic: 'nǐ shì zhōng guó rén ma?', meaning: 'Bạn là người Trung Quốc phải không?'),
          Example(sentence: '你忙吗？', phonetic: 'nǐ máng ma?', meaning: 'Bạn có bận không?'),
        ],
      ),
      Grammar(
        id: 'G03',
        structure: 'Câu phủ định với “不 (bù)”',
        syntax: 'Chủ ngữ + 不 + Động từ/Tính từ',
        examples: [
          Example(sentence: '我不去', phonetic: 'wǒ bú qù', meaning: 'Tôi không đi'),
          Example(sentence: '今天不热', phonetic: 'jīn tiān bú rè', meaning: 'Hôm nay không nóng'),
        ],
      ),
      Grammar(
        id: 'G04',
        structure: 'Sở hữu cách với “的 (de)”',
        syntax: 'Người sở hữu + 的 + Vật bị sở hữu',
        examples: [
          Example(sentence: '我的书', phonetic: 'wǒ de shū', meaning: 'Sách của tôi'),
          Example(sentence: '爸爸的车', phonetic: 'bà ba de chē', meaning: 'Xe của bố'),
        ],
      ),
      Grammar(
        id: 'G05',
        structure: 'Cấu trúc nhấn mạnh “是…的 (shì…de)”',
        syntax: 'Chủ ngữ + 是 + [Thời gian/Địa điểm/Cách thức] + 的',
        examples: [
          Example(sentence: '我是昨天来的', phonetic: 'wǒ shì zuó tiān lái de', meaning: 'Tôi đến vào ngày hôm qua (nhấn mạnh thời gian)'),
          Example(sentence: '我们是坐飞机去的', phonetic: 'wǒ men shì zuò fēi jī qù de', meaning: 'Chúng tôi đi bằng máy bay (nhấn mạnh phương tiện)'),
        ],
      ),
      Grammar(
        id: 'G06',
        structure: 'Chỉ sự tồn tại/vị trí với “在 (zài)”',
        syntax: 'Chủ ngữ + 在 + Địa điểm',
        examples: [
          Example(sentence: '我在家', phonetic: 'wǒ zài jiā', meaning: 'Tôi đang ở nhà'),
          Example(sentence: '书在桌子上', phonetic: 'shū zài zhuō zi shang', meaning: 'Sách ở trên bàn'),
        ],
      ),
      Grammar(
        id: 'G07',
        structure: 'So sánh hơn với “比 (bǐ)”',
        syntax: 'A + 比 + B + Tính từ',
        examples: [
          Example(sentence: '他比我高', phonetic: 'tā bǐ wǒ gāo', meaning: 'Anh ấy cao hơn tôi'),
          Example(sentence: '今天比昨天冷', phonetic: 'jīn tiān bǐ zuó tiān lěng', meaning: 'Hôm nay lạnh hơn hôm qua'),
        ],
      ),
      Grammar(
        id: 'G08',
        structure: 'Hành động đã hoàn thành với “了 (le)”',
        syntax: 'Chủ ngữ + Động từ + 了 + (Tân ngữ)',
        examples: [
          Example(sentence: '我买了一件衣服', phonetic: 'wǒ mǎi le yí jiàn yī fu', meaning: 'Tôi đã mua một bộ quần áo'),
          Example(sentence: '他走了', phonetic: 'tā zǒu le', meaning: 'Anh ấy đi rồi'),
        ],
      ),
      Grammar(
        id: 'G09',
        structure: 'Diễn tả kỹ năng/khả năng với “会 (huì)”',
        syntax: 'Chủ ngữ + 会 + Động từ',
        examples: [
          Example(sentence: '我会说中文', phonetic: 'wǒ huì shuō zhōng wén', meaning: 'Tôi biết nói tiếng Trung'),
          Example(sentence: '你会做饭吗？', phonetic: 'nǐ huì zuò fàn ma?', meaning: 'Bạn có biết nấu ăn không?'),
        ],
      ),
      Grammar(
        id: 'G10',
        structure: 'Biểu thị mức độ cao với “太...了 (tài...le)”',
        syntax: '太 + Tính từ + 了',
        examples: [
          Example(sentence: '太好了', phonetic: 'tài hǎo le', meaning: 'Tốt quá / Tuyệt quá'),
          Example(sentence: '虽然太贵了', phonetic: 'suī rán tài guì le', meaning: 'Mặc dù đắt quá'),
        ],
      ),
    ];
  }

  void removeGrammar(Grammar grammar) {
    if (state.contains(grammar)) {
      state = state.where((element) => element != grammar).toList();
    }
  }
}

final grammarNotifierProvider = AutoDisposeNotifierProvider<GrammarNotifier, List<Grammar>>(() {
  return GrammarNotifier();
});
