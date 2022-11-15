import 'dart:convert';

import 'package:equatable/equatable.dart';

/// The usage class.
class Usage extends Equatable {
  /// Instance of [Usage].
  const Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  /// Mappping from [Map] to [Usage].
  factory Usage.fromMap(Map<String, dynamic> data) => Usage(
        promptTokens: data['prompt_tokens'] as int,
        completionTokens: data['completion_tokens'] as int,
        totalTokens: data['total_tokens'] as int,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Usage].
  factory Usage.fromJson(String data) {
    return Usage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// The usage prompt tokens.
  final int promptTokens;

  /// The usage completion tokens.
  final int completionTokens;

  /// The usage total tokens.
  final int totalTokens;

  /// Mappping from [Usage] to [Map].
  Map<String, dynamic> toMap() => {
        'prompt_tokens': promptTokens,
        'completion_tokens': completionTokens,
        'total_tokens': totalTokens,
      };

  /// `dart:convert`
  ///
  /// Converts [Usage] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  Usage copyWith({
    int? promptTokens,
    int? completionTokens,
    int? totalTokens,
  }) {
    return Usage(
      promptTokens: promptTokens ?? this.promptTokens,
      completionTokens: completionTokens ?? this.completionTokens,
      totalTokens: totalTokens ?? this.totalTokens,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      promptTokens,
      completionTokens,
      totalTokens,
    ];
  }
}
