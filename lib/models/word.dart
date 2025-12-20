class Word {
  final String word;
  final String phonetic;
  final String type;
  final String meanning;

  //<editor-fold desc="Data Methods">
  const Word({required this.word, required this.phonetic, required this.type, required this.meanning});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          runtimeType == other.runtimeType &&
          word == other.word &&
          phonetic == other.phonetic &&
          type == other.type &&
          meanning == other.meanning);

  @override
  int get hashCode => word.hashCode ^ phonetic.hashCode ^ type.hashCode ^ meanning.hashCode;

  @override
  String toString() {
    return 'Word{' + ' word: $word,' + ' phonetic: $phonetic,' + ' type: $type,' + ' meanning: $meanning,' + '}';
  }

  Word copyWith({String? word, String? phonetic, String? type, String? meanning}) {
    return Word(word: word ?? this.word, phonetic: phonetic ?? this.phonetic, type: type ?? this.type, meanning: meanning ?? this.meanning);
  }

  Map<String, dynamic> toMap() {
    return {'word': this.word, 'phonetic': this.phonetic, 'type': this.type, 'meanning': this.meanning};
  }

  factory Word.fromMap(Map<String, dynamic> map) {
    return Word(word: map['word'] as String, phonetic: map['phonetic'] as String, type: map['type'] as String, meanning: map['meanning'] as String);
  }

  //</editor-fold>
}
