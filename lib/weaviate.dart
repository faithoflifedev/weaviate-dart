/// The Weaviate library.
///
/// This library provides access to the Weaviate client and various model classes used for interacting with the Weaviate server.
library weaviate;

// Export the Weaviate base class
export 'src/weaviate_base.dart';

// Export the model classes
export 'src/model/batch_delete_request.dart';
export 'src/model/batch_delete_response.dart';
export 'src/model/batch_object_request.dart';
export 'src/model/match.dart';
export 'src/model/meta_response.dart';
export 'src/model/object_response.dart';
export 'src/model/properties.dart';
export 'src/model/reference.dart';
export 'src/model/schema_class.dart';
export 'src/model/schema_response.dart';
export 'src/model/text2vec_contextionary.dart';
export 'src/model/text2vec_huggingface.dart';
export 'src/model/weaviate_object.dart';

// Export the provider class
export 'src/provider/weaviate.dart';

// Export the utility classes
export 'src/util/logging_interceptors.dart';
