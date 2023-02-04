import 'package:flutter_test/flutter_test.dart';
import 'package:office_addin_helper/office_addin_helper.dart';
import 'package:ts_core/ts_core.dart';

void main() {
  group('TableSyncerService', () {
    final sourceTableParam = TableParamsModel(
      id: '1',
      workbookOriginName: '',
      userId: '',
      createdAt: DateTime.now(),
      dataTopLeftCell: const CellModel(columnIndex: 20, rowIndex: 2),
      headerTopLeftCell: const CellModel(columnIndex: 20, rowIndex: 3),
      keyColumnName: 'id',
    );
    final destinationTableParam = TableParamsModel(
      id: '2',
      workbookOriginName: '',
      userId: '',
      createdAt: DateTime.now(),
      dataTopLeftCell: const CellModel(columnIndex: 1, rowIndex: 1),
      headerTopLeftCell: const CellModel(columnIndex: 1, rowIndex: 2),
      keyColumnName: 'id',
    );
    final tablesMap = {
      sourceTableParam.id: sourceTableParam,
      destinationTableParam.id: destinationTableParam,
    };

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
    final expectedWithUpdatedTable = [
      ['earth', 'solar', 'medium', 'grey', '3'],
      ['venus', 'alpha centauri', 'd', '21', '5'],
      ['mars', 'persei', 'large', 'black', '6'],
      ['sun', 'Zeta Reticuli', 's', '6', '4'],
    ];
    final expectedWithUpdatedNewTable = [
      ...expectedWithUpdatedTable,
      [null, null, 'medium', 'white', '1'],
      [null, null, 'small', 'red', '7'],
    ];
    final expectedWithUpdatedClearTable = [
      ['earth', 'solar', 'medium', 'grey', '3'],
      ['venus', 'alpha centauri', null, null, '5'],
      ['mars', 'persei', 'large', 'black', '6'],
      ['sun', 'Zeta Reticuli', null, null, '4'],
    ];
    final expectedWithInsertTable = [
      ...mockTables[destinationTableParam.dataTopLeftCell]!,
      // [null, null, 'medium', 'white', '1'],
      // [null, null, 'small', 'red', '7'],
      [null, null, null, null, '1'],
      [null, null, null, null, '7'],
    ];
    test('can syncTables with shouldUpdateValues, shouldAddNewValues',
        () async {
      // final apiServices = ApiServices.create(context);
      // final tablesNotifier = SyncParamsNotifier(apiServices: apiServices);
      final syncParams = TablesSyncParamsModel(
        id: '',
        userId: '',
        createdAt: DateTime.now(),
        sourceTableId: sourceTableParam.id,
        destinationTablesIds: [destinationTableParam.id],
        columnNames: const ['size', 'color'],
        shouldUpdateValues: true,
        shouldAddNewValues: true,
        shouldClearValueBeforeUpdate: false,
      );

      final runtimeSyncParams = SyncParamsNormalizer.normalize(
        syncParams: syncParams,
        tablesMap: tablesMap,
      );
      final excelTableApi = ExcelTableMockApi(
        tables: {...mockTables, ...mockTablesHeaders},
      );
      final excelTableSyncerService = ExcelTableSyncerService(
        excelTableApi: excelTableApi,
      );
      await excelTableSyncerService.syncTables(
        runtimeSyncParams: runtimeSyncParams,
      );
      final updatedDestinationTable =
          excelTableApi.tables[destinationTableParam.dataTopLeftCell];

      expect(updatedDestinationTable, equals(expectedWithUpdatedNewTable));
    });
    test('can syncTables with shouldUpdateValues', () async {
      // final apiServices = ApiServices.create(context);
      // final tablesNotifier = SyncParamsNotifier(apiServices: apiServices);
      final syncParams = TablesSyncParamsModel(
        id: '',
        userId: '',
        createdAt: DateTime.now(),
        sourceTableId: sourceTableParam.id,
        destinationTablesIds: [destinationTableParam.id],
        columnNames: const ['size', 'color'],
        shouldUpdateValues: true,
        shouldAddNewValues: false,
        shouldClearValueBeforeUpdate: false,
      );

      final runtimeSyncParams = SyncParamsNormalizer.normalize(
        syncParams: syncParams,
        tablesMap: tablesMap,
      );
      final excelTableApi = ExcelTableMockApi(
        tables: {...mockTables, ...mockTablesHeaders},
      );
      final excelTableSyncerService = ExcelTableSyncerService(
        excelTableApi: excelTableApi,
      );
      await excelTableSyncerService.syncTables(
        runtimeSyncParams: runtimeSyncParams,
      );
      final updatedDestinationTable =
          excelTableApi.tables[destinationTableParam.dataTopLeftCell];

      expect(updatedDestinationTable, equals(expectedWithUpdatedTable));
    });
    test(
        'can syncTables with shouldUpdateValues & shouldClearValueBeforeUpdate',
        () async {
      // final apiServices = ApiServices.create(context);
      // final tablesNotifier = SyncParamsNotifier(apiServices: apiServices);
      final syncParams = TablesSyncParamsModel(
        id: '',
        userId: '',
        createdAt: DateTime.now(),
        sourceTableId: sourceTableParam.id,
        destinationTablesIds: [destinationTableParam.id],
        columnNames: const ['size', 'color'],
        shouldUpdateValues: true,
        shouldAddNewValues: false,
        shouldClearValueBeforeUpdate: true,
      );

      final runtimeSyncParams = SyncParamsNormalizer.normalize(
        syncParams: syncParams,
        tablesMap: tablesMap,
      );
      final excelTableApi = ExcelTableMockApi(
        tables: {...mockTables, ...mockTablesHeaders},
      );
      final excelTableSyncerService = ExcelTableSyncerService(
        excelTableApi: excelTableApi,
      );
      await excelTableSyncerService.syncTables(
        runtimeSyncParams: runtimeSyncParams,
      );
      final updatedDestinationTable =
          excelTableApi.tables[destinationTableParam.dataTopLeftCell];

      expect(updatedDestinationTable, equals(expectedWithUpdatedClearTable));
    });
    test('can syncTables with shouldAddNewValues', () async {
      // final apiServices = ApiServices.create(context);
      // final tablesNotifier = SyncParamsNotifier(apiServices: apiServices);
      final syncParams = TablesSyncParamsModel(
        id: '',
        userId: '',
        createdAt: DateTime.now(),
        sourceTableId: sourceTableParam.id,
        destinationTablesIds: [destinationTableParam.id],
        columnNames: const ['size', 'color'],
        shouldUpdateValues: false,
        shouldAddNewValues: true,
        shouldClearValueBeforeUpdate: false,
      );

      final runtimeSyncParams = SyncParamsNormalizer.normalize(
        syncParams: syncParams,
        tablesMap: tablesMap,
      );
      final excelTableApi = ExcelTableMockApi(
        tables: {...mockTables, ...mockTablesHeaders},
      );
      final excelTableSyncerService = ExcelTableSyncerService(
        excelTableApi: excelTableApi,
      );
      await excelTableSyncerService.syncTables(
        runtimeSyncParams: runtimeSyncParams,
      );
      final updatedDestinationTable =
          excelTableApi.tables[destinationTableParam.dataTopLeftCell];

      expect(updatedDestinationTable, equals(expectedWithInsertTable));
    });
  });
}
