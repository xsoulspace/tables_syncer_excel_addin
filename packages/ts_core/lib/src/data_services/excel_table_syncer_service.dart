import '../data_processors/column_data_processor.dart';
import '../data_processors/header_data_processor.dart';
import '../models/models.dart';
import 'data_services.dart';

class ExcelTableSyncerService {
  ExcelTableSyncerService({
    required this.excelTableApi,
  });
  final ExcelTableApi excelTableApi;
  Future<void> syncTables({
    required final TablesSyncParamsRuntimeModel runtimeSyncParams,
  }) async {
    final sourceRuntimeTable = ExcelRuntimeTable(
      params: runtimeSyncParams.sourceTable,
      excelTableApi: excelTableApi,
    );
    final headers = await sourceRuntimeTable.loadHeaders();
    final sourceColumnIndexedKeys =
        await sourceRuntimeTable.loadKeysColumnIndexedValues();

    final sourceColumnsCache = <String, ExcelTableData>{};

    for (final destinationTableParams in runtimeSyncParams.destinationTables) {
      final secondaryRuntimeTable = ExcelRuntimeTable(
        params: destinationTableParams,
        excelTableApi: excelTableApi,
      );
      final secondaryHeaders = await secondaryRuntimeTable.loadHeaders();
      final headersProcessor = HeaderDataProcessor.loadWithIndexedHeaders(
        headers: headers,
        secondaryHeaders: secondaryHeaders,
      );

      final secondaryKeysColumnValues =
          await secondaryRuntimeTable.loadKeysColumnValues();
      final columnDataProcessor = ColumnDataProcessor.fromIndexedKeys(
        columnIndexedKeys: sourceColumnIndexedKeys,
        secondaryColumnValues: secondaryKeysColumnValues,
      );

      // in this place can be implemented logic to insert non-existing headers.
      //
      // if(runtimeSyncParams.shouldInsertNewHeaders){
      //  await headersProcessor.updateSecondaryHeaders();
      // }
      for (final columnName in runtimeSyncParams.columnNames) {
        if (headersProcessor.isSecondaryHeaderExists(name: columnName)) {
          final secondaryColumnValues =
              await secondaryRuntimeTable.loadColumnValues(
            name: columnName,
            keepRangeAlive: true,
          );

          /// test it that it will work with the massive amount of data
          final columnValues = sourceColumnsCache[columnName] ??=
              await sourceRuntimeTable.loadColumnValues(name: columnName);

          final updatedSecondaryData = columnDataProcessor.updateColumnData(
            shouldUpdateValues: runtimeSyncParams.shouldUpdateValues,
            shouldInsertNewValues: runtimeSyncParams.shouldAddNewValues,
            shouldClearAllValuesBefore:
                runtimeSyncParams.shouldClearValueBeforeUpdate,
            columnValues: columnValues,
            secondaryColumnValues: secondaryColumnValues,
          );
          await secondaryRuntimeTable.updateColumnValues(
            name: columnName,
            columnValues: updatedSecondaryData,
          );
          await secondaryRuntimeTable.closeLiveRange(name: columnName);
        }
      }
    }
  }
}
