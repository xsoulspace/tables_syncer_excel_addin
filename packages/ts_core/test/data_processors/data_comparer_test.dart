import 'package:flutter_test/flutter_test.dart';
import 'package:ts_core/src/data_processors/data_comparer.dart';
import 'package:ts_core/src/data_processors/data_indexer.dart';
import 'package:ts_core/src/models/models.dart';

void main() {
  group('DataComparer', () {
    final UnquieIndexedKeysMap indexedKeys = {
      'red1': 0,
      'red2': 1,
      'red3': 2,
    };
    final IndexedKeysMap secondaryIndexedKeys = {
      'red5': [0],
      'red2': [1],
      'red1': [2],
    };
    test('can compareKeys', () {
      final IndexedKeysWithOriginMap expectedNewIndexedMap = {
        'red3': const IndexedValueModel(
          originRowIndex: 2,
          rowIndexes: [],
        ),
      };
      final IndexedKeysWithOriginMap expectedUpdatableIndexedMap = {
        'red2': const IndexedValueModel(
          originRowIndex: 1,
          rowIndexes: [1],
        ),
        'red1': const IndexedValueModel(
          originRowIndex: 0,
          rowIndexes: [2],
        ),
      };
      final result = DataComparer.compareKeys(
        indexedKeys: indexedKeys,
        secondaryIndexedKeys: secondaryIndexedKeys,
      );
      expect(result.newValues, equals(expectedNewIndexedMap));
      expect(result.updatableValues, equals(expectedUpdatableIndexedMap));
    });
  });
}
