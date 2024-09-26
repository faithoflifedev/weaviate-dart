# Weaviate Dart Wrapper

[![Pub Package](https://img.shields.io/pub/v/weaviate.svg)](https://pub.dev/packages/weaviate)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/faithoflifedev/weaviate-dart/blob/main/LICENSE)

A Dart wrapper for the Weaviate REST API, allowing you to easily integrate Weaviate into your Dart projects.

## Table of Contents

- [Installation](#installation)
- [API Keys](#api-keys)
  - [Environment Variables](#environment-variables)
  - [Custom Headers](#custom-headers)
- [Usage](#usage)
- [Examples](#examples)
  - [Creating an object](#creating-an-object)
  - [Querying objects](#querying-objects)
- [Contributing](#contributing)
- [License](#license)

[![Build Status](https://github.com/faithoflifedev/weaviate-dart/workflows/Dart/badge.svg)](https://github.com/faithoflifedev/weaviate-dart/actions) [![github last commit](https://shields.io/github/last-commit/faithoflifedev/weaviate-dart)](https://shields.io/github/last-commit/faithoflifedev/weaviate-dart) [![github build](https://img.shields.io/github/actions/workflow/status/faithoflifedev/weaviate-dart/dart.yml?branch=main)](https://shields.io/github/workflow/status/faithoflifedev/weaviate-dart/Dart) [![github issues](https://shields.io/github/issues/faithoflifedev/weaviate-dart)](https://shields.io/github/issues/faithoflifedev/weaviate-dart)

[![Buy me a coffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-1.svg)](https://www.buymeacoffee.com/faithoflif2)

## Installation

Add `weaviate` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  ...
  weaviate: ^{{ pubspec.version }}
```

Then run `flutter pub get` to fetch the package.

## API Keys

Additional information on this topic is available in the Weaviate documentation for [Third party API keys]([COHERE_API_KEY](https://weaviate.io/developers/weaviate/connections/connect-cloud#third-party-api-keys))

If you use API-based models for vectorization or RAG, you must provide an API key for the service. To add third party API keys there are two options available, these are environment variables and custom headers.

### Environment Variables

Currently this package supports the following API keys set as environment variables:
- WEAVIATE_API_KEY
- OPENAI_API_KEY
- HUGGINGFACE_API_KEY
- COHERE_API_KEY

Any other API key must be set as outlined in the **Custom Headers** section below.

**bash/zsh**
```sh
export WEAVIATE_API_KEY="YOUR_WEAVIATE_KEY"
export OPENAI_API_KEY="YOUR_OPENAPI_KEY"
export HUGGINGFACE_API_KEY="YOUR_HUGGINGFACE_KEY"
export COHERE_API_KEY="YOUR_COHERE_KEY"
```

**windows powershell**
```sh
$Env:WEAVIATE_API_KEY="YOUR_WEAVIATE_KEY"
$Env:OPENAI_API_KEY="YOUR_OPENAPI_KEY"
$Env:HUGGINGFACE_API_KEY="YOUR_HUGGINGFACE_KEY"
$Env:COHERE_API_KEY="YOUR_COHERE_KEY"
```

**windows command prompt**
```sh
set WEAVIATE_API_KEY="YOUR_WEAVIATE_KEY"
set OPENAI_API_KEY="YOUR_OPENAPI_KEY"
set HUGGINGFACE_API_KEY="YOUR_HUGGINGFACE_KEY"
set COHERE_API_KEY="YOUR_COHERE_KEY"
```

### Custom Headers

As an alternative to environment variables, API keys can also be added directly as custom headers as shown below.  This method is useful in the case that a given API key is not yet supported by this package.  Using environment variables is preferred since these are more secure and less likely to get accidentally committed to GitHub.

```dart
final weaviate = Weaviate(
    weaviateUrl: clusterUrl ?? 'http://localhost:8080',
    headers: {
      'Authorization': 'Bearer YOUR_WEAVIATE_KEY'
      'X-OpenAI-Api-Key': 'YOUR_OPENAPI_KEY',
      'X-HuggingFace-Api-Key': 'YOUR_HUGGINGFACE_API_KEY',
      'X-Cohere-Api-Key': 'YOUR_COHERE_API_KEY',
    },
```

## Usage

Import the package in your Dart file:

```dart
import 'package:weaviate/weaviate.dart';
```

Create a new instance of the Weaviate client:

```dart
  final weaviate = Weaviate(
      weaviateUrl: '[your cloud instance or other host]',
      // add headers if api keys have not been set in environment vars
      ));
```

Now you can use the client to interact with the Weaviate API.

## Examples

The following example demonstrates the usage of the Weaviate Dart wrapper:

### Creating an object

```dart
import 'package:weaviate/weaviate.dart';

void main() async {
  final weaviate = WeaviateClient(
    '[your cloud instance or other host]',
   );

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
    // use a json file as input document
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