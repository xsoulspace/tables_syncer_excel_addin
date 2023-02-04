import '../data_processors/column_data_processor.dart';
import '../data_processors/data_indexer.dart';
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
    final sourceRuntimeTable = await ExcelRuntimeTable.load(
      params: runtimeSyncParams.sourceTable,
      excelTableApi: excelTableApi,
    );
    final sourceColumnIndexedKeys =
        await sourceRuntimeTable.loadKeysColumnIndexedUniqueValues();

    final sourceColumnsCache = <String, ExcelTableData>{};

    for (final destinationTableParams in runtimeSyncParams.destinationTables) {
      final secondaryRuntimeTable = await ExcelRuntimeTable.load(
        params: destinationTableParams,
        excelTableApi: excelTableApi,
      );
      final headersProcessor = HeaderDataProcessor.loadWithIndexedHeaders(
        headers: sourceRuntimeTable.headers,
        secondaryHeaders: secondaryRuntimeTable.headers,
      );

      IndexedKeysMap secondaryColumnIndexedKeys =
          await secondaryRuntimeTable.loadKeysColumnIndexedValues();
      ColumnDataProcessor columnDataProcessor =
          ColumnDataProcessor.fromIndexedKeys(
        columnIndexedKeys: sourceColumnIndexedKeys,
        secondaryColumnIndexedKeys: secondaryColumnIndexedKeys,
      );
      if (runtimeSyncParams.shouldAddNewValues) {
        await secondaryRuntimeTable.addNewKeyColumnValues(
          newKeysMap: columnDataProcessor.newSecondaryIndexedKeys,
        );

        // TODO: optimize - use last row index to move new to updatable
        secondaryColumnIndexedKeys =
            await secondaryRuntimeTable.loadKeysColumnIndexedValues();
        columnDataProcessor = ColumnDataProcessor.fromIndexedKeys(
          columnIndexedKeys: sourceColumnIndexedKeys,
          secondaryColumnIndexedKeys: secondaryColumnIndexedKeys,
        );
      }

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
