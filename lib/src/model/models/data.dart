import 'dart:convert';

import 'package:equatable/equatable.dart';

/// The data of the model.
class Data extends Equatable {
  /// The instance of the [Data] class.
  const Data({
    required this.id,
    required this.object,
    required this.ownedBy,
    required this.permission,
  });

  /// Creates a new [Data] instance from the given [map].
  factory Data.fromMap(Map<String, dynamic> data) => Data(
        id: data['id'] as String,
        object: data['object'] as String,
        ownedBy: data['owned_by'] as String,
        permission: data['permission'] as List<dynamic>,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// The ID of the object.
  final String id;

  /// The object type.
  final String object;

  /// The ID of the user who owns the object.
  final String ownedBy;

  /// The permissions of the object.
  final List<dynamic> permission;

  /// Mappping to JSON.
  Map<String, dynamic> toMap() => {
        'id': id,
        'object': object,
        'owned_by': ownedBy,
        'permission': permission,
      };

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Copy with extension.
  Data copyWith({
    String? id,
    String? object,
    String? ownedBy,
    List<String>? permission,
  }) {
    return Data(
      id: id ?? this.id,
      object: object ?? this.object,
      ownedBy: ownedBy ?? this.ownedBy,
      permission: permission ?? this.permission,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, object, ownedBy, permission];
}
