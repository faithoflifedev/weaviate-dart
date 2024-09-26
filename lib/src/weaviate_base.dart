import 'package:dio/dio.dart';
import 'package:graphql/client.dart';
import 'package:loggy/loggy.dart';
import 'package:weaviate/weaviate.dart' hide Link;
import 'package:weaviate/weaviate.dart' as w show Link;

final missingEnvironmentVariable =
    'You need to set your Weaviate API key in the WEAVIATE_API_KEY environment variable.';

/// A class representing the Weaviate client with logging capabilities.
///
/// The [weaviateUrl] parameter is the URL of the Weaviate server.
/// The [logOptions] parameter is an optional parameter representing the log options.
/// The [printer] parameter is an optional parameter representing the log printer to use.
///
///
/// Use this class to interact with the Weaviate server and perform various operations, while logging important events and errors.
class Weaviate with UiLoggy {
  /// The accept header value for JSON.
  static final accept = 'application/json';

  /// The content type header value for JSON with UTF-8 encoding.
  static final contentType = 'application/json; charset=UTF-8';

  /// The URL of the Weaviate server.
  final String weaviateUrl;

  /// The headers to be used in the HTTP requests.
  final Map<String, String>? headers;

  /// The REST client used for making HTTP requests to the Weaviate server.
  late final WeaviateClient rest;

  /// Creates a new instance of [Weaviate].
  ///
  /// The [weaviateUrl] parameter is the URL of the Weaviate server.
  /// The [logOptions] parameter is an optional parameter representing the log options.
  /// The [printer] parameter is an optional parameter representing the log printer to use.
  Weaviate({
    required this.weaviateUrl,
    LogOptions logOptions = const LogOptions(
      LogLevel.error,
      stackTraceLevel: LogLevel.off,
    ),
    LoggyPrinter printer = const PrettyPrinter(showColors: false),
    this.headers,
  }) {
    final weaviateApiKey = getApiKey('WEAVIATE_API_KEY');

    if (weaviateApiKey == '') {
      loggy.debug(
        missingEnvironmentVariable,
      );

      throw Exception(
        missingEnvironmentVariable,
      );
    }

    final openaiApiKey = getApiKey('OPENAI_API_KEY');

    final huggingFaceApiKey = getApiKey('HUGGINGFACE_API_KEY');

    final cohereApiKey = getApiKey('COHERE_API_KEY');

    Loggy.initLoggy(
      logPrinter: printer,
      logOptions: logOptions,
    );

    final dio = Dio(
      BaseOptions(
        baseUrl: weaviateUrl,
        headers: {
          'Authorization': 'Bearer $weaviateApiKey',
          'X-OpenAI-Api-Key': openaiApiKey,
          'X-HuggingFace-Api-Key': huggingFaceApiKey,
          'X-Cohere-Api-Key': cohereApiKey,
          'Accept': accept,
          'Content-Type': contentType,
        }..addAll(headers ?? {}),
      ),
    );

    dio.interceptors.add(LoggingInterceptors());

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Authorization'] = 'Bearer $weaviateApiKey';
          return handler.next(options);
        },
      ),
    );

    rest = WeaviateClient(dio);
  }

  Future<List<w.Link>> list() async {
    final endPoints = await rest.list();

    return endPoints.links;
  }

  /// The [getGraphQLClient] method can be used to retrieve the GraphQL client for interacting with the Weaviate server using GraphQL.
  /// @example
  /// ```dart
  ///
  /// final weaviate = Weaviate(
  ///  weaviateUrl: 'http://localhost:8080',
  /// );
  ///
  /// final client = weaviate.getGraphQLClient();
  /// ```
  GraphQLClient getGraphQLClient() {
    final weaviateApiKey = getApiKey('WEAVIATE_API_KEY');

    if (weaviateApiKey == '') {
      loggy.debug(
        missingEnvironmentVariable,
      );

      throw Exception(
        missingEnvironmentVariable,
      );
    }

    final openaiApiKey = getApiKey('OPENAI_API_KEY');

    final huggingFaceApiKey = getApiKey('HUGGINGFACE_API_KEY');

    final cohereApiKey = getApiKey('COHERE_API_KEY');

    final Link link = HttpLink(
      '$weaviateUrl/v1/graphql',
      defaultHeaders: {
        'Content-Type': accept,
        'Authorization': 'Bearer $weaviateApiKey',
        'X-OpenAI-Api-Key': openaiApiKey,
        'X-HuggingFace-Api-Key': huggingFaceApiKey,
        'X-Cohere-Api-Key': cohereApiKey,
      },
    );

    return GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
  }

  /// Retrieves the metadata information from the Weaviate server.
  Future<MetaResponse> getMeta() => rest.getMeta();

  /// Performs a batch operation to create multiple Weaviate objects.
  ///
  /// The [batchObjectRequest] parameter is the batch request object containing the Weaviate objects to be created.
  Future<List<WeaviateObject>> batchObjects(
          BatchObjectRequest batchObjectRequest) =>
      rest.batchObjects(batchObjectRequest);

  /// Adds a new schema class to the Weaviate server.
  ///
  /// The [schemaClass] parameter is the schema class to be added.
  Future<SchemaClass> addSchema(SchemaClass schemaClass) =>
      rest.addSchema(schemaClass);

  /// Retrieves the schema information from the Weaviate server.
  Future<SchemaResponse> getSchemas(bool? consistency) =>
      rest.getSchemas(consistency);

  /// Retrieves the schema information from the Weaviate server.
  Future<SchemaClass> getSchema(String className) => rest.getSchema(className);

  /// Deletes a schema class from the Weaviate server.
  ///
  /// The [className] parameter is the name of the schema class to be deleted.
  Future<void> deleteSchema(String className) => rest.deleteSchema(className);

  /// Alter an existing collection definition.
  ///
  /// Note that not all settings are mutable [(see this list)](https://weaviate.io/developers/weaviate/config-refs/schema#mutability). To update any other (i.e. immutable) setting, you need to delete the collection, re-create it with the correct setting and then re-import the data.
  ///
  /// This endpoint cannot be used to modify properties. Instead use POST /v1/schema/{className}/properties. A typical use case for this endpoint is to update a index configuration, such as `vectorIndexConfig/dynamicEfFactor`.
  ///
  /// You should attach a body to this PUT request with the entire new configuration of the collection.
  Future<SchemaClass> updateSchema(SchemaClass schemaClass) =>
      rest.updateSchema(
        className: schemaClass.className,
        schemaClass: schemaClass,
      );

  /// Add a property to an existing collection.
  ///
  /// If possible, we encourage you to create all required properties at collection creation time. Adding a property after collection creation can lead to [some indexing limitations](https://weaviate.io/developers/weaviate/config-refs/schema).
  Future<SchemaClass> addPropertyToSchema({
    required String className,
    required Property property,
  }) =>
      rest.addPropertyToSchema(
        className: className,
        property: property,
      );
}
