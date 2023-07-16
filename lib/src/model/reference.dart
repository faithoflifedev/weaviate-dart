import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'reference.g.dart';

/// A class representing a reference between two Weaviate objects.
///
/// Use this class to establish a reference from one Weaviate object to another.
@JsonSerializable()
class Reference {
  /// The source Weaviate object's UUID from which the reference originates.
  final String from;

  /// The target Weaviate object's UUID to which the reference points.
  final String to;

  /// Creates a new [Reference] instance.
  ///
  /// The [from] and [to] parameters are required and represent the UUIDs of the source and target objects respectively.
  Reference({
    required this.from,
    required this.to,
  });

  /// Creates a [Reference] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the reference.
  factory Reference.fromJson(Map<String, dynamic> json) =>
      _$ReferenceFromJson(json);

  /// Converts the [Reference] instance to a JSON map.
  ///
  /// Returns a JSON map representing the reference.
  Map<String, dynamic> toJson() => _$ReferenceToJson(this);

  @override
  String toString() => json.encode(toJson());
}
