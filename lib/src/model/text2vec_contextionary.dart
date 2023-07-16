import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

part 'text2vec_contextionary.g.dart';

@JsonSerializable()
class Text2vecContextionary {
  final bool vectorizePropertyName;

  Text2vecContextionary({
    required this.vectorizePropertyName,
  });

  factory Text2vecContextionary.fromJson(Map<String, dynamic> json) =>
      _$Text2vecContextionaryFromJson(json);

  Map<String, dynamic> toJson() => _$Text2vecContextionaryToJson(this);

  @override
  String toString() => json.encode(toJson());
}
