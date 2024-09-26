// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inverted_index_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvertedIndexConfig _$InvertedIndexConfigFromJson(Map<String, dynamic> json) =>
    InvertedIndexConfig(
      cleanupIntervalSeconds:
          (json['cleanupIntervalSeconds'] as num?)?.toInt() ?? 60,
      bm25: json['bm25'] == null
          ? null
          : Bm25.fromJson(json['bm25'] as Map<String, dynamic>),
      stopWords: $enumDecodeNullable(_$StopWordsEnumMap, json['stopWords']) ??
          StopWords.en,
      indexTimestamps: json['indexTimestamps'] as bool?,
      indexNullState: json['indexNullState'] as bool?,
      indexPropertyLength: json['indexPropertyLength'] as bool?,
    );

Map<String, dynamic> _$InvertedIndexConfigToJson(
        InvertedIndexConfig instance) =>
    <String, dynamic>{
      'cleanupIntervalSeconds': instance.cleanupIntervalSeconds,
      'bm25': instance.bm25,
      'stopWords': _$StopWordsEnumMap[instance.stopWords],
      'indexTimestamps': instance.indexTimestamps,
      'indexNullState': instance.indexNullState,
      'indexPropertyLength': instance.indexPropertyLength,
    };

const _$StopWordsEnumMap = {
  StopWords.en: 'en',
  StopWords.none: 'none',
};
