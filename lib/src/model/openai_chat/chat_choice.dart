import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:openai_client/src/model/openai_chat/chat_message.dart';

/// The chat choice class.
class ChatChoice extends Equatable {
  /// Instance of [ChatChoice].
  const ChatChoice({
    required this.index,
    required this.message,
    required this.finishReason,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Choice].
  factory ChatChoice.fromJson(String data) {
    return ChatChoice.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChatChoice].
  factory ChatChoice.fromMap(Map<String, dynamic> data) => ChatChoice(
        index: data['index'] as int,
        message: ChatMessage.fromMap(data['message'] as Map<String, dynamic>),
        finishReason: data['finish_reason'] as String,
      );

  /// The index of the choice.
  final int index;

  /// The message.
  final ChatMessage message;

  /// The finish reason.
  final String finishReason;

  /// Mappping from [Map] to [ChatChoice].
  Map<String, dynamic> toMap() => {
        'index': index,
        'message': message.toMap(),
        'finish_reason': finishReason,
      };

  /// `dart:convert`
  ///
  /// Converts [Choice] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  ChatChoice copyWith({
    int? index,
    ChatMessage? message,
    String? finishReason,
  }) {
    return ChatChoice(
      index: index ?? this.index,
      message: message ?? this.message,
      finishReason: finishReason ?? this.finishReason,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [index, message, finishReason];
}
