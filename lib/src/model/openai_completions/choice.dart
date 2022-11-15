import 'dart:convert';

import 'package:equatable/equatable.dart';

/// The choice class.
class Choice extends Equatable {
  /// Instance of [Choice].
  const Choice({
    required this.text,
    required this.index,
    required this.logprobs,
    required this.finishReason,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Choice].
  factory Choice.fromJson(String data) {
    return Choice.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Mappping from [Map] to [Choice].
  factory Choice.fromMap(Map<String, dynamic> data) => Choice(
        text: data['text'] as String,
        index: data['index'] as int,
        logprobs: data['logprobs'] as dynamic,
        finishReason: data['finish_reason'] as String,
      );

  /// The choice text.
  final String text;

  /// The choice index.
  final int index;

  /// The choice logprobs.
  final dynamic logprobs;

  /// The choice finish reason.
  final String finishReason;

  /// Mappping from [Choice] to [Map].
  Map<String, dynamic> toMap() => {
        'text': text,
        'index': index,
        'logprobs': logprobs,
        'finish_reason': finishReason,
      };

  /// `dart:convert`
  ///
  /// Converts [Choice] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  Choice copyWith({
    String? text,
    int? index,
    dynamic logprobs,
    String? finishReason,
  }) {
    return Choice(
      text: text ?? this.text,
      index: index ?? this.index,
      logprobs: logprobs ?? this.logprobs,
      finishReason: finishReason ?? this.finishReason,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [text, index, logprobs, finishReason];
}
