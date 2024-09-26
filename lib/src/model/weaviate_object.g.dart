// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weaviate_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaviateObject _$WeaviateObjectFromJson(Map<String, dynamic> json) =>
    WeaviateObject(
      className: json['class'] as String,
      vectorWeights: json['vectorWeights'] as Map<String, dynamic>?,
      properties: json['properties'] as Map<String, dynamic>?,
      id: json['id'] as String?,
      creationTimeUnix: (json['creationTimeUnix'] as num?)?.toInt(),
      lastUpdateTimeUnix: (json['lastUpdateTimeUnix'] as num?)?.toInt(),
      vector: (json['vector'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      vectors: json['vectors'] as Map<String, dynamic>?,
      tenant: json['tenant'] as String?,
      additional: json['additional'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$WeaviateObjectToJson(WeaviateObject instance) =>
    <String, dynamic>{
      'class': instance.className,
      'vectorWeights': instance.vectorWeights,
      'properties': instance.properties,
      'id': instance.id,
      'creationTimeUnix': instance.creationTimeUnix,
      'lastUpdateTimeUnix': instance.lastUpdateTimeUnix,
      'vector': instance.vector,
      'vectors': instance.vectors,
      'tenant': instance.tenant,
      'additional': instance.additional,
    };
