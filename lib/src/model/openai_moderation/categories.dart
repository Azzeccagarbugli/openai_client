import 'dart:convert';

import 'package:equatable/equatable.dart';

/// The categories model.
class Categories extends Equatable {
  /// The instance of [Categories].
  const Categories({
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
  /// Parses the string and returns the resulting Json object as [Categories].
  factory Categories.fromJson(String data) {
    return Categories.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Creates a new [Categories] instance from the given [map].
  factory Categories.fromMap(Map<String, dynamic> data) => Categories(
        hate: data['hate'] as bool,
        hateThreatening: data['hate/threatening'] as bool,
        selfHarm: data['self-harm'] as bool,
        sexual: data['sexual'] as bool,
        sexualMinors: data['sexual/minors'] as bool,
        violence: data['violence'] as bool,
        violenceGraphic: data['violence/graphic'] as bool,
      );

  /// The hate category.
  final bool hate;

  /// The hate/threatening category.
  final bool hateThreatening;

  /// The self-harm category.
  final bool selfHarm;

  /// The sexual category.
  final bool sexual;

  /// The sexual/minors category.
  final bool sexualMinors;

  /// The violence category.
  final bool violence;

  /// The violence/graphic category.
  final bool violenceGraphic;

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
  /// Converts [Categories] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  Categories copyWith({
    bool? hate,
    bool? hateThreatening,
    bool? selfHarm,
    bool? sexual,
    bool? sexualMinors,
    bool? violence,
    bool? violenceGraphic,
  }) {
    return Categories(
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
