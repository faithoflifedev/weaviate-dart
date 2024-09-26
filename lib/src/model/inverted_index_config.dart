import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';
import 'package:weaviate/weaviate.dart';

part 'inverted_index_config.g.dart';

enum StopWords {
  @JsonValue('en')
  en,

  @JsonValue('none')
  none
}

/// Configure the inverted index built into Weaviate
@JsonSerializable()
class InvertedIndexConfig {
  /// Asynchronous index clean up happens every n seconds
  final int? cleanupIntervalSeconds;

  /// tuning parameters for the BM25 algorithm
  final Bm25? bm25;

  /// fine-grained control over stopword list usage
  final StopWords? stopWords;

  /// Index each object by its internal timestamps
  final bool? indexTimestamps;

  /// Index each object with the null state
  final bool? indexNullState;

  /// Index length of properties
  final bool? indexPropertyLength;

  /// Configure the inverted index built into Weaviate
  InvertedIndexConfig({
    this.cleanupIntervalSeconds = 60,
    this.bm25,
    this.stopWords = StopWords.en,
    this.indexTimestamps,
    this.indexNullState,
    this.indexPropertyLength,
  });

  /// Creates a [InvertedIndexConfig] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the InvertedIndexConfig criteria.
  factory InvertedIndexConfig.fromJson(JsonObject json) =>
      _$InvertedIndexConfigFromJson(json);

  /// Converts the [InvertedIndexConfig] instance to a JSON map.
  ///
  /// Returns a JSON map representing the InvertedIndexConfig criteria.
  JsonObject toJson() => _$InvertedIndexConfigToJson(this);

  @override
  String toString() => json.encode(toJson());
}
