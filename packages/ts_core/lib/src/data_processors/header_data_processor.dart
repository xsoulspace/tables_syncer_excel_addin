import 'package:flutter/material.dart';

import '../models/models.dart';
import 'data_indexer.dart';

@immutable
class HeaderDataProcessor {
  const HeaderDataProcessor._({
    required this.headers,
    required this.secondaryHeaders,
  });

  factory HeaderDataProcessor.loadWithIndexedHeaders({
    required final TableHeadersModel headers,
    required final TableHeadersModel secondaryHeaders,
  }) =>
      HeaderDataProcessor.load(
        headers: headers,
        secondaryHeaders: secondaryHeaders,
        shouldUpdateHeadersIndexes: false,
      );

  factory HeaderDataProcessor.load({
    required final TableHeadersModel headers,
    required final TableHeadersModel secondaryHeaders,
    final bool shouldUpdateHeadersIndexes = true,
  }) {
    final updatedHeaders = () {
      if (shouldUpdateHeadersIndexes) {
        final headersIndexes =
            DataIndexer.getRowKeyBasedIndexes(data: headers.data);
        return headers.copyWith(
          indexesMap: headersIndexes,
        );
      } else {
        return headers;
      }
    }();
    final updatedSecondaryHeadersIndexes = () {
      if (shouldUpdateHeadersIndexes) {
        final secondaryHeadersIndexes =
            DataIndexer.getRowKeyBasedIndexes(data: secondaryHeaders.data);
        return secondaryHeaders.copyWith(
          indexesMap: secondaryHeadersIndexes,
        );
      } else {
        return secondaryHeaders;
      }
    }();
    return HeaderDataProcessor._(
      headers: updatedHeaders,
      secondaryHeaders: updatedSecondaryHeadersIndexes,
    );
  }
  final TableHeadersModel headers;
  final TableHeadersModel secondaryHeaders;

  bool isSecondaryHeaderExists({
    required final String name,
  }) =>
      secondaryHeaders.indexesMap.containsKey(name);
}
