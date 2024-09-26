// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replication_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplicationConfig _$ReplicationConfigFromJson(Map<String, dynamic> json) =>
    ReplicationConfig(
      factor: (json['factor'] as num?)?.toInt() ?? 1,
      asyncEnabled: json['asyncEnabled'] as bool?,
    );

Map<String, dynamic> _$ReplicationConfigToJson(ReplicationConfig instance) =>
    <String, dynamic>{
      'factor': instance.factor,
      'asyncEnabled': instance.asyncEnabled,
    };
