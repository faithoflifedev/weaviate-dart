import 'package:dio/dio.dart';
import 'package:graphql/client.dart';
import 'package:loggy/loggy.dart';
import 'package:universal_io/io.dart';
import 'package:weaviate/weaviate.dart';

/// A class representing the Weaviate client with logging capabilities.
///
/// Use this class to interact with the Weaviate server and perform various operations, while logging important events and errors.
class Weaviate with UiLoggy {
  /// The accept header value for JSON.
  static final accept = 'application/json';

  /// The content type header value for JSON with UTF-8 encoding.
  static final contentType = 'application/json; charset=UTF-8';

  /// The URL of the Weaviate server.
  final String weaviateUrl;

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
  }) {
    final weaviateApiKey = Platform.environment['WEAVIATE_API_KEY'];

    if (weaviateApiKey == null) {
      loggy.debug(
        'You need to set your Weaviate API key in the WEAVIATE_API_KEY environment variable.',
      );
      exit(1);
    }

    final openaiApiKey = Platform.environment['OPENAI_API_KEY'];

    // if (openaiApiKey == null) {
    //   loggy.debug(
    //     'You need to set your OpenAI key in the OPENAI_API_KEY environment variable.',
    //   );
    //   exit(1);
    // }

    final huggingFaceApiKey = Platform.environment['HUGGINGFACE_API_KEY'];

    // if (huggingFaceApiKey == null) {
    //   loggy.debug(
    //     'You need to set your HuggingFace API key in the HUGGINGFACE_API_KEY environment variable.',
    //   );
    //   exit(1);
    // }

    Loggy.initLoggy(logPrinter: printer, logOptions: logOptions);

    final dio = Dio(
      BaseOptions(
        baseUrl: weaviateUrl,
        headers: {
          'Authorization': 'Bearer $weaviateApiKey',
          'X-OpenAI-Api-Key': openaiApiKey ?? '',
          'X-HuggingFace-Api-Key': huggingFaceApiKey ?? '',
          'Accept': accept,
          'Content-Type': contentType,
        },
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

  /// Retrieves the GraphQL client for interacting with the Weaviate server using GraphQL.
  GraphQLClient getGraphQLClient() {
    final weaviateApiKey = Platform.environment['WEAVIATE_API_KEY'];

    if (weaviateApiKey == null) {
      loggy.debug(
        'You need to set your Weaviate API key in the WEAVIATE_API_KEY environment variable.',
      );
      exit(1);
    }

    final huggingFaceApiKey = Platform.environment['HUGGINGFACE_API_KEY'];

    // if (huggingFaceApiKey == null) {
    //   loggy.debug(
    //     'You need to set your HuggingFace API key in the HUGGINGFACE_API_KEY environment variable.',
    //   );
    //   exit(1);
    // }

    final Link link = HttpLink(
      '$weaviateUrl/v1/graphql',
      defaultHeaders: {
        'Content-Type': accept,
        'Authorization': 'Bearer $weaviateApiKey',
        'X-HuggingFace-Api-Key': huggingFaceApiKey ?? '',
      },
    );

    return GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
  }

  /// Retrieves the metadata information from the Weaviate server.
  Future<MetaResponse> getMeta() async => rest.getMeta();

  /// Performs a batch operation to create multiple Weaviate objects.
  ///
  /// The [batchObjectRequest] parameter is the batch request object containing the Weaviate objects to be created.
  Future<List<WeaviateObject>> batchObjects(
    BatchObjectRequest batchObjectRequest,
  ) async =>
      rest.batchObjects(batchObjectRequest);

  /// Adds a new schema class to the Weaviate server.
  ///
  /// The [schemaClass] parameter is the schema class to be added.
  Future<SchemaClass> addSchema(SchemaClass schemaClass) async =>
      rest.addSchema(schemaClass);

  /// Retrieves the schema information from the Weaviate server.
  Future<SchemaResponse> getSchema() async => rest.getSchema();

  /// Deletes a schema class from the Weaviate server.
  ///
  /// The [className] parameter is the name of the schema class to be deleted.
  Future<void> deleteSchema(String className) async =>
      rest.deleteSchema(className);
}
