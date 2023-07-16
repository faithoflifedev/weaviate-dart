import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:weaviate/weaviate.dart';

part 'weaviate.g.dart';

/// An abstract class representing the Weaviate client API.
///
/// Use this class to interact with the Weaviate server and perform various operations such as managing objects, schema, and metadata.
@RestApi()
abstract class WeaviateClient {
  /// Creates an instance of [WeaviateClient].
  ///
  /// The [dio] parameter is the instance of the Dio HTTP client used for making requests to the Weaviate server.
  /// The [baseUrl] parameter is an optional parameter representing the base URL of the Weaviate server.
  factory WeaviateClient(Dio dio, {String baseUrl}) = _WeaviateClient;

  /// Performs a batch operation to create multiple Weaviate objects.
  ///
  /// The [batchObjectRequest] parameter is the batch request object containing the Weaviate objects to be created.
  /// The [consistencyLevel] parameter is an optional parameter representing the consistency level for the operation.
  @POST('/v1/batch/objects')
  Future<List<WeaviateObject>> batchObjects(
    @Body() BatchObjectRequest batchObjectRequest, {
    @Query('consistency_level') String? consistencyLevel,
  });

  /// Performs a batch operation to delete multiple Weaviate objects.
  ///
  /// The [batchDeleteRequest] parameter is the batch request object containing the match criteria for deleting the objects.
  /// The [consistencyLevel] parameter is an optional parameter representing the consistency level for the operation.
  @DELETE('/v1/batch/objects')
  Future<BatchDeleteResponse> batchDeleteObjects(
    @Body() BatchDeleteRequest batchDeleteRequest, {
    @Query('consistency_level') String? consistencyLevel,
  });

  /// Performs a batch operation to create multiple references between Weaviate objects.
  ///
  /// The [objects] parameter is a list of reference objects representing the references to be created.
  /// The [consistencyLevel] parameter is an optional parameter representing the consistency level for the operation.
  @POST('/v1/batch/references')
  Future<void> batchReferences(
    @Body() List<Reference> objects, {
    @Query('consistency_level') String? consistencyLevel,
  });

  /// Retrieves a list of Weaviate objects.
  ///
  /// The [after] parameter is an optional parameter representing the UUID of the object after which the list should be retrieved.
  /// The [classNames] parameter is an optional parameter representing the class name(s) of the objects to retrieve.
  /// The [include] parameter is an optional parameter representing the fields to include in the response.
  /// The [limit] parameter is an optional parameter representing the maximum number of objects to retrieve.
  /// The [offset] parameter is an optional parameter representing the offset for pagination.
  /// The [order] parameter is an optional parameter representing the order of the objects in the response.
  /// The [sort] parameter is an optional parameter representing the sorting criteria for the objects.
  @GET('/v1/objects')
  Future<ObjectResponse> getObjects({
    @Query('after') String? after,
    @Query('class') String? classNames,
    @Query('include') String? include,
    @Query('limit') int? limit,
    @Query('offset') int? offset,
    @Query('order') String? order,
    @Query('sort') String? sort,
  });

  /// Retrieves the metadata information from the Weaviate server.
  @GET('/v1/meta')
  Future<MetaResponse> getMeta();

  /// Retrieves the schema information from the Weaviate server.
  @GET('/v1/schema')
  Future<SchemaResponse> getSchema();

  /// Adds a new schema class to the Weaviate server.
  ///
  /// The [schemaClass] parameter is the schema class to be added.
  @POST('/v1/schema')
  Future<SchemaClass> addSchema(
    @Body() SchemaClass schemaClass,
  );

  /// Deletes a schema class from the Weaviate server.
  ///
  /// The [className] parameter is the name of the schema class to be deleted.
  @DELETE('/v1/schema/{class_name}')
  Future<void> deleteSchema(
    @Path('class_name') String className,
  );

  /// Retrieves the OpenID configuration information from the Weaviate server.
  @GET('/v1/.well-known/openid-configuration')
  Future<Map<String, String>> getOpenIdConfiguration();

  /// Checks the liveness status of the Weaviate server.
  @GET('/v1/.well-known/live')
  Future<bool> getLive();

  /// Checks the readiness status of the Weaviate server.
  @GET('/v1/.well-known/ready')
  Future<bool> getReady();
}
