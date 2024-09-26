import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';
import 'package:weaviate/weaviate.dart';

part 'schema_class.g.dart';

enum VectorIndexType {
  @JsonValue('hnsw')
  hnsw,

  @JsonValue('flat')
  flat
}

/// A class representing a schema class in Weaviate.
///
/// Use this class to define a schema class with its properties, module configuration, and vector index settings.
@JsonSerializable()
class SchemaClass {
  /// The name of the schema class.
  @JsonKey(name: 'class')
  final String className;

  /// The module configuration for the schema class.
  final JsonObject? vectorConfig;

  /// Name of the vector index to use, eg. (hnsw) or (flat).
  final VectorIndexType? vectorIndexType;

  /// The vector index configuration for the schema class.
  ///
  /// This is an optional field and can be `null` if no vector index configuration is specified.
  final JsonObject? vectorIndexConfig;

  /// Optional, controls behavior of the collection in a multi-node setting.  See [schema](https://weaviate.io/developers/weaviate/config-refs/schema)
  final ShardingConfig? shardingConfig;

  /// Configure how replication is executed in a cluster
  final ReplicationConfig? replicationConfig;

  /// Optional, index configuration
  final InvertedIndexConfig? invertedIndexConfig;

  /// Optional, for enabling multi-tenancy for this collection (default: false).
  final JsonObject? multiTenancyConfig;

  /// Vectorizer for this collection (e.g. text2vec-transformers). This will override any cluster-wide default set by an environment variable.
  ///
  // If none, you must import a vector with each object yourself.
  final String? vectorizer;

  /// Configuration specific to modules in a collection context.
  final JsonObject? moduleConfig;

  /// The description of the schema class.
  final String? description;

  /// The properties of the schema class.
  ///
  /// This is an optional field and can be `null`.
  final List<Properties>? properties;

  /// Creates a new [SchemaClass] instance.
  ///
  /// The [className] and [moduleConfig] parameters are required.
  SchemaClass({
    required this.className,
    this.vectorConfig,
    this.vectorIndexType = VectorIndexType.hnsw,
    this.vectorIndexConfig,
    this.shardingConfig,
    this.replicationConfig,
    this.invertedIndexConfig,
    this.multiTenancyConfig = const {'enabled': false},
    this.vectorizer,
    this.moduleConfig,
    this.description,
    this.properties,
  });

  /// Creates a [SchemaClass] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the schema class.
  factory SchemaClass.fromJson(JsonObject json) => _$SchemaClassFromJson(json);

  /// Converts the [SchemaClass] instance to a JSON map.
  ///
  /// Returns a JSON map representing the schema class.
  JsonObject toJson() => _$SchemaClassToJson(this);

  @override
  String toString() => json.encode(toJson());
}
