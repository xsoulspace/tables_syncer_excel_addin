import 'package:flutter_test/flutter_test.dart';
import 'package:ts_core/ts_core.dart';

void main() {
  group('TableSyncerService', () {
    test('can syncTables', () async {
      // final apiServices = ApiServices.create(context);
      // final tablesNotifier = SyncParamsNotifier(apiServices: apiServices);

      final sourceTableParam = TableParamsModel(
        id: '1',
        workbookOriginName: '',
        userId: '',
        createdAt: DateTime.now(),
        dataTopLeftCell: const CellModel(columnIndex: 20, rowIndex: 2),
        headerTopLeftCell: const CellModel(columnIndex: 20, rowIndex: 2),
      );
      final destinationTableParam = TableParamsModel(
        id: '2',
        workbookOriginName: '',
        userId: '',
        createdAt: DateTime.now(),
        dataTopLeftCell: const CellModel(columnIndex: 1, rowIndex: 1),
        headerTopLeftCell: const CellModel(columnIndex: 1, rowIndex: 1),
      );
      final tablesMap = {
        sourceTableParam.id: sourceTableParam,
        destinationTableParam.id: destinationTableParam,
      };
      final syncParams = TablesSyncParamsModel(
        id: '',
        userId: '',
        createdAt: DateTime.now(),
        sourceTableId: sourceTableParam.id,
        destinationTablesIds: [destinationTableParam.id],
        columnNames: const ['size', 'id', 'color'],
        shouldUpdateValues: true,
        shouldAddNewValues: true,
        shouldClearValueBeforeUpdate: true,
      );

      final runtimeSyncParams = SyncParamsNormalizer.normalize(
        syncParams: syncParams,
        tablesMap: tablesMap,
      );

      final mockTablesHeaders = {
        sourceTableParam.headerTopLeftCell: [
          ['id', 'color', 'name', 'brand', 'size']
        ],
        destinationTableParam.headerTopLeftCell: [
          ['planet', 'solar system', 'size', 'color', 'id']
        ]
      };
      final mockTables = {
        sourceTableParam.dataTopLeftCell: [
          ['1', 'white', 'shirt', 'chief', 'medium'],
          ['3', 'grey', 'pants', 'parabens', 'medium'],
          ['6', 'black', 'car', 'la', 'large'],
          ['7', 'red', 'vagon', 'wbw', 'small'],
        ],
        destinationTableParam.dataTopLeftCell: [
          ['earth', 'solar', 'x', '45', '3'],
          ['venus', 'alpha centauri', 'd', '21', '5'],
          ['mars', 'persei', 'c', '3', '6'],
          ['sun', 'Zeta Reticuli', 's', '6', '4'],
        ],
      };
      final expectedUpdatedTable = [
        ['earth', 'solar', 'medium', 'grey', '3'],
        ['venus', 'alpha centauri', 'd', '21', '5'],
        ['mars', 'persei', 'large', 'black', '6'],
        ['sun', 'Zeta Reticuli', 's', '6', '4'],
        [null, null, 'medium', 'white', '1'],
        [null, null, 'small', 'red', '7'],
      ];

      final excelTableApi = ExcelTablesMockApi(
        tables: mockTables,
        tablesHeaders: mockTablesHeaders,
      );
      final excelTableSyncerService = ExcelTableSyncerService(
        excelTableApi: excelTableApi,
      );
      await excelTableSyncerService.syncTables(
        runtimeSyncParams: runtimeSyncParams,
      );
      final updatedDestinationTable =
          await excelTableApi.getTable(params: destinationTableParam);

      expect(updatedDestinationTable, equals(expectedUpdatedTable));
    });
  });
}
