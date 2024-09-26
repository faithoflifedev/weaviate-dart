// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemaClass _$SchemaClassFromJson(Map<String, dynamic> json) => SchemaClass(
      className: json['class'] as String,
      vectorConfig: json['vectorConfig'] as Map<String, dynamic>?,
      vectorIndexType: $enumDecodeNullable(
              _$VectorIndexTypeEnumMap, json['vectorIndexType']) ??
          VectorIndexType.hnsw,
      vectorIndexConfig: json['vectorIndexConfig'] as Map<String, dynamic>?,
      shardingConfig: json['shardingConfig'] == null
          ? null
          : ShardingConfig.fromJson(
              json['shardingConfig'] as Map<String, dynamic>),
      replicationConfig: json['replicationConfig'] == null
          ? null
          : ReplicationConfig.fromJson(
              json['replicationConfig'] as Map<String, dynamic>),
      invertedIndexConfig: json['invertedIndexConfig'] == null
          ? null
          : InvertedIndexConfig.fromJson(
              json['invertedIndexConfig'] as Map<String, dynamic>),
      multiTenancyConfig: json['multiTenancyConfig'] as Map<String, dynamic>? ??
          const {'enabled': false},
      vectorizer: json['vectorizer'] as String?,
      moduleConfig: json['moduleConfig'] as Map<String, dynamic>?,
      description: json['description'] as String?,
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => Properties.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SchemaClassToJson(SchemaClass instance) =>
    <String, dynamic>{
      'class': instance.className,
      'vectorConfig': instance.vectorConfig,
      'vectorIndexType': _$VectorIndexTypeEnumMap[instance.vectorIndexType],
      'vectorIndexConfig': instance.vectorIndexConfig,
      'shardingConfig': instance.shardingConfig,
      'replicationConfig': instance.replicationConfig,
      'invertedIndexConfig': instance.invertedIndexConfig,
      'multiTenancyConfig': instance.multiTenancyConfig,
      'vectorizer': instance.vectorizer,
      'moduleConfig': instance.moduleConfig,
      'description': instance.description,
      'properties': instance.properties,
    };

const _$VectorIndexTypeEnumMap = {
  VectorIndexType.hnsw: 'hnsw',
  VectorIndexType.flat: 'flat',
};
