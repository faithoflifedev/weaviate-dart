import 'dart:convert';
import 'dart:io';

import 'package:graphql/client.dart';
import 'package:loggy/loggy.dart';
import 'package:weaviate/weaviate.dart';

void main(List<String> arguments) async {
  final clusterUrl = Platform.environment['CLUSTER_URL'];

  final weaviate = Weaviate(
      weaviateUrl: clusterUrl ?? 'http://localhost:8080',
      logOptions: const LogOptions(
        LogLevel.error,
        stackTraceLevel: LogLevel.off,
      ));

  // delete schema if it exists
  await weaviate.deleteSchema('Question');

  final schema = SchemaClass(
    className: 'Question',
    vectorizer: 'text2vec-huggingface',
    moduleConfig: Text2vecHuggingFace(
      model: 'sentence-transformers/all-MiniLM-L6-v2',
    ).toJson(),
  );

  await weaviate.addSchema(schema);

  // final schemaResponse = await weaviate.getSchema();

  // for (final schemaClass in schemaResponse.classes) {
  //   print(schemaClass);
  // }

  final inputData = json.decode(File('jeopardy_tiny.json').readAsStringSync())
      as List<dynamic>;

  final objects = inputData
      .map((element) => WeaviateObject(
            className: 'Question',
            properties: {
              'category': element['Category'],
              'question': element['Question'],
              'answer': element['Answer'],
            },
          ))
      .toList();

  // final weaviateObjects =
  await weaviate.batchObjects(BatchObjectRequest(objects: objects));

  final QueryOptions options = QueryOptions(document: gql(r'''{
  Get{
    Question (
      limit: 2
      where: {
        path: ["category"],
        operator: Equal,
        valueText: "ANIMALS"
      }
      nearText: {
        concepts: ["biology"],
      }
    ){
      question
      answer
      category
    }
  }
}'''));

  print('querying...');

  final result = await weaviate.getGraphQLClient().query(options);

  print(result.data?['Get']['Question']);
}
