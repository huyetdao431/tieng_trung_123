class Example {
  final String sentence;
  final String phonetic;
  final String meaning;

  //<editor-fold desc="Data Methods">
  const Example({required this.sentence, required this.phonetic, required this.meaning});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Example && runtimeType == other.runtimeType && sentence == other.sentence && phonetic == other.phonetic && meaning == other.meaning);

  @override
  int get hashCode => sentence.hashCode ^ phonetic.hashCode ^ meaning.hashCode;

  @override
  String toString() {
    return 'Example{' + ' sentence: $sentence,' + ' phonetic: $phonetic,' + ' meaning: $meaning,' + '}';
  }

  Example copyWith({String? sentence, String? phonetic, String? meaning}) {
    return Example(sentence: sentence ?? this.sentence, phonetic: phonetic ?? this.phonetic, meaning: meaning ?? this.meaning);
  }

  Map<String, dynamic> toMap() {
    return {'sentence': this.sentence, 'phonetic': this.phonetic, 'meaning': this.meaning};
  }

  factory Example.fromMap(Map<String, dynamic> map) {
    return Example(sentence: map['sentence'] as String, phonetic: map['phonetic'] as String, meaning: map['meaning'] as String);
  }

  //</editor-fold>
}
