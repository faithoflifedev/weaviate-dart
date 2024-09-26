import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';
import 'package:weaviate/weaviate.dart';

part 'batch_object_request.g.dart';

enum Fields {
  @JsonValue('ALL')
  all,

  @JsonValue('class')
  className,

  @JsonValue('schema')
  schema,

  @JsonValue('id')
  id,

  @JsonValue('creationTimeUnix')
  creationTimeUnix
}

/// A class representing a batch object request.
///
/// Use this class to send a batch request for creating or updating multiple objects in Weaviate.
@JsonSerializable()
class BatchObjectRequest {
  /// Define which fields need to be returned. Default value is ALL
  final List<Fields> fields;

  /// The list of Weaviate objects to be created or updated.
  final List<WeaviateObject> objects;

  /// Creates a new [BatchObjectRequest] instance.
  ///
  /// The [objects] parameter is required and represents the list of Weaviate objects to be created or updated.
  BatchObjectRequest({
    this.fields = const [Fields.all],
    required this.objects,
  });

  /// Creates a [BatchObjectRequest] instance from a JSON map.
  ///
  /// The [json] parameter is a JSON map representing the batch object request.
  factory BatchObjectRequest.fromJson(JsonObject json) =>
      _$BatchObjectRequestFromJson(json);

  /// Converts the [BatchObjectRequest] instance to a JSON map.
  ///
  /// Returns a JSON map representing the batch object request.
  JsonObject toJson() => _$BatchObjectRequestToJson(this);

  @override
  String toString() => json.encode(toJson());
}
