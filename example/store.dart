import 'dart:convert';
import 'dart:io';

import 'package:loggy/loggy.dart';
import 'package:weaviate/weaviate.dart';

void main(List<String> arguments) async {
  final clusterUrl = Platform.environment['CLUSTER_URL'];

  // The sample cluster on weaviate.cloud will expire in 14 days
  final weaviate = Weaviate(
      weaviateUrl: clusterUrl ?? 'http://localhost:8080',
      logOptions: const LogOptions(
        LogLevel.all,
        stackTraceLevel: LogLevel.off,
      ));

  // delete schema if it exists
  await weaviate.deleteSchema('Question');

  final schema = SchemaClass(
    className: 'Question',
    vectorizer: 'text2vec-huggingface',

    moduleConfig: {
      'text2vec-huggingface': {
        'model': 'sentence-transformers/all-MiniLM-L6-v2',
      }
    },

    properties: [
      Properties(
        name: 'category',
        dataType: ['string'],
      ),
      Properties(
        name: 'question',
        dataType: ['string'],
      ),
      Properties(
        name: 'answer',
        dataType: ['string'],
      ),
    ],

    // moduleConfig: Text2vecHuggingFace(
    //   model: 'sentence-transformers/all-MiniLM-L6-v2',
    // ).toJson(),
  );

  await weaviate.addSchema(schema);

  // final schemaClass = await weaviate.getSchema('Question');

  // print(schemaClass);

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
}
