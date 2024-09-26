import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:weaviate/weaviate.dart';

void main() {
  test('schema_class', () {
    final data = File('test/asset/schema_class.json').readAsStringSync();

    final schemaClass = SchemaClass.fromJson(json.decode(data));

    expect(schemaClass, isNotNull);
  });

  test('endpoint_list', () {
    final data = File('test/asset/endpoint_list.json').readAsStringSync();

    final endPointList = EndPoints.fromJson(json.decode(data));

    expect(endPointList.links.length, 8);
  });
}
