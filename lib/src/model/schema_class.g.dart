// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemaClass _$SchemaClassFromJson(Map<String, dynamic> json) => SchemaClass(
      className: json['class'] as String,
      description: json['description'] as String?,
      moduleConfig: json['moduleConfig'] as Map<String, dynamic>,
      vectorIndexConfig: json['vectorIndexConfig'] as Map<String, dynamic>?,
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => Properties.fromJson(e as Map<String, dynamic>))
          .toList(),
      vectorIndexType: json['vectorIndexType'] as String?,
      vectorizer: json['vectorizer'] as String? ?? 'none',
    );

Map<String, dynamic> _$SchemaClassToJson(SchemaClass instance) =>
    <String, dynamic>{
      'class': instance.className,
      'description': instance.description,
      'moduleConfig': instance.moduleConfig,
      'vectorIndexConfig': instance.vectorIndexConfig,
      'properties': instance.properties,
      'vectorIndexType': instance.vectorIndexType,
      'vectorizer': instance.vectorizer,
    };
