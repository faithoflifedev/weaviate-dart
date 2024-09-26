// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_object_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchObjectRequest _$BatchObjectRequestFromJson(Map<String, dynamic> json) =>
    BatchObjectRequest(
      fields: (json['fields'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$FieldsEnumMap, e))
              .toList() ??
          const [Fields.all],
      objects: (json['objects'] as List<dynamic>)
          .map((e) => WeaviateObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BatchObjectRequestToJson(BatchObjectRequest instance) =>
    <String, dynamic>{
      'fields': instance.fields.map((e) => _$FieldsEnumMap[e]!).toList(),
      'objects': instance.objects,
    };

const _$FieldsEnumMap = {
  Fields.all: 'ALL',
  Fields.className: 'class',
  Fields.schema: 'schema',
  Fields.id: 'id',
  Fields.creationTimeUnix: 'creationTimeUnix',
};
