// ignore_for_file: invalid_annotation_target

part of 'tables_sync_bloc.dart';

@immutable
abstract class TablesSyncState {
  const TablesSyncState();
}

@immutable
class EmptyTablesSyncState extends TablesSyncState {
  const EmptyTablesSyncState();
}

@immutable
@Freezed(
  fromJson: false,
  toJson: false,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class LiveTablesSyncParamsState
    with _$LiveTablesSyncParamsState
    implements TablesSyncState {
  @Implements<TablesSyncState>()
  const factory LiveTablesSyncParamsState({
    @Default({}) final Set<String> columnNames,
    @Default({}) final Set<TableParamsModel> unselectedDestinationTables,
    @Default({}) final Set<TableParamsModel> selectedDestinationTables,
    @Default(true) final bool shouldUpdateValues,
    @Default(true) final bool shouldAddNewValues,
    @Default(false) final bool shouldClearValuesBeforeUpdate,
    @Default(false) final bool shouldAddNewHeaders,
    final TableParamsModel? selectedSourceTable,
    final TablesSyncParamsModel? syncParams,
  }) = _LiveTablesSyncParamsState;

  const LiveTablesSyncParamsState._();

  factory LiveTablesSyncParamsState.fromSyncParams({
    required final TablesSyncParamsModel? syncParams,
    required final SyncParamsNotifier syncNotifier,
    required final TablesSyncBlocControllers controllers,
  }) {
    if (syncParams == null) {
      controllers.keyColumn.text = '';
      return LiveTablesSyncParamsState(
        unselectedDestinationTables: syncNotifier.tableParams.toSet(),
      );
    }
    controllers.keyColumn.text = syncParams.keyColumnName;
    final tablesMap = syncNotifier.tablesParamsMap;
    final destinationTables = {...tablesMap};
    final selectedDestinationTables = <TableParamsModel>{};
    for (final tableId in syncParams.destinationTablesIds) {
      final table = tablesMap[tableId];
      if (table == null) continue;
      selectedDestinationTables.add(table);
      destinationTables.remove(tableId);
    }

    return LiveTablesSyncParamsState(
      syncParams: syncParams,
      shouldAddNewHeaders: syncParams.shouldAddNewHeaders,
      shouldClearValuesBeforeUpdate: syncParams.shouldClearValueBeforeUpdate,
      shouldAddNewValues: syncParams.shouldAddNewValues,
      shouldUpdateValues: syncParams.shouldUpdateValues,
      columnNames: syncParams.columnNames.toSet(),
      selectedSourceTable: tablesMap[syncParams.sourceTableId],
      selectedDestinationTables: selectedDestinationTables,
      unselectedDestinationTables: destinationTables.values.toSet(),
    );
  }

  TablesSyncParamsModel toTablesSync() {
    return TablesSyncParamsModel(
      createdAt: syncParams?.createdAt ?? DateTime.now(),
      userId: FirebaseAuth.instance.currentUser!.uid,
      id: syncParams?.id ?? IdCreator.create(),
      columnNames: columnNames.toList(),
      destinationTablesIds:
          selectedDestinationTables.map((final e) => e.id).toList(),
      shouldAddNewValues: shouldAddNewValues,
      shouldUpdateValues: shouldUpdateValues,
      sourceTableId: selectedSourceTable!.id,
      shouldClearValueBeforeUpdate: shouldClearValuesBeforeUpdate,
      // TODO(arenukvern):
      shouldAddNewHeaders: syncParams?.shouldAddNewHeaders ?? false,
      lastSyncAt: syncParams?.lastSyncAt,
      // TODO(arenukvern):
      name: syncParams?.name ?? '',
      // TODO(arenukvern):
      workbookName: syncParams?.workbookName ?? '',
    );
  }

  bool validate() {
    if (selectedDestinationTables.isEmpty) {
      return false;
    }
    if (selectedSourceTable == null) {
      return false;
    }

    if (columnNames.isEmpty) {
      return false;
    }
    return true;
  }

  @useResult
  Set<TableParamsModel> getAllTables() =>
      {...selectedDestinationTables, ...unselectedDestinationTables};
}
