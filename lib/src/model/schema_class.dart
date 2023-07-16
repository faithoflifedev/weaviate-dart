import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'properties.dart';

part 'schema_class.g.dart';

/// A class representing a schema class in Weaviate.
///
/// Use this class to define a schema class with its properties, module configuration, and vector index settings.
@JsonSerializable()
class SchemaClass {
  /// The name of the schema class.
  @JsonKey(name: 'class')
  final String className;

  /// The description of the schema class.
  final String? description;

  /// The module configuration for the schema class.
  final Map<String, dynamic> moduleConfig;

  /// The vector index configuration for the schema class.
  ///
  /// This is an optional field and can be `null` if no vector index configuration is specified.
  final Map<String, dynamic>? vectorIndexConfig;

  /// The properties of the schema class.
  ///
  /// This is an optional field and can be `null`.
  final List<Properties>? properties;

  /// The vector index type for the schema class.
  ///
  /// This is an optional field and can be `null`.
  final String? vectorIndexType;

  /// The vectorizer type for the schema class.
  ///
  /// The default value is 'none' if not provided.
  final String? vectorizer;

  /// Creates a new [SchemaClass] instance.
  ///
  /// The [className] and [moduleConfig] parameters are required.
  SchemaClass({
    required this.className,
    this.description,
    required this.moduleConfig,
    this.vectorIndexConfig,
    this.properties,
    this.vectorIndexType,
    this.vectorizer = 'none',
  });

  /// Creates a [SchemaClass] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the schema class.
  factory SchemaClass.fromJson(Map<String, dynamic> json) =>
      _$SchemaClassFromJson(json);

  /// Converts the [SchemaClass] instance to a JSON map.
  ///
  /// Returns a JSON map representing the schema class.
  Map<String, dynamic> toJson() => _$SchemaClassToJson(this);

  @override
  String toString() => json.encode(toJson());
}
