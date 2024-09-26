import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';
import 'package:weaviate/weaviate.dart';

part 'replication_config.g.dart';

/// Configure how replication is executed in a cluster
@JsonSerializable()
class ReplicationConfig {
  /// Number of times a class is replicated
  final int? factor;

  /// Enable asynchronous replication
  final bool? asyncEnabled;

  /// Configure how replication is executed in a cluster
  ReplicationConfig({
    this.factor = 1,
    this.asyncEnabled,
  });

  /// Creates a [ReplicationConfig] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the ReplicationConfig criteria.
  factory ReplicationConfig.fromJson(JsonObject json) =>
      _$ReplicationConfigFromJson(json);

  /// Converts the [ReplicationConfig] instance to a JSON map.
  ///
  /// Returns a JSON map representing the ReplicationConfig criteria.
  JsonObject toJson() => _$ReplicationConfigToJson(this);

  @override
  String toString() => json.encode(toJson());
}
