import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'weaviate_object.dart';

part 'batch_object_request.g.dart';

/// A class representing a batch object request.
///
/// Use this class to send a batch request for creating or updating multiple objects in Weaviate.
@JsonSerializable()
class BatchObjectRequest {
  /// The list of Weaviate objects to be created or updated.
  final List<WeaviateObject> objects;

  /// Creates a new [BatchObjectRequest] instance.
  ///
  /// The [objects] parameter is required and represents the list of Weaviate objects to be created or updated.
  BatchObjectRequest({
    required this.objects,
  });

  /// Creates a [BatchObjectRequest] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the batch object request.
  factory BatchObjectRequest.fromJson(Map<String, dynamic> json) =>
      _$BatchObjectRequestFromJson(json);

  /// Converts the [BatchObjectRequest] instance to a JSON map.
  ///
  /// Returns a JSON map representing the batch object request.
  Map<String, dynamic> toJson() => _$BatchObjectRequestToJson(this);

  @override
  String toString() => json.encode(toJson());
}
