import '../data_processors/data_indexer.dart';
import '../models/models.dart';
import 'excel_table_mock_api.dart';

class ExcelRuntimeTable {
  ExcelRuntimeTable({
    required this.params,
    required this.excelTableApi,
  });
  final TableParamsModel params;
  final ExcelTableApi excelTableApi;

  Future<TableHeadersModel> loadHeaders() async {}
  Future<UnquieIndexedKeysMap> loadKeysColumnIndexedValues() async {}
  Future<ExcelTableStringData> loadKeysColumnValues() async {}
  Future<ExcelTableData> loadColumnValues({
    required final String name,
    final bool keepRangeAlive = false,
  }) async {}
  Future<void> updateColumnValues({
    required final String name,
    required final ExcelTableData columnValues,
  }) async {}
  Future<void> closeLiveRange({
    required final String name,
  }) async {}
}
