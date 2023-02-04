import '../data_processors/data_indexer.dart';
import '../models/models.dart';
import 'excel_table_mock_api.dart';

class ExcelRuntimeTable {
  ExcelRuntimeTable._({
    required this.params,
    required this.excelTableApi,
    required this.headers,
  });
  final TableParamsModel params;
  final ExcelTableApi excelTableApi;
  final TableHeadersModel headers;
  static Future<ExcelRuntimeTable> load({
    required final TableParamsModel params,
    required final ExcelTableApi excelTableApi,
    final bool indexateHeaders = true,
  }) async {
    final headers = await loadHeaders(
      excelTableApi: excelTableApi,
      params: params,
    );

    return ExcelRuntimeTable._(
      excelTableApi: excelTableApi,
      headers: headers,
      params: params,
    );
  }

  static Future<TableHeadersModel> loadHeaders({
    required final ExcelTableApi excelTableApi,
    required final TableParamsModel params,
    final bool indexateHeaders = true,
  }) async {
    final rowRange = await excelTableApi.getRowRange(
      topLeftCell: params.headerTopLeftCell,
      keepRangeAlive: false,
    );
    final values = await excelTableApi.loadRangeValues(range: rowRange);

    final headers = TableHeadersModel(
      data: List.castFrom(values),
      indexesMap: const {},
      topLeftCell: params.headerTopLeftCell,
    );
    if (indexateHeaders) {
      return headers.copyWith(
        indexesMap: DataIndexer.getColumnUniqueKeyBasedIndexes(
          data: headers.data,
        ),
      );
    } else {
      return headers;
    }
  }

  // key - columnName
  final _aliveRanges = <String, ExcelLiveRange>{};
  Future<UnquieIndexedKeysMap> loadKeysColumnIndexedUniqueValues() async {
    final values = await loadKeysColumnValues();
    return DataIndexer.getColumnUniqueKeyBasedIndexes(data: values);
  }

  Future<IndexedKeysMap> loadKeysColumnIndexedValues() async {
    final values = await loadKeysColumnValues();
    return DataIndexer.getColumnKeyBasedIndexes(data: values);
  }

  Future<ExcelTableStringData> loadKeysColumnValues() async {
    final values = await loadColumnValues(name: params.keyColumnName);
    return List.castFrom<List<dynamic>, List<String>>(values);
  }

  Future<ExcelTableData> loadColumnValues({
    required final String name,
    final bool keepRangeAlive = false,
  }) async {
    final columnIndex = headers.indexesMap[name]!;
    final liveRange = await excelTableApi.getColumnRange(
      topLeftCell: params.dataTopLeftCell,
      relativeIndex: columnIndex,
      keepRangeAlive: keepRangeAlive,
    );
    if (keepRangeAlive) {
      await closeLiveRange(name: name);
      _aliveRanges[name] = liveRange;
    }

    return excelTableApi.loadRangeValues(
      range: liveRange,
    );
  }

  Future<void> updateColumnValues({
    required final String name,
    required final ExcelTableData columnValues,
  }) async {
    ExcelLiveRange? range = _aliveRanges[name];
    if (range == null || range.rowsCount != columnValues.length) {
      final columnIndex = headers.indexesMap[name]!;
      range = await excelTableApi.getColumnRange(
        topLeftCell: params.dataTopLeftCell,
        relativeIndex: columnIndex,
        keepRangeAlive: false,
      );
    }
    await excelTableApi.updateRangeValues(
      range: range,
      values: columnValues,
    );
  }

  Future<void> closeLiveRange({
    required final String name,
  }) async {
    final oldRange = _aliveRanges.remove(name);
    if (oldRange != null) {
      oldRange.close();
    }
  }
}
