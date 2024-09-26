import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';
import 'package:weaviate/weaviate.dart';

part 'properties.g.dart';

enum Tokenization {
  @JsonValue('word')
  word,

  @JsonValue('lowercase')
  lowercase,

  @JsonValue('whitespace')
  whitespace,

  @JsonValue('field')
  field,

  @JsonValue('trigram')
  trigram,

  @JsonValue('gse')
  gse,

  @JsonValue('kagome_kr')
  // ignore: constant_identifier_names
  kagome_kr,
}

/// A class representing the properties of a Weaviate object.
///
/// Use this class to define the properties of a Weaviate object, including its data type, description, module configuration, and indexing options.
@JsonSerializable()
class Properties {
  /// The data type(s) of the property.
  final List<String> dataType;

  /// The description of the property.
  final String? description;

  /// The module configuration for the property.
  ///
  /// This is an optional field and can be `null` if no module configuration is specified.
  final JsonObject? moduleConfig;

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

  /// Whether to include this property in the filterable, range-based Roaring Bitmap inverted index. Defaults to false. Provides better performance for range queries compared to filterable index in large datasets. Applicable only to properties of data type int, number, date.
  final bool? indexRangeFilters;

  /// The tokenization method for the property.
  ///
  /// This is an optional field and can be `null`.
  final Tokenization? tokenization;

  final Properties? nestedProperties;

  /// Creates a new [Properties] instance.
  ///
  /// The [dataType], [description], and [name] parameters are required.
  Properties({
    required this.dataType,
    this.description,
    this.moduleConfig,
    required this.name,
    this.indexFilterable,
    this.indexSearchable,
    this.indexRangeFilters,
    this.tokenization = Tokenization.word,
    this.nestedProperties,
  });

  /// Creates a [Properties] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the properties.
  factory Properties.fromJson(JsonObject json) => _$PropertiesFromJson(json);

  /// Converts the [Properties] instance to a JSON map.
  ///
  /// Returns a JSON map representing the properties.
  JsonObject toJson() => _$PropertiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
