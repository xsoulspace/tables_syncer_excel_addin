import 'package:flutter/material.dart';

import '../models/models.dart';
import 'data_indexer.dart';

@immutable
class HeaderDataProcessor {
  const HeaderDataProcessor._({
    required this.headers,
    required this.secondaryHeaders,
  });
  factory HeaderDataProcessor.load({
    required final TableHeadersModel headers,
    required final TableHeadersModel secondaryHeaders,
  }) {
    final headersIndexes =
        DataIndexer.getRowKeyBasedIndexes(data: headers.data);
    final secondaryHeadersIndexes =
        DataIndexer.getRowKeyBasedIndexes(data: secondaryHeaders.data);

    return HeaderDataProcessor._(
      headers: headers.copyWith(
        indexesMap: headersIndexes,
      ),
      secondaryHeaders: secondaryHeaders.copyWith(
        indexesMap: secondaryHeadersIndexes,
      ),
    );
  }
  final TableHeadersModel headers;
  final TableHeadersModel secondaryHeaders;
}
