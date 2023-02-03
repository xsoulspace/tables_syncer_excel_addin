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
    TableHeadersModel headers = await loadHeaders(
      excelTableApi: excelTableApi,
      params: params,
    );
    if (indexateHeaders) {
      headers = headers.copyWith(
        indexesMap: DataIndexer.getColumnUniqueKeyBasedIndexes(
          data: headers.data,
        ),
      );
    }
    return ExcelRuntimeTable._(
      excelTableApi: excelTableApi,
      headers: headers,
      params: params,
    );
  }

  static Future<TableHeadersModel> loadHeaders({
    required final ExcelTableApi excelTableApi,
    required final TableParamsModel params,
  }) async {
    final rowRange = await excelTableApi.getRowRange(
      topLeftCell: params.headerTopLeftCell,
    );
    excelTableApi.loadRangeValues(range: rowRange);
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
    final columnIndex = headers.indexesMap[name];
    final liveRange = await excelTableApi.getColumnRange(
      topLeftDataCell: params.dataTopLeftCell,
      relativeIndex: columnIndex,
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
      final columnIndex = headers.indexesMap[name];
      range = excelTableApi.getColumnRange(
        topLeftDataCell: params.dataTopLeftCell,
        relativeIndex: columnIndex,
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

abstract class ExcelLiveRange {
  ExcelLiveRange({
    required this.rowsCount,
    required this.columnsCount,
  });
  final int rowsCount;
  final int columnsCount;
  void close();
}
