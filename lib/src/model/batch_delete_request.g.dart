// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_delete_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchDeleteRequest _$BatchDeleteRequestFromJson(Map<String, dynamic> json) =>
    BatchDeleteRequest(
      match: Match.fromJson(json['match'] as Map<String, dynamic>),
      output: json['output'] as String,
      dryRun: json['dryRun'] as bool,
    );

Map<String, dynamic> _$BatchDeleteRequestToJson(BatchDeleteRequest instance) =>
    <String, dynamic>{
      'match': instance.match,
      'output': instance.output,
      'dryRun': instance.dryRun,
    };
