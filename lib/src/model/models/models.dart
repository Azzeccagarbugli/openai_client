import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:openai_client/openai_client.dart';

/// The models class.
class Models extends Equatable {
  /// The instance of the [Models] class.
  const Models({
    required this.data,
    required this.object,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Models].
  factory Models.fromJson(String data) {
    return Models.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Creates a new [Models] instance from the given [map].
  factory Models.fromMap(Map<String, dynamic> data) => Models(
        data: (data['data'] as List<dynamic>)
            .map((e) => Data.fromMap(e as Map<String, dynamic>))
            .toList(),
        object: data['object'] as String,
      );

  /// The data of the model.
  final List<Data> data;

  /// The object type.
  final String object;

  /// Mapping to JSON.
  Map<String, dynamic> toMap() => {
        'data': data.map((e) => e.toMap()).toList(),
        'object': object,
      };

  /// `dart:convert`
  ///
  /// Converts [Models] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  Models copyWith({
    List<Data>? data,
    String? object,
  }) {
    return Models(
      data: data ?? this.data,
      object: object ?? this.object,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data, object];
}
