// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bm25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bm25 _$Bm25FromJson(Map<String, dynamic> json) => Bm25(
      k1: (json['k1'] as num?)?.toDouble() ?? 1.2,
      b: (json['b'] as num?)?.toDouble() ?? 0.75,
    );

Map<String, dynamic> _$Bm25ToJson(Bm25 instance) => <String, dynamic>{
      'k1': instance.k1,
      'b': instance.b,
    };
