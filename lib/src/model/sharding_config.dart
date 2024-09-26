import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';
import 'package:weaviate/weaviate.dart';

part 'sharding_config.g.dart';

/// Specify how the index should be sharded and distributed in the cluster
@JsonSerializable()
class ShardingConfig {
  /// (Defaults to the number of nodes in the cluster.) Controls how many shards should be created for this collection index. The typical setting is that a collection should be distributed across all the nodes in the cluster, but you can explicitly set this value to a lower value. If the desiredCount is larger than the amount of physical nodes in the cluster, then some nodes will contain multiple shards.
  final int? desiredCount;

  /// Weaviate uses virtual shards. This helps in reducing the amount of data moved when resharding
  final int? virtualPerPhysical;

  /// Creates a new [ShardingConfig] instance.
  ShardingConfig({
    this.desiredCount,
    this.virtualPerPhysical = 128,
  });

  /// Creates a [ShardingConfig] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the ShardingConfig criteria.
  factory ShardingConfig.fromJson(JsonObject json) =>
      _$ShardingConfigFromJson(json);

  /// Converts the [ShardingConfig] instance to a JSON map.
  ///
  /// Returns a JSON map representing the ShardingConfig criteria.
  JsonObject toJson() => _$ShardingConfigToJson(this);

  @override
  String toString() => json.encode(toJson());
}
