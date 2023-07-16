import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'meta_response.g.dart';

/// A class representing the metadata response from Weaviate.
///
/// Use this class to handle the metadata response containing information about the Weaviate server.
@JsonSerializable()
class MetaResponse {
  /// The hostname of the Weaviate server.
  final String hostname;

  /// The modules installed on the Weaviate server.
  ///
  /// The modules are represented as a map where the keys are strings and the values are dynamic.
  final Map<String, dynamic> modules;

  /// The version of the Weaviate server.
  final String version;

  /// Creates a new [MetaResponse] instance.
  ///
  /// The [hostname], [modules], and [version] parameters are required.
  MetaResponse({
    required this.hostname,
    required this.modules,
    required this.version,
  });

  /// Creates a [MetaResponse] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the metadata response.
  factory MetaResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaResponseFromJson(json);

  /// Converts the [MetaResponse] instance to a JSON map.
  ///
  /// Returns a JSON map representing the metadata response.
  Map<String, dynamic> toJson() => _$MetaResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
