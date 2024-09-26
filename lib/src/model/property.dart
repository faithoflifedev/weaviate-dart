import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';
import 'package:weaviate/weaviate.dart';

part 'property.g.dart';

@JsonSerializable()
class Property {
  /// Data type of the property. If it starts with a capital (for example Person), may be a reference to another type.
  final List<String> dataType;

  final String? description;

  final JsonObject? moduleConfig;

  final String name;

  final bool? indexFilterable;

  final bool? indexSearchable;

  final bool? indexRangeFilters;

  final String? tokenization;

  final List<JsonObject>? nestedProperties;

  Property({
    required this.dataType,
    this.description,
    this.moduleConfig,
    required this.name,
    this.indexFilterable = true,
    this.indexSearchable = true,
    this.indexRangeFilters = false,
    this.tokenization = 'word',
    this.nestedProperties,
  });

  /// Creates a [Property] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the batch object request.
  factory Property.fromJson(JsonObject json) => _$PropertyFromJson(json);

  /// Converts the [Property] instance to a JSON map.
  ///
  /// Returns a JSON map representing the batch object request.
  JsonObject toJson() => _$PropertyToJson(this);

  @override
  String toString() => json.encode(toJson());
}
