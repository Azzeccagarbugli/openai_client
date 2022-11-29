import 'dart:convert';

import 'package:equatable/equatable.dart';

/// The content class.
class Content extends Equatable {
  /// The instance of the [Content] class.
  const Content({
    required this.url,
  });

  /// Creates a new [Content] instance from the given [map].
  factory Content.fromMap(Map<String, dynamic> data) => Content(
        url: data['url'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Content.fromJson(String data) {
    return Content.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// The url of the image.
  final String url;

  /// Mapping to JSON.
  Map<String, dynamic> toMap() => {
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  Content copyWith({
    String? url,
  }) {
    return Content(
      url: url ?? this.url,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url];
}
