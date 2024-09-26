// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
      dataType:
          (json['dataType'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String?,
      moduleConfig: json['moduleConfig'] as Map<String, dynamic>?,
      name: json['name'] as String,
      indexFilterable: json['indexFilterable'] as bool? ?? true,
      indexSearchable: json['indexSearchable'] as bool? ?? true,
      indexRangeFilters: json['indexRangeFilters'] as bool? ?? false,
      tokenization: json['tokenization'] as String? ?? 'word',
      nestedProperties: (json['nestedProperties'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'dataType': instance.dataType,
      'description': instance.description,
      'moduleConfig': instance.moduleConfig,
      'name': instance.name,
      'indexFilterable': instance.indexFilterable,
      'indexSearchable': instance.indexSearchable,
      'indexRangeFilters': instance.indexRangeFilters,
      'tokenization': instance.tokenization,
      'nestedProperties': instance.nestedProperties,
    };
