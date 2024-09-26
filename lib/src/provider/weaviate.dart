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

  /// Get links to other endpoints to help discover the REST API
  @GET('/v1/')
  Future<EndPoints> list();

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

  /// Fetch an array of all collection definitions from the schema.
  @GET('/v1/schema')
  Future<SchemaResponse> getSchemas(
    @Query('consistency') bool? consistency,
  );

  /// Create a new data object collection.
  ///
  /// If [AutoSchema](https://weaviate.io/developers/weaviate/config-refs/schema#auto-schema) is enabled, Weaviate will attempt to infer the schema from the data at import time. However, manual schema definition is recommended for production environments.
  ///
  /// For further discussions of parameters, please see the [schema reference](https://weaviate.io/developers/weaviate/config-refs/schema) page.
  @POST('/v1/schema')
  Future<SchemaClass> addSchema(
    @Body() SchemaClass schemaClass,
  );

  /// Get a single collection schema.
  @GET('/v1/schema/{class_name}')
  Future<SchemaClass> getSchema(
    @Path('class_name') String className,
  );

  /// Deletes a schema class from the Weaviate server.
  ///
  /// The [className] parameter is the name of the schema class to be deleted.
  @DELETE('/v1/schema/{class_name}')
  Future<void> deleteSchema(
    @Path('class_name') String className,
  );

  /// Alter an existing collection definition.
  ///
  /// Note that not all settings are mutable [(see this list)](https://weaviate.io/developers/weaviate/config-refs/schema#mutability). To update any other (i.e. immutable) setting, you need to delete the collection, re-create it with the correct setting and then re-import the data.
  ///
  /// This endpoint cannot be used to modify properties. Instead use POST /v1/schema/{className}/properties. A typical use case for this endpoint is to update a index configuration, such as `vectorIndexConfig/dynamicEfFactor`.
  ///
  /// You should attach a body to this PUT request with the entire new configuration of the collection.
  @PUT('/v1/schema/{class_name}')
  Future<SchemaClass> updateSchema({
    @Path('class_name') required String className,
    @Body() required SchemaClass schemaClass,
  });

  /// Add a property to an existing collection.
  ///
  /// If possible, we encourage you to create all required properties at collection creation time. Adding a property after collection creation can lead to [some indexing limitations](https://weaviate.io/developers/weaviate/config-refs/schema).
  @POST('/v1/schema/{class_name}/properties')
  Future<SchemaClass> addPropertyToSchema({
    @Path('class_name') required String className,
    @Body() required Property property,
  });

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
