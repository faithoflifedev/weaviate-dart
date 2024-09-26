// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sharding_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShardingConfig _$ShardingConfigFromJson(Map<String, dynamic> json) =>
    ShardingConfig(
      desiredCount: (json['desiredCount'] as num?)?.toInt(),
      virtualPerPhysical: (json['virtualPerPhysical'] as num?)?.toInt() ?? 128,
    );

Map<String, dynamic> _$ShardingConfigToJson(ShardingConfig instance) =>
    <String, dynamic>{
      'desiredCount': instance.desiredCount,
      'virtualPerPhysical': instance.virtualPerPhysical,
    };
