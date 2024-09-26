import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';
import 'package:weaviate/weaviate.dart';

part 'weaviate_object.g.dart';

/// A class representing a Weaviate object.
///
/// Use this class to define a Weaviate object with its class, properties, and additional metadata.
@JsonSerializable()
class WeaviateObject {
  /// The class of the Weaviate object.
  @JsonKey(name: 'class')
  final String className;

  /// Allow custom overrides of vector weights as math expressions in word-based vectorization models. E.g. "pancake": "7" will set the weight for the word pancake to 7 in the vectorization, whereas "w * 3" would triple the originally calculated word.
  final JsonObject? vectorWeights;

  /// The properties of the Weaviate object.
  final JsonObject? properties;

  /// The ID of the Weaviate object.
  final String? id;

  /// (Response only) Timestamp of creation of this object in milliseconds since epoch UTC.
  final int? creationTimeUnix;

  /// (Response only) Timestamp of the last object update in milliseconds since epoch UTC.
  final int? lastUpdateTimeUnix;

  /// The vector associated with the Weaviate object.
  final List<double>? vector;

  /// This field returns vectors associated with the Object.
  final JsonObject? vectors;

  /// Name of the tenant.
  final String? tenant;

  /// (Response only) Additional meta information about a single object.
  final JsonObject? additional;

  /// Creates a new [WeaviateObject] instance.
  ///
  /// The [className] and [properties] parameters are required.
  WeaviateObject({
    required this.className,
    this.vectorWeights,
    this.properties,
    this.id,
    this.creationTimeUnix,
    this.lastUpdateTimeUnix,
    this.vector,
    this.vectors,
    this.tenant,
    this.additional,
  });

  /// Creates a [WeaviateObject] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the Weaviate object.
  factory WeaviateObject.fromJson(JsonObject json) =>
      _$WeaviateObjectFromJson(json);

  /// Converts the [WeaviateObject] instance to a JSON map.
  ///
  /// Returns a JSON map representing the Weaviate object.
  JsonObject toJson() =>
      _$WeaviateObjectToJson(this)..removeWhere((key, value) => value == null);

  @override
  String toString() => json.encode(toJson());
}
