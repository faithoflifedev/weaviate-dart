// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end_points.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndPoints _$EndPointsFromJson(Map<String, dynamic> json) => EndPoints(
      links: (json['links'] as List<dynamic>)
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EndPointsToJson(EndPoints instance) => <String, dynamic>{
      'links': instance.links,
    };
