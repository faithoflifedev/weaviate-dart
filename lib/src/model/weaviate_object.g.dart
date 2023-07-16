// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weaviate_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaviateObject _$WeaviateObjectFromJson(Map<String, dynamic> json) =>
    WeaviateObject(
      className: json['class'] as String,
      properties: json['properties'] as Map<String, dynamic>,
      id: json['id'] as String?,
      creationTimeUnix: json['creationTimeUnix'] as int?,
      lastUpdateTimeUnix: json['lastUpdateTimeUnix'] as int?,
      vector: (json['vector'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      classification: (json['classification'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      featureProjection: (json['featureProjection'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$WeaviateObjectToJson(WeaviateObject instance) =>
    <String, dynamic>{
      'class': instance.className,
      'properties': instance.properties,
      'id': instance.id,
      'creationTimeUnix': instance.creationTimeUnix,
      'lastUpdateTimeUnix': instance.lastUpdateTimeUnix,
      'vector': instance.vector,
      'classification': instance.classification,
      'featureProjection': instance.featureProjection,
    };
