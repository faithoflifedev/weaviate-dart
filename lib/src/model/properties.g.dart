// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      dataType:
          (json['dataType'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      moduleConfig: json['moduleConfig'] as Map<String, dynamic>?,
      name: json['name'] as String,
      indexFilterable: json['indexFilterable'] as bool?,
      indexSearchable: json['indexSearchable'] as bool?,
      tokenization: json['tokenization'] as String?,
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'dataType': instance.dataType,
      'description': instance.description,
      'moduleConfig': instance.moduleConfig,
      'name': instance.name,
      'indexFilterable': instance.indexFilterable,
      'indexSearchable': instance.indexSearchable,
      'tokenization': instance.tokenization,
    };
