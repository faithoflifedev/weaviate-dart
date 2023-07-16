import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'weaviate_object.g.dart';

/// A class representing a Weaviate object.
///
/// Use this class to define a Weaviate object with its class, properties, and additional metadata.
@JsonSerializable()
class WeaviateObject {
  /// The class of the Weaviate object.
  @JsonKey(name: 'class')
  final String className;

  /// The properties of the Weaviate object.
  final Map<String, dynamic> properties;

  /// The ID of the Weaviate object.
  final String? id;

  /// The Unix timestamp representing the creation time of the Weaviate object.
  final int? creationTimeUnix;

  /// The Unix timestamp representing the last update time of the Weaviate object.
  final int? lastUpdateTimeUnix;

  /// The vector associated with the Weaviate object.
  final List<double>? vector;

  /// The classification information associated with the Weaviate object.
  final List<Map<String, dynamic>>? classification;

  /// The feature projection associated with the Weaviate object.
  final List<double>? featureProjection;

  /// Creates a new [WeaviateObject] instance.
  ///
  /// The [className] and [properties] parameters are required.
  WeaviateObject({
    required this.className,
    required this.properties,
    this.id,
    this.creationTimeUnix,
    this.lastUpdateTimeUnix,
    this.vector,
    this.classification,
    this.featureProjection,
  });

  /// Creates a [WeaviateObject] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the Weaviate object.
  factory WeaviateObject.fromJson(Map<String, dynamic> json) =>
      _$WeaviateObjectFromJson(json);

  /// Converts the [WeaviateObject] instance to a JSON map.
  ///
  /// Returns a JSON map representing the Weaviate object.
  Map<String, dynamic> toJson() =>
      _$WeaviateObjectToJson(this)..removeWhere((key, value) => value == null);

  @override
  String toString() => json.encode(toJson());
}
