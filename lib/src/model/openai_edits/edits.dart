import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:openai_client/src/model/shared_models/shared_models.dart';

/// The edits class.
class Edits extends Equatable {
  /// The instance of the [Edits] class.
  const Edits({
    required this.object,
    required this.created,
    required this.choices,
    required this.usage,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Edit].
  factory Edits.fromJson(String data) {
    return Edits.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Creates a new [Edits] instance from the given [map].
  factory Edits.fromMap(Map<String, dynamic> data) => Edits(
        object: data['object'] as String,
        created: data['created'] as int,
        choices: (data['choices'] as List<dynamic>)
            .map((e) => Choice.fromMap(e as Map<String, dynamic>))
            .toList(),
        usage: Usage.fromMap(data['usage'] as Map<String, dynamic>),
      );

  /// The object type.
  final String object;

  /// The time the edit was created.
  final int created;

  /// The choices of the edit.
  final List<Choice> choices;

  /// The usage of the edit.
  final Usage usage;

  /// Mapping to JSON.
  Map<String, dynamic> toMap() => {
        'object': object,
        'created': created,
        'choices': choices.map((e) => e.toMap()).toList(),
        'usage': usage.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [Edit] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  Edits copyWith({
    String? object,
    int? created,
    List<Choice>? choices,
    Usage? usage,
  }) {
    return Edits(
      object: object ?? this.object,
      created: created ?? this.created,
      choices: choices ?? this.choices,
      usage: usage ?? this.usage,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [object, created, choices, usage];
}
