import 'package:flutter/foundation.dart';
import 'package:office_addin_helper/office_addin_helper.dart';

import 'data_comparer.dart';
import 'data_indexer.dart';

@immutable
class ColumnDataProcessor {
  const ColumnDataProcessor._({
    required this.newSecondaryIndexedKeys,
    required this.updatableSecondaryIndexedKeys,
    required this.indexedKeys,
  });

  factory ColumnDataProcessor.fromIndexedKeys({
    required final UnquieIndexedKeysMap columnIndexedKeys,
    required final IndexedKeysMap secondaryColumnIndexedKeys,
  }) {
    final comparationResult = DataComparer.compareKeys(
      indexedKeys: columnIndexedKeys,
      secondaryIndexedKeys: secondaryColumnIndexedKeys,
    );

    return ColumnDataProcessor._(
      indexedKeys: columnIndexedKeys,
      newSecondaryIndexedKeys: comparationResult.newValues,
      updatableSecondaryIndexedKeys: comparationResult.updatableValues,
    );
  }
  factory ColumnDataProcessor.fromKeys({
    required final ExcelTableStringData columnValues,
    required final ExcelTableStringData secondaryColumnValues,
  }) {
    final columnIndexedKeys =
        DataIndexer.getColumnUniqueKeyBasedIndexes(data: columnValues);
    final secondaryColumnIndexedKeys =
        DataIndexer.getColumnKeyBasedIndexes(data: secondaryColumnValues);

    return ColumnDataProcessor.fromIndexedKeys(
      columnIndexedKeys: columnIndexedKeys,
      secondaryColumnIndexedKeys: secondaryColumnIndexedKeys,
    );
  }

  final UnquieIndexedKeysMap indexedKeys;
  final IndexedKeysWithOriginMap newSecondaryIndexedKeys;
  final IndexedKeysWithOriginMap updatableSecondaryIndexedKeys;

  ExcelTableData updateColumnData({
    required final bool shouldUpdateValues,
    required final bool shouldInsertNewValues,
    required final bool shouldClearAllValuesBefore,
    required final ExcelTableData columnValues,
    required final ExcelTableData secondaryColumnValues,
    final int columnIndex = 0,
    final int secondaryColumnIndex = 0,
  }) {
    ExcelTableData resultData;
    if (shouldClearAllValuesBefore) {
      resultData =
          List.generate(secondaryColumnValues.length, (final index) => ['']);
    } else {
      resultData = List.from(secondaryColumnValues);
    }

    if (shouldInsertNewValues) {
      for (final indexedValue in newSecondaryIndexedKeys.values) {
        final originValue =
            columnValues[indexedValue.originRowIndex][columnIndex];
        resultData.add([originValue]);
      }
    }

    if (shouldUpdateValues) {
      for (final indexedValue in updatableSecondaryIndexedKeys.values) {
        for (final resultRowIndex in indexedValue.rowIndexes) {
          final originValue =
              columnValues[indexedValue.originRowIndex][columnIndex];
          resultData[resultRowIndex] = [originValue];
        }
      }
    }
    print({
      'shouldClearAllValuesBefore': shouldClearAllValuesBefore,
      'resultData': resultData,
    });
    return resultData;
  }
}
