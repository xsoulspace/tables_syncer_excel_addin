import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ts_core/src/data_processors/data_indexer.dart';

void main() {
  group('DataIndexer', () {
    test('can getRowKeyBasedIndexes', () {
      final data = [
        ['id', 'name', 'color'],
      ];
      final expectedIndexedMap = {
        'id': 0,
        'name': 1,
        'color': 2,
      };
      final resultIndexedMap = DataIndexer.getRowKeyBasedIndexes(data: data);
      expect(mapEquals(resultIndexedMap, expectedIndexedMap), isTrue);
    });
    test('can getRowKeyBasedIndexes with duplicate ids', () {
      final data = [
        ['id', 'name', 'color', 'name', 'color'],
      ];
      final expectedIndexedMap = {
        'id': 0,
        'name': 3,
        'color': 4,
      };
      final resultIndexedMap = DataIndexer.getRowKeyBasedIndexes(data: data);
      expect(mapEquals(resultIndexedMap, expectedIndexedMap), isTrue);
    });
    test('can getColumnUniqueKeyBasedIndexes', () {
      final data = [
        ['id'],
        ['name'],
        ['color'],
      ];
      final expectedIndexedMap = {
        'id': 0,
        'name': 1,
        'color': 2,
      };
      final resultIndexedMap =
          DataIndexer.getColumnUniqueKeyBasedIndexes(data: data);
      expect(mapEquals(resultIndexedMap, expectedIndexedMap), isTrue);
    });

    test('can getColumnUniqueKeyBasedIndexes duplicate keys', () {
      final data = [
        ['id'],
        ['name'],
        ['color'],
        ['name'],
        ['color'],
      ];
      final expectedIndexedMap = {
        'id': 0,
        'name': 3,
        'color': 4,
      };
      final resultIndexedMap =
          DataIndexer.getColumnUniqueKeyBasedIndexes(data: data);
      expect(mapEquals(resultIndexedMap, expectedIndexedMap), isTrue);
    });

    test('can getColumnKeyBasedIndexes', () {
      final data = [
        ['id'],
        ['name'],
        ['color'],
      ];
      final expectedIndexedMap = {
        'id': [0],
        'name': [1],
        'color': [2],
      };
      final resultIndexedMap = DataIndexer.getColumnKeyBasedIndexes(data: data);
      expect(resultIndexedMap, equals(expectedIndexedMap));
    });

    test('can getColumnKeyBasedIndexes duplicate keys', () {
      final data = [
        ['id'],
        ['name'],
        ['color'],
        ['name'],
        ['color'],
      ];
      final expectedIndexedMap = {
        'id': [0],
        'name': [1, 3],
        'color': [2, 4],
      };
      final resultIndexedMap = DataIndexer.getColumnKeyBasedIndexes(data: data);
      expect(resultIndexedMap, equals(expectedIndexedMap));
    });
  });
}
