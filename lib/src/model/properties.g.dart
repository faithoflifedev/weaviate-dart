// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      dataType:
          (json['dataType'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String?,
      moduleConfig: json['moduleConfig'] as Map<String, dynamic>?,
      name: json['name'] as String,
      indexFilterable: json['indexFilterable'] as bool?,
      indexSearchable: json['indexSearchable'] as bool?,
      indexRangeFilters: json['indexRangeFilters'] as bool?,
      tokenization:
          $enumDecodeNullable(_$TokenizationEnumMap, json['tokenization']) ??
              Tokenization.word,
      nestedProperties: json['nestedProperties'] == null
          ? null
          : Properties.fromJson(
              json['nestedProperties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'dataType': instance.dataType,
      'description': instance.description,
      'moduleConfig': instance.moduleConfig,
      'name': instance.name,
      'indexFilterable': instance.indexFilterable,
      'indexSearchable': instance.indexSearchable,
      'indexRangeFilters': instance.indexRangeFilters,
      'tokenization': _$TokenizationEnumMap[instance.tokenization],
      'nestedProperties': instance.nestedProperties,
    };

const _$TokenizationEnumMap = {
  Tokenization.word: 'word',
  Tokenization.lowercase: 'lowercase',
  Tokenization.whitespace: 'whitespace',
  Tokenization.field: 'field',
  Tokenization.trigram: 'trigram',
  Tokenization.gse: 'gse',
  Tokenization.kagome_kr: 'kagome_kr',
};
