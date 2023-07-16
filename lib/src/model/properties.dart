import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'properties.g.dart';

/// A class representing the properties of a Weaviate object.
///
/// Use this class to define the properties of a Weaviate object, including its data type, description, module configuration, and indexing options.
@JsonSerializable()
class Properties {
  /// The data type(s) of the property.
  final List<String> dataType;

  /// The description of the property.
  final String description;

  /// The module configuration for the property.
  ///
  /// This is an optional field and can be `null` if no module configuration is specified.
  final Map<String, dynamic>? moduleConfig;

  /// The name of the property.
  final String name;

  /// Indicates whether the property is filterable in search queries.
  ///
  /// This is an optional field and can be `null`.
  final bool? indexFilterable;

  /// Indicates whether the property is searchable in full-text search queries.
  ///
  /// This is an optional field and can be `null`.
  final bool? indexSearchable;

  /// The tokenization method for the property.
  ///
  /// This is an optional field and can be `null`.
  final String? tokenization;

  /// Creates a new [Properties] instance.
  ///
  /// The [dataType], [description], and [name] parameters are required.
  Properties({
    required this.dataType,
    required this.description,
    this.moduleConfig,
    required this.name,
    this.indexFilterable,
    this.indexSearchable,
    this.tokenization,
  });

  /// Creates a [Properties] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the properties.
  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);

  /// Converts the [Properties] instance to a JSON map.
  ///
  /// Returns a JSON map representing the properties.
  Map<String, dynamic> toJson() => _$PropertiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
