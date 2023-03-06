import 'dart:convert';

import 'package:equatable/equatable.dart';

/// The message class.
class ChatMessage extends Equatable {
  /// Instance of [Message].
  const ChatMessage({
    required this.role,
    required this.content,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Message].
  factory ChatMessage.fromJson(String data) {
    return ChatMessage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Message].
  factory ChatMessage.fromMap(Map<String, dynamic> data) => ChatMessage(
        role: data['role'] as String,
        content: data['content'] as String,
      );

  /// The message role.
  final String role;

  /// The message content.
  final String content;

  /// Mappping from [Map] to [Message].
  Map<String, dynamic> toMap() => {
        'role': role,
        'content': content,
      };

  /// `dart:convert`
  ///
  /// Converts [Message] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  ChatMessage copyWith({
    String? role,
    String? content,
  }) {
    return ChatMessage(
      role: role ?? this.role,
      content: content ?? this.content,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [role, content];
}
