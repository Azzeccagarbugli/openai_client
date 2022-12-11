import 'dart:convert';

import 'package:equatable/equatable.dart';

/// The Usage class.
class Usage extends Equatable {
  /// The instance of [Usage] class.
  const Usage({
    required this.promptTokens,
    required this.totalTokens,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Usage].
  factory Usage.fromJson(String data) {
    return Usage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Creates a new [Usage] instance from the given [map].
  factory Usage.fromMap(Map<String, dynamic> data) => Usage(
        promptTokens: data['prompt_tokens'] as int,
        totalTokens: data['total_tokens'] as int,
      );

  /// The number of tokens in the prompt.
  final int promptTokens;

  /// The total number of tokens in the prompt and the response.
  final int totalTokens;

  /// Mappping the [Usage] to a [Map] instance.
  Map<String, dynamic> toMap() => {
        'prompt_tokens': promptTokens,
        'total_tokens': totalTokens,
      };

  /// `dart:convert`
  ///
  /// Converts [Usage] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  Usage copyWith({
    int? promptTokens,
    int? totalTokens,
  }) {
    return Usage(
      promptTokens: promptTokens ?? this.promptTokens,
      totalTokens: totalTokens ?? this.totalTokens,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [promptTokens, totalTokens];
}
