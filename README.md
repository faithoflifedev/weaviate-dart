# Weaviate Dart Wrapper

[![Pub Package](https://img.shields.io/pub/v/weaviate.svg)](https://pub.dev/packages/weaviate)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/faithoflifedev/weaviate-dart/blob/main/LICENSE)

A Dart wrapper for the Weaviate REST API, allowing you to easily integrate Weaviate into your Dart projects.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

[![Build Status](https://github.com/faithoflifedev/weaviate-dart/workflows/Dart/badge.svg)](https://github.com/faithoflifedev/weaviate-dart/actions) [![github last commit](https://shields.io/github/last-commit/faithoflifedev/weaviate-dart)](https://shields.io/github/last-commit/faithoflifedev/weaviate-dart) [![github build](https://img.shields.io/github/actions/workflow/status/faithoflifedev/weaviate-dart/dart.yml?branch=main)](https://shields.io/github/workflow/status/faithoflifedev/weaviate-dart/Dart) [![github issues](https://shields.io/github/issues/faithoflifedev/weaviate-dart)](https://shields.io/github/issues/faithoflifedev/weaviate-dart)

[![Buy me a coffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-1.svg)](https://www.buymeacoffee.com/faithoflif2)

## Installation

Add `weaviate` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  ...
  weaviate: ^0.0.1-dev.1
```

Then run `flutter pub get` to fetch the package.

## Usage

Import the package in your Dart file:

```dart
import 'package:weaviate/weaviate.dart';
```

Create a new instance of the Weaviate client:

```dart
  final weaviate = Weaviate(
      weaviateUrl: '[your cloud instance or other host]',
      ));
```

Now you can use the client to interact with the Weaviate API.

## Examples

Here are a few examples demonstrating the usage of the Weaviate Dart wrapper:

### Creating an object

```dart
import 'package:weaviate/weaviate.dart';

void main() async {
  final weaviate = WeaviateClient('[your cloud instance or other host]');

  // delete schema if it exists
  await weaviate.deleteSchema('Question');
  
  // define the schema for for your objects
  final schema = SchemaClass(
    className: 'Question',
    vectorizer: 'text2vec-huggingface',
    moduleConfig: Text2vecHuggingFace(
      model: 'sentence-transformers/all-MiniLM-L6-v2',
    ).toJson(),
  );

  // add the schema to your weaviate instance
  await weaviate.addSchema(schema);
    
  try {
    // use a json file as input documents
    final inputData = json.decode(File('jeopardy_tiny.json').readAsStringSync())
      as List<dynamic>;

    // create the objects that will be uploaded
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

    // upload the docs into your instance as a batch
    await weaviate.batchObjects(BatchObjectRequest(objects: objects));
    
    print('Object created successfully!');
  } catch (e) {
    print('Error creating object: $e');
  }
}
```

### Querying objects

```dart
import 'package:graphql/client.dart';
import 'package:weaviate/weaviate.dart';

void main() async {
  final weaviate = WeaviateClient('[your cloud instance or other host]');
  
  try {
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
  } catch (e) {
    print('Error querying objects: $e');
  }
}
```

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please create an issue on the [GitHub repository](https://github.com/faithoflifedev/weaviate-dart).

To contribute code, please fork the repository and create a pull request with your changes.

## License

This project is licensed under the [MIT License](https://github.com/faithoflifedev/weaviate-dart/blob/main/LICENSE).