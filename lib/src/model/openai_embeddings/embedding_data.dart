import 'dart:convert';

import 'package:equatable/equatable.dart';

/// The EmbeddingData class.
class EmbeddingData extends Equatable {
  /// The instance of [EmbeddingData] class.
  const EmbeddingData({
    required this.object,
    required this.embedding,
    required this.index,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EmbeddingData].
  factory EmbeddingData.fromJson(String data) {
    return EmbeddingData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Creates a new [EmbeddingData] instance from the given [map].
  factory EmbeddingData.fromMap(Map<String, dynamic> data) => EmbeddingData(
        object: data['object'] as String,
        embedding: data['embedding'] as List<double>,
        index: data['index'] as int,
      );

  /// The object.
  final String object;

  /// The list of embeddings.
  final List<double> embedding;

  /// The index.
  final int index;

  /// Mappping the [EmbeddingData] to a [Map] instance.
  Map<String, dynamic> toMap() => {
        'object': object,
        'embedding': embedding,
        'index': index,
      };

  /// `dart:convert`
  ///
  /// Converts [EmbeddingData] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  EmbeddingData copyWith({
    String? object,
    List<double>? embedding,
    int? index,
  }) {
    return EmbeddingData(
      object: object ?? this.object,
      embedding: embedding ?? this.embedding,
      index: index ?? this.index,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [object, embedding, index];
}
