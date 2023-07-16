// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text2vec_huggingface.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Text2vecHuggingFace _$Text2vecHuggingFaceFromJson(Map<String, dynamic> json) =>
    Text2vecHuggingFace(
      model: json['model'] as String,
      options: json['options'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$Text2vecHuggingFaceToJson(
        Text2vecHuggingFace instance) =>
    <String, dynamic>{
      'model': instance.model,
      'options': instance.options,
    };
