import 'dart:convert';

import 'package:equatable/equatable.dart';

/// The category scores model.
class CategoryScores extends Equatable {
  /// The instance of [CategoryScores].
  const CategoryScores({
    required this.hate,
    required this.hateThreatening,
    required this.selfHarm,
    required this.sexual,
    required this.sexualMinors,
    required this.violence,
    required this.violenceGraphic,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CategoryScores].
  factory CategoryScores.fromJson(String data) {
    return CategoryScores.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Creates a new [CategoryScores] instance from the given [map].
  factory CategoryScores.fromMap(Map<String, dynamic> data) {
    return CategoryScores(
      hate: (data['hate'] as num).toDouble(),
      hateThreatening: (data['hate/threatening'] as num).toDouble(),
      selfHarm: (data['self-harm'] as num).toDouble(),
      sexual: (data['sexual'] as num).toDouble(),
      sexualMinors: (data['sexual/minors'] as num).toDouble(),
      violence: (data['violence'] as num).toDouble(),
      violenceGraphic: (data['violence/graphic'] as num).toDouble(),
    );
  }

  /// The hate category.
  final double hate;

  /// The hate/threatening category.
  final double hateThreatening;

  /// The self-harm category.
  final double selfHarm;

  /// The sexual category.
  final double sexual;

  /// The sexual/minors category.
  final double sexualMinors;

  /// The violence category.
  final double violence;

  /// The violence/graphic category.
  final double violenceGraphic;

  /// Mapping to JSON.
  Map<String, dynamic> toMap() => {
        'hate': hate,
        'hate/threatening': hateThreatening,
        'self-harm': selfHarm,
        'sexual': sexual,
        'sexual/minors': sexualMinors,
        'violence': violence,
        'violence/graphic': violenceGraphic,
      };

  /// `dart:convert`
  ///
  /// Converts [CategoryScores] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  CategoryScores copyWith({
    double? hate,
    double? hateThreatening,
    double? selfHarm,
    double? sexual,
    double? sexualMinors,
    double? violence,
    double? violenceGraphic,
  }) {
    return CategoryScores(
      hate: hate ?? this.hate,
      hateThreatening: hateThreatening ?? this.hateThreatening,
      selfHarm: selfHarm ?? this.selfHarm,
      sexual: sexual ?? this.sexual,
      sexualMinors: sexualMinors ?? this.sexualMinors,
      violence: violence ?? this.violence,
      violenceGraphic: violenceGraphic ?? this.violenceGraphic,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      hate,
      hateThreatening,
      selfHarm,
      sexual,
      sexualMinors,
      violence,
      violenceGraphic,
    ];
  }
}
