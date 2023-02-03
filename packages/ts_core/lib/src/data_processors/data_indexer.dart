import 'package:flutter/material.dart';

import '../models/models.dart';
import '../utils/utils.dart';

typedef UnquieIndexedKeysMap = Map<String, int>;
typedef IndexedKeysMap = Map<String, List<int>>;
typedef IndexedKeysWithOriginMap = Map<String, IndexedValueModel>;

@immutable
class DataIndexer {
  const DataIndexer._();
  static UnquieIndexedKeysMap getRowKeyBasedIndexes({
    required final ExcelTableStringData data,
    final int rowIndex = 0,
  }) {
    final row = data[rowIndex];
    final mapEntries =
        row.mapIndexed((final index, final item) => MapEntry(item, index));
    return Map<String, int>.fromEntries(mapEntries);
  }

  /// all unique keys row indexes will be merged
  static UnquieIndexedKeysMap getColumnUniqueKeyBasedIndexes({
    required final ExcelTableStringData data,
    final int columnIndex = 0,
  }) {
    final mapEntries = data.mapIndexed(
      (final index, final item) {
        final value = item[columnIndex];
        return MapEntry(value, index);
      },
    );
    return Map<String, int>.fromEntries(mapEntries);
  }

  /// all unique keys indexes will be collapsed to List
  static IndexedKeysMap getColumnKeyBasedIndexes({
    required final ExcelTableStringData data,
    final int columnIndex = 0,
  }) {
    final map = <String, List<int>>{};
    for (var rowIndex = 0; rowIndex < data.length; rowIndex++) {
      final row = data[rowIndex];
      final value = row[columnIndex];
      map.update(
        value,
        (final indexes) => indexes..add(rowIndex),
        ifAbsent: () => [rowIndex],
      );
    }
    return map;
  }
}
