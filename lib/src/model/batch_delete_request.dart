import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'match.dart';

part 'batch_delete_request.g.dart';

/// A class representing a batch delete request.
///
/// Use this class to specify the criteria for deleting multiple items in a batch from a data source.
@JsonSerializable()
class BatchDeleteRequest {
  /// The match criteria for deleting items.
  final Match match;

  /// The desired output format for the delete operation.
  final String output;

  /// Indicates whether it is a dry run, which means the deletion will not be executed but the response will show what would be deleted.
  final bool dryRun;

  /// Creates a new [BatchDeleteRequest] instance.
  ///
  /// The [match], [output], and [dryRun] parameters are required.
  BatchDeleteRequest({
    required this.match,
    required this.output,
    required this.dryRun,
  });

  /// Creates a [BatchDeleteRequest] instance from a JSON map.
  factory BatchDeleteRequest.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteRequestFromJson(json);

  /// Converts the [BatchDeleteRequest] instance to a JSON map.
  Map<String, dynamic> toJson() => _$BatchDeleteRequestToJson(this);

  @override
  String toString() => json.encode(toJson());
}
