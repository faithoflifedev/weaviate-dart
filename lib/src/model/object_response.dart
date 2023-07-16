import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'weaviate_object.dart';

part 'object_response.g.dart';

/// A class representing the response containing a list of Weaviate objects.
///
/// Use this class to handle the response received from Weaviate that contains a list of objects.
@JsonSerializable()
class ObjectResponse {
  /// The list of Weaviate objects.
  final List<WeaviateObject> objects;

  /// Creates a new [ObjectResponse] instance.
  ///
  /// The [objects] parameter is required and represents the list of Weaviate objects.
  ObjectResponse({
    required this.objects,
  });

  /// Creates an [ObjectResponse] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the object response.
  factory ObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ObjectResponseFromJson(json);

  /// Converts the [ObjectResponse] instance to a JSON map.
  ///
  /// Returns a JSON map representing the object response.
  Map<String, dynamic> toJson() => _$ObjectResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
