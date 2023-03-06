import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:openai_client/src/model/openai_chat/chat_choice.dart';
import 'package:openai_client/src/model/shared_models/shared_models.dart';

/// The chat class.
class Chat extends Equatable {
  /// Instance of [Chat].
  const Chat({
    required this.id,
    required this.object,
    required this.created,
    required this.choices,
    required this.usage,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OpenAiChat].
  factory Chat.fromJson(String data) {
    return Chat.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Chat].
  factory Chat.fromMap(Map<String, dynamic> data) => Chat(
        id: data['id'] as String,
        object: data['object'] as String,
        created: data['created'] as int,
        choices: (data['choices'] as List<dynamic>)
            .map((e) => ChatChoice.fromMap(e as Map<String, dynamic>))
            .toList(),
        usage: Usage.fromMap(data['usage'] as Map<String, dynamic>),
      );

  /// The chat id.
  final String id;

  /// The chat object.
  final String object;

  /// The chat created.
  final int created;

  /// The chat choices.
  final List<ChatChoice> choices;

  /// The chat usage.
  final Usage usage;

  /// Mappping from [Map] to [Chat].
  Map<String, dynamic> toMap() => {
        'id': id,
        'object': object,
        'created': created,
        'choices': choices.map((e) => e.toMap()).toList(),
        'usage': usage.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [OpenAiChat] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  Chat copyWith({
    String? id,
    String? object,
    int? created,
    List<ChatChoice>? choices,
    Usage? usage,
  }) {
    return Chat(
      id: id ?? this.id,
      object: object ?? this.object,
      created: created ?? this.created,
      choices: choices ?? this.choices,
      usage: usage ?? this.usage,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, object, created, choices, usage];
}
