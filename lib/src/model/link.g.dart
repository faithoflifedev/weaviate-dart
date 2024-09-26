// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      documentationHref: json['documentationHref'] as String?,
      href: json['href'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'documentationHref': instance.documentationHref,
      'href': instance.href,
      'name': instance.name,
    };
