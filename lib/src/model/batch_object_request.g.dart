// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_object_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchObjectRequest _$BatchObjectRequestFromJson(Map<String, dynamic> json) =>
    BatchObjectRequest(
      objects: (json['objects'] as List<dynamic>)
          .map((e) => WeaviateObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BatchObjectRequestToJson(BatchObjectRequest instance) =>
    <String, dynamic>{
      'objects': instance.objects,
    };
