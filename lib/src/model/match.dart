import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';
import 'package:weaviate/weaviate.dart';

part 'match.g.dart';

/// A class representing a match criteria used in Weaviate requests.
///
/// Use this class to specify the matching criteria for filtering data in Weaviate requests.
@JsonSerializable()
class Match {
  /// The matching criteria represented as a map.
  ///
  /// The map contains key-value pairs where the keys represent the properties to match against, and the values represent the matching conditions.
  final JsonObject where;

  /// Creates a new [Match] instance.
  ///
  /// The [where] parameter is required and represents the matching criteria as a map.
  Match({
    required this.where,
  });

  /// Creates a [Match] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the match criteria.
  factory Match.fromJson(JsonObject json) => _$MatchFromJson(json);

  /// Converts the [Match] instance to a JSON map.
  ///
  /// Returns a JSON map representing the match criteria.
  JsonObject toJson() => _$MatchToJson(this);

  @override
  String toString() => json.encode(toJson());
}
