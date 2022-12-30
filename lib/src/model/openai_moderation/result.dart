import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:openai_client/src/model/openai_moderation/categories.dart';
import 'package:openai_client/src/model/openai_moderation/category_scores.dart';

/// The result of the moderation.
class Result extends Equatable {
  /// The instance of [Result].
  const Result({
    this.categories,
    this.categoryScores,
    this.flagged,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Result].
  factory Result.fromJson(String data) {
    return Result.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Creates a new [Result] instance from the given [map].
  factory Result.fromMap(Map<String, dynamic> data) => Result(
        categories: data['categories'] == null
            ? null
            : Categories.fromMap(data['categories'] as Map<String, dynamic>),
        categoryScores: data['category_scores'] == null
            ? null
            : CategoryScores.fromMap(
                data['category_scores'] as Map<String, dynamic>),
        flagged: data['flagged'] as bool?,
      );

  /// The available categories.
  final Categories? categories;

  /// The scores for each category.
  final CategoryScores? categoryScores;

  /// Whether the text is flagged.
  final bool? flagged;

  /// Mapping to JSON.
  Map<String, dynamic> toMap() => {
        'categories': categories?.toMap(),
        'category_scores': categoryScores?.toMap(),
        'flagged': flagged,
      };

  /// `dart:convert`
  ///
  /// Converts [Result] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  Result copyWith({
    Categories? categories,
    CategoryScores? categoryScores,
    bool? flagged,
  }) {
    return Result(
      categories: categories ?? this.categories,
      categoryScores: categoryScores ?? this.categoryScores,
      flagged: flagged ?? this.flagged,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [categories, categoryScores, flagged];
}
