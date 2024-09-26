import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';
import 'package:weaviate/weaviate.dart';

part 'bm25.g.dart';

/// tuning parameters for the BM25 algorithm
@JsonSerializable()
class Bm25 {
  /// Asynchronous index clean up happens every n seconds
  final double? k1;

  final double? b;

  /// tuning parameters for the BM25 algorithm
  Bm25({
    this.k1 = 1.2,
    this.b = 0.75,
  });

  /// Creates a [Bm25] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the Bm25 criteria.
  factory Bm25.fromJson(JsonObject json) => _$Bm25FromJson(json);

  /// Converts the [Bm25] instance to a JSON map.
  ///
  /// Returns a JSON map representing the Bm25 criteria.
  JsonObject toJson() => _$Bm25ToJson(this);

  @override
  String toString() => json.encode(toJson());
}
