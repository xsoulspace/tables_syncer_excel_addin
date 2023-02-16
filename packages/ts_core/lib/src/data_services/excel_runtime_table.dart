import 'package:office_addin_helper/office_addin_helper.dart';

import '../data_processors/data_indexer.dart';
import '../models/models.dart';

class ExcelRuntimeTable {
  ExcelRuntimeTable._({
    required this.params,
    required this.excelTableApi,
    required this.headers,
    required this.sheet,
  });
  final TableParamsModel params;
  final ExcelTableApi excelTableApi;
  final TableHeadersModel headers;
  final SheetModel sheet;
  static Future<ExcelRuntimeTable> load({
    required final TableParamsModel params,
    required final ExcelTableApi excelTableApi,
    final bool indexateHeaders = true,
  }) async {
    final sheet = await excelTableApi.getSheet(params.worksheetName);
    final headers = await loadHeaders(
      excelTableApi: excelTableApi,
      params: params,
      sheet: sheet,
    );

    return ExcelRuntimeTable._(
      excelTableApi: excelTableApi,
      sheet: sheet,
      headers: headers,
      params: params,
    );
  }

  static Future<TableHeadersModel> loadHeaders({
    required final ExcelTableApi excelTableApi,
    required final TableParamsModel params,
    required final SheetModel sheet,
    final bool indexateHeaders = true,
  }) async {
    final rowRange = await excelTableApi.getRowRange(
      topLeftCell: params.headerTopLeftCell,
      sheet: sheet,
    );
    final values = await excelTableApi.loadRangeValues(range: rowRange);

    final headers = TableHeadersModel(
      data: values
          .map((final row) => row.map((final value) => '$value').toList())
          .toList(),
      indexesMap: const {},
      topLeftCell: params.headerTopLeftCell,
    );
    if (indexateHeaders) {
      return headers.copyWith(
        indexesMap: DataIndexer.getRowKeyBasedIndexes(
          data: headers.data,
        ),
      );
    } else {
      return headers;
    }
  }

  // key - columnName
  final _trackingRanges = <String, RangeModel>{};
  Future<UnquieIndexedKeysMap> loadKeysColumnIndexedUniqueValues({
    required final String syncKeyColumnName,
  }) async {
    final values =
        await loadKeysColumnValues(syncKeyColumnName: syncKeyColumnName);
    return DataIndexer.getColumnUniqueKeyBasedIndexes(data: values);
  }

  Future<IndexedKeysMap> loadKeysColumnIndexedValues({
    required final String syncKeyColumnName,
  }) async {
    final values =
        await loadKeysColumnValues(syncKeyColumnName: syncKeyColumnName);
    return DataIndexer.getColumnKeyBasedIndexes(data: values);
  }

  Future<ExcelTableStringData> loadKeysColumnValues({
    required final String syncKeyColumnName,
  }) async {
    final keyColumnName =
        params.keyColumnName.isEmpty ? syncKeyColumnName : params.keyColumnName;
    final values = await loadColumnValues(name: keyColumnName);
    return values.map((final e) => ['${e.first}']).toList();
  }

  Future<ExcelTableData> loadColumnValues({
    required final String name,
    final bool shouldTrackRange = false,
  }) async {
    final columnIndex = headers.indexesMap[name]!;
    final liveRange = await excelTableApi.getColumnRange(
      sheet: sheet,
      topLeftCell: params.dataTopLeftCell,
      relativeColumnIndex: columnIndex,
      shouldTrackRange: shouldTrackRange,
    );
    if (shouldTrackRange) {
      await removeTrackingRange(columnName: name);
      _trackingRanges[name] = liveRange;
    }

    return excelTableApi.loadRangeValues(
      range: liveRange,
    );
  }

  Future<void> updateColumnValues({
    required final String name,
    required final ExcelTableData columnValues,
  }) async {
    RangeModel? range = _trackingRanges[name];
    if (range == null || range.rowsCount != columnValues.length) {
      final columnIndex = headers.indexesMap[name]!;
      range = await excelTableApi.getColumnRange(
        sheet: sheet,
        topLeftCell: params.dataTopLeftCell,
        relativeColumnIndex: columnIndex,
      );
    }
    await excelTableApi.updateRangeValues(
      range: range,
      values: columnValues,
    );
  }

  Future<void> addNewKeyColumnValues({
    required final IndexedKeysWithOriginMap newKeysMap,
  }) async {
    final columnIndex = headers.indexesMap[params.keyColumnName]!;
    final columnValues = newKeysMap.keys.map((final key) => [key]).toList();
    final range = await excelTableApi.getColumnRange(
      sheet: sheet,
      topLeftCell: params.dataTopLeftCell,
      relativeColumnIndex: columnIndex,
      shouldInsertUnderLastRow: true,
      rowsCount: columnValues.length,
    );
    await excelTableApi.updateRangeValues(
      range: range,
      values: columnValues,
    );
  }

  Future<void> removeTrackingRange({
    required final String columnName,
  }) async {
    final oldRange = _trackingRanges.remove(columnName);
    if (oldRange != null) {
      excelTableApi.removeTrackingRange(
        sheet: sheet,
        range: oldRange,
      );
    }
  }
}
