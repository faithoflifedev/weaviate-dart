import 'dart:convert' show json;

import 'package:json_annotation/json_annotation.dart';

import 'match.dart';

part 'batch_delete_response.g.dart';

/// A class representing a batch delete response.
///
/// Use this class to handle the response received after executing a batch delete operation.
@JsonSerializable()
class BatchDeleteResponse {
  /// The match criteria used in the batch delete operation.
  final Match match;

  /// The output format specified in the batch delete request.
  final String output;

  /// Indicates whether the batch delete operation was executed as a dry run.
  final bool dryRun;

  /// The results of the batch delete operation.
  ///
  /// The results are represented as a map where the keys are strings and the values are dynamic.
  final Map<String, dynamic> results;

  /// Creates a new [BatchDeleteResponse] instance.
  ///
  /// The [match], [output], [dryRun], and [results] parameters are required.
  BatchDeleteResponse({
    required this.match,
    required this.output,
    required this.dryRun,
    required this.results,
  });

  /// Creates a [BatchDeleteResponse] instance from a JSON map.
  factory BatchDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteResponseFromJson(json);

  /// Converts the [BatchDeleteResponse] instance to a JSON map.
  Map<String, dynamic> toJson() => _$BatchDeleteResponseToJson(this);

  @override
  String toString() => json.encode(toJson());
}
