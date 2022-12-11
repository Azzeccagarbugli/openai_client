import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:openai_client/src/model/openai_embeddings/embedding_data.dart';
import 'package:openai_client/src/model/openai_embeddings/usage.dart';

/// The Embeddings object contains a list of EmbeddingData objects, each of which
/// contains a single embedding vector. The Embeddings object also contains a
/// Usage object, which contains information about the usage of the embedding
/// model.
///
/// The Embeddings object is returned by the Embedding API.
class Embeddings extends Equatable {
  /// The instance of [Embeddings] class.
  const Embeddings({
    required this.object,
    required this.data,
    required this.usage,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Embeddings].
  factory Embeddings.fromJson(String data) {
    return Embeddings.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Creates a new [Embeddings] instance from the given [map].
  factory Embeddings.fromMap(Map<String, dynamic> data) => Embeddings(
        object: data['object'] as String,
        data: (data['data'] as List<dynamic>)
            .map((e) => EmbeddingData.fromMap(e as Map<String, dynamic>))
            .toList(),
        usage: Usage.fromMap(data['usage'] as Map<String, dynamic>),
      );

  /// The object.
  final String object;

  /// The list of [EmbeddingData] objects.
  final List<EmbeddingData> data;

  /// The [Usage] object.
  final Usage usage;

  /// Mappping the [Embeddings] to a [Map] instance.
  Map<String, dynamic> toMap() => {
        'object': object,
        'data': data.map((e) => e.toMap()).toList(),
        'usage': usage.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [Embeddings] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  Embeddings copyWith({
    String? object,
    List<EmbeddingData>? data,
    Usage? usage,
  }) {
    return Embeddings(
      object: object ?? this.object,
      data: data ?? this.data,
      usage: usage ?? this.usage,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [object, data, usage];
}
