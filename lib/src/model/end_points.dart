import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';
import 'package:weaviate/weaviate.dart';

part 'end_points.g.dart';

/// Get links to other endpoints to help discover the REST API
@JsonSerializable()
class EndPoints {
  /// links to other endpoints to help discover the REST API
  final List<Link> links;

  /// Creates a new [EndPoints] instance.
  ///
  /// The [links] to other endpoints to help discover the REST API
  EndPoints({
    required this.links,
  });

  /// Creates a [EndPoints] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the batch object request.
  factory EndPoints.fromJson(JsonObject json) => _$EndPointsFromJson(json);

  /// Converts the [EndPoints] instance to a JSON map.
  ///
  /// Returns a JSON map representing the batch object request.
  JsonObject toJson() => _$EndPointsToJson(this);

  @override
  String toString() => json.encode(toJson());
}
