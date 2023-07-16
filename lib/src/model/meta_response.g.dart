// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaResponse _$MetaResponseFromJson(Map<String, dynamic> json) => MetaResponse(
      hostname: json['hostname'] as String,
      modules: json['modules'] as Map<String, dynamic>,
      version: json['version'] as String,
    );

Map<String, dynamic> _$MetaResponseToJson(MetaResponse instance) =>
    <String, dynamic>{
      'hostname': instance.hostname,
      'modules': instance.modules,
      'version': instance.version,
    };
