import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:openai_client/src/model/openai_moderation/result.dart';

/// The moderation model.
class Moderations extends Equatable {
  /// The instance of [Moderation].
  const Moderations({
    required this.id,
    required this.model,
    required this.results,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Moderation].
  factory Moderations.fromJson(String data) {
    return Moderations.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Creates a new [Moderation] instance from the given [map].
  factory Moderations.fromMap(Map<String, dynamic> data) => Moderations(
        id: data['id'] as String,
        model: data['model'] as String,
        results: (data['results'] as List<dynamic>)
            .map((e) => Result.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  /// The id.
  final String id;

  /// The model.
  final String model;

  /// The results.
  final List<Result> results;

  /// Mapping to JSON.
  Map<String, dynamic> toMap() => {
        'id': id,
        'model': model,
        'results': results.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Converts [Moderation] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  Moderations copyWith({
    String? id,
    String? model,
    List<Result>? results,
  }) {
    return Moderations(
      id: id ?? this.id,
      model: model ?? this.model,
      results: results ?? this.results,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, model, results];
}

/// The enum class for the two content moderations models
/// available: `text-moderation-stable` and `text-moderation-latest`.
enum ModerationsModel {
  /// The image format is `url`.
  stable(label: 'text-moderation-stable'),

  /// The image format is `b64_json`.
  latest(label: 'text-moderation-latest');

  /// The instance of the [ModerationModel] class.
  const ModerationsModel({
    required this.label,
  });

  /// The string representation of the enum.
  final String label;
}
