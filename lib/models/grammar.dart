import 'example.dart';

class Grammar {
  final String id;
  final String structure;
  final String syntax;
  final List<Example> examples;

  //<editor-fold desc="Data Methods">

  const Grammar({required this.id, required this.structure, required this.syntax, required this.examples});

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     (other is Grammar &&
  //         runtimeType == other.runtimeType &&
  //         id == other.id &&
  //         structure == other.structure &&
  //         syntax == other.syntax &&
  //         examples == other.examples);

  // @override
  // int get hashCode => id.hashCode ^ structure.hashCode ^ syntax.hashCode ^ examples.hashCode;

  @override
  String toString() {
    return 'Grammar{' + ' id: $id,' + ' structure: $structure,' + ' syntax: $syntax,' + ' examples: $examples,' + '}';
  }

  Grammar copyWith({String? id, String? structure, String? syntax, List<Example>? examples}) {
    return Grammar(id: id ?? this.id, structure: structure ?? this.structure, syntax: syntax ?? this.syntax, examples: examples ?? this.examples);
  }

  Map<String, dynamic> toMap() {
    return {'id': this.id, 'structure': this.structure, 'syntax': this.syntax, 'examples': this.examples};
  }

  factory Grammar.fromMap(Map<String, dynamic> map) {
    return Grammar(id: map['id'] as String, structure: map['structure'] as String, syntax: map['syntax'] as String, examples: map['examples'] as List<Example>);
  }

  //</editor-fold>
}
