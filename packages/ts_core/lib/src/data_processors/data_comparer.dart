import 'package:flutter/material.dart';

import '../models/models.dart';
import 'data_indexer.dart';

@immutable
class DataComparer {
  const DataComparer._();
  static IndexedKeysChangesModel compareKeys({
    required final UnquieIndexedKeysMap indexedKeys,
    required final IndexedKeysMap secondaryIndexedKeys,
  }) {
    final IndexedKeysWithOriginMap newIndexedKeys = {};
    final IndexedKeysWithOriginMap updatableIndexedKeys = {};

    for (final entry in indexedKeys.entries) {
      final key = entry.key;
      final originRowIndex = entry.value;
      if (secondaryIndexedKeys.containsKey(key)) {
        final rowIndexes = secondaryIndexedKeys[key]!;
        updatableIndexedKeys[key] = IndexedValueModel(
          originRowIndex: originRowIndex,
          rowIndexes: rowIndexes,
        );
      } else {
        newIndexedKeys[key] = IndexedValueModel(
          originRowIndex: originRowIndex,
          rowIndexes: const [],
        );
      }
    }

    return IndexedKeysChangesModel(
      newValues: newIndexedKeys,
      updatableValues: updatableIndexedKeys,
    );
  }
}
