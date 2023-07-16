import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'text2vec_huggingface.g.dart';

@JsonSerializable()
class Text2vecHuggingFace {
  final String model;

  final Map<String, dynamic>? options;

  Text2vecHuggingFace({
    required this.model,
    this.options,
  });

  factory Text2vecHuggingFace.fromJson(Map<String, dynamic> json) =>
      _$Text2vecHuggingFaceFromJson(json);

  Map<String, dynamic> toJson() => _$Text2vecHuggingFaceToJson(this);

  @override
  String toString() => json.encode(toJson());
}
