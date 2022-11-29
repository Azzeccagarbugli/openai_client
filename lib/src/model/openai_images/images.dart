import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:openai_client/src/model/openai_images/content.dart';

/// The images class.
class Images extends Equatable {
  /// The instance of the [Images] class.
  const Images({
    required this.created,
    required this.data,
  });

  /// Creates a new [Images] instance from the given [map].
  factory Images.fromMap(Map<String, dynamic> data) => Images(
        created: data['created'] as int,
        data: (data['data'] as List<dynamic>)
            .map((e) => Content.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Images].
  factory Images.fromJson(String data) {
    return Images.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// The created time.
  final int created;

  /// The data of the image.
  final List<Content> data;

  /// Mapping to JSON.
  Map<String, dynamic> toMap() => {
        'created': created,
        'data': data.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Converts [Images] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  Images copyWith({
    int? created,
    List<Content>? data,
  }) {
    return Images(
      created: created ?? this.created,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [created, data];
}

/// The enum class for [Images] class sizes.
enum ImageSize {
  /// 256x256
  small(dimension: '256x256'),

  /// 512x512
  medium(dimension: '512x512'),

  /// 1024x1024
  large(dimension: '1024x1024');

  /// The instance of the [ImageSize] class.
  const ImageSize({
    required this.dimension,
  });

  /// The dimension of the image.
  final String dimension;
}

/// The enum class for [Images] class formats.
enum ResponseFormat {
  /// The image format is `url`.
  url(format: 'url'),

  /// The image format is `b64_json`.
  b64Json(format: 'b64_json');

  /// The instance of the [ResponseFormat] class.
  const ResponseFormat({
    required this.format,
  });

  /// The string representation of the enum.
  final String format;
}
