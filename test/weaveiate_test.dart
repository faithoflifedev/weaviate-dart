import 'dart:convert';

import 'package:test/test.dart';
import 'package:universal_io/io.dart';
import 'package:weaviate/weaviate.dart';

void main() {
  test('schema_class', () {
    final data = File('test/asset/schema_class.json').readAsStringSync();

    final schemaClass = SchemaClass.fromJson(json.decode(data));

    expect(schemaClass, isNotNull);
  });
}
