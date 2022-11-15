import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:openai_client/src/model/openai_completions/choice.dart';
import 'package:openai_client/src/model/openai_completions/usage.dart';

/// The completion class.
class Completion extends Equatable {
  /// Instance of [Completion].
  const Completion({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Completion].
  factory Completion.fromJson(String data) {
    return Completion.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Mappping from [Map] to [Completion].
  factory Completion.fromMap(Map<String, dynamic> data) => Completion(
        id: data['id'] as String,
        object: data['object'] as String,
        created: data['created'] as int,
        model: data['model'] as String,
        choices: (data['choices'] as List<dynamic>)
            .map((e) => Choice.fromMap(e as Map<String, dynamic>))
            .toList(),
        usage: Usage.fromMap(data['usage'] as Map<String, dynamic>),
      );

  /// The completion id.
  final String id;

  /// The completion object.
  final String object;

  /// The completion created.
  final int created;

  /// The completion model.
  final String model;

  /// The completion choices.
  final List<Choice> choices;

  /// The completion usage.
  final Usage usage;

  /// Mappping from [Completion] to [Map].
  Map<String, dynamic> toMap() => {
        'id': id,
        'object': object,
        'created': created,
        'model': model,
        'choices': choices.map((e) => e.toMap()).toList(),
        'usage': usage.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [Completion] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  Completion copyWith({
    String? id,
    String? object,
    int? created,
    String? model,
    List<Choice>? choices,
    Usage? usage,
  }) {
    return Completion(
      id: id ?? this.id,
      object: object ?? this.object,
      created: created ?? this.created,
      model: model ?? this.model,
      choices: choices ?? this.choices,
      usage: usage ?? this.usage,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, object, created, model, choices, usage];
}
