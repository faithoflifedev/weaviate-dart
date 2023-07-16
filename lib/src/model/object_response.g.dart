// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectResponse _$ObjectResponseFromJson(Map<String, dynamic> json) =>
    ObjectResponse(
      objects: (json['objects'] as List<dynamic>)
          .map((e) => WeaviateObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ObjectResponseToJson(ObjectResponse instance) =>
    <String, dynamic>{
      'objects': instance.objects,
    };
