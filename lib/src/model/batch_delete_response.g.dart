// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchDeleteResponse _$BatchDeleteResponseFromJson(Map<String, dynamic> json) =>
    BatchDeleteResponse(
      match: Match.fromJson(json['match'] as Map<String, dynamic>),
      output: json['output'] as String,
      dryRun: json['dryRun'] as bool,
      results: json['results'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$BatchDeleteResponseToJson(
        BatchDeleteResponse instance) =>
    <String, dynamic>{
      'match': instance.match,
      'output': instance.output,
      'dryRun': instance.dryRun,
      'results': instance.results,
    };
