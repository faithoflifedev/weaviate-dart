import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';
import 'package:weaviate/weaviate.dart';

part 'text2vec_huggingface.g.dart';

@JsonSerializable()
class Text2vecHuggingFace {
  final String model;

  final JsonObject? options;

  Text2vecHuggingFace({
    required this.model,
    this.options,
  });

  factory Text2vecHuggingFace.fromJson(JsonObject json) =>
      _$Text2vecHuggingFaceFromJson(json);

  JsonObject toJson() => {
        'text2vec-huggingface': _$Text2vecHuggingFaceToJson(this),
      };

  @override
  String toString() => json.encode(toJson());
}
