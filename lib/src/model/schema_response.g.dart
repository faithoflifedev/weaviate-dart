// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemaResponse _$SchemaResponseFromJson(Map<String, dynamic> json) =>
    SchemaResponse(
      classes: (json['classes'] as List<dynamic>)
          .map((e) => SchemaClass.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SchemaResponseToJson(SchemaResponse instance) =>
    <String, dynamic>{
      'classes': instance.classes,
    };
