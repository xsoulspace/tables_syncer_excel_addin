import 'package:office_addin_helper/office_addin_helper.dart';

import '../../ts_core.dart';
import '../data_processors/column_data_processor.dart';
import '../data_processors/data_indexer.dart';
import '../data_processors/header_data_processor.dart';

class ExcelTableSyncerService {
  ExcelTableSyncerService({
    required this.excelTableApi,
    this.analyticsNotifier,
  });
  final ExcelTableApi excelTableApi;
  final AnalyticsNotifier? analyticsNotifier;
  Future<void> syncTables({
    required final TablesSyncParamsRuntimeModel runtimeSyncParams,
  }) async {
    try {
      analyticsNotifier?.dynamicLog({'sync started': runtimeSyncParams});
      final sourceTable = runtimeSyncParams.sourceTable;
      if (sourceTable == null) {
        // TODO(arenukvern): add error
        return;
      }
      final sourceRuntimeTable = await ExcelRuntimeTable.load(
        params: sourceTable,
        excelTableApi: excelTableApi,
        syncKeyColumnName: runtimeSyncParams.keyColumnName,
      );
      final sourceColumnIndexedKeys =
          await sourceRuntimeTable.loadKeysColumnIndexedUniqueValues();
      // analyticsNotifier
      //     ?.dynamicLog({'sourceColumnIndexedKeys': sourceColumnIndexedKeys});
      final sourceColumnsCache = <String, ExcelTableData>{};

      for (final destinationTableParams
          in runtimeSyncParams.destinationTables) {
        final secondaryRuntimeTable = await ExcelRuntimeTable.load(
          params: destinationTableParams,
          excelTableApi: excelTableApi,
          syncKeyColumnName: runtimeSyncParams.keyColumnName,
        );
        final headersProcessor = HeaderDataProcessor.loadWithIndexedHeaders(
          headers: sourceRuntimeTable.headers,
          secondaryHeaders: secondaryRuntimeTable.headers,
        );

        // analyticsNotifier?.dynamicLog(
        //   {
        //     'headersProcessor headers': headersProcessor.headers,
        //     'secondaryHeaders': headersProcessor.secondaryHeaders,
        //   },
        // );

        IndexedKeysMap secondaryColumnIndexedKeys =
            await secondaryRuntimeTable.loadKeysColumnIndexedValues();

        ColumnDataProcessor columnDataProcessor =
            ColumnDataProcessor.fromIndexedKeys(
          columnIndexedKeys: sourceColumnIndexedKeys,
          secondaryColumnIndexedKeys: secondaryColumnIndexedKeys,
        );
        // analyticsNotifier?.dynamicLog(
        //   {
        //     'columnDataProcessor indexedKeys': columnDataProcessor.indexedKeys,
        //     'newSecondaryIndexedKeys':
        //         columnDataProcessor.newSecondaryIndexedKeys,
        //     'updatableSecondaryIndexedKeys':
        //         columnDataProcessor.updatableSecondaryIndexedKeys,
        //     'secondaryColumnIndexedKeys': secondaryColumnIndexedKeys,
        //   },
        // );

        if (runtimeSyncParams.shouldAddNewValues &&
            columnDataProcessor.newSecondaryIndexedKeys.isNotEmpty) {
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
              shouldTrackRange: true,
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
            await secondaryRuntimeTable.removeTrackingRange(
              columnName: columnName,
            );
          }
        }
      }
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      await analyticsNotifier?.recordError(e, StackTrace.current);
      rethrow;
    }
  }
}
