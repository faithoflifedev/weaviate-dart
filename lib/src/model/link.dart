import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';
import 'package:weaviate/weaviate.dart';

part 'link.g.dart';

/// Get links to other endpoints to help discover the REST API
@JsonSerializable()
class Link {
  final String? documentationHref;

  final String href;

  final String name;

  /// Creates a new [Link] instance.
  ///
  /// The link to other endpoints to help discover the REST API
  Link({
    this.documentationHref,
    required this.href,
    required this.name,
  });

  /// Creates a [Link] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the batch object request.
  factory Link.fromJson(JsonObject json) => _$LinkFromJson(json);

  /// Converts the [Link] instance to a JSON map.
  ///
  /// Returns a JSON map representing the batch object request.
  JsonObject toJson() => _$LinkToJson(this);

  @override
  String toString() => json.encode(toJson());
}
