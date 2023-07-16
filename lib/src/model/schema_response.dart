import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'schema_class.dart';

part 'schema_response.g.dart';

/// A class representing the response containing the schema information from Weaviate.
///
/// Use this class to handle the response received from Weaviate that contains the schema information, including the list of schema classes.
@JsonSerializable()
class SchemaResponse {
  /// The list of schema classes.
  final List<SchemaClass> classes;

  /// Creates a new [SchemaResponse] instance.
  ///
  /// The [classes] parameter is required and represents the list of schema classes.
  SchemaResponse({
    required this.classes,
  });

  /// Creates a [SchemaResponse] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the schema response.
  factory SchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$SchemaResponseFromJson(json);

  /// Converts the [SchemaResponse] instance to a JSON map.
  ///
  /// Returns a JSON map representing the schema response.
  Map<String, dynamic> toJson() => _$SchemaResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
