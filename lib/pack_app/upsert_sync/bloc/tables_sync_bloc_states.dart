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
    final TableParamsModel? selectedSourceTable,
    final TablesSyncParamsModel? syncParams,
  }) = _LiveTablesSyncParamsState;

  const LiveTablesSyncParamsState._();

  factory LiveTablesSyncParamsState.fromSyncParams({
    required final TablesSyncParamsModel? syncParams,
    required final SyncParamsNotifier syncNotifier,
  }) {
    if (syncParams == null) {
      return LiveTablesSyncParamsState(
        unselectedDestinationTables: syncNotifier.tableParams.toSet(),
      );
    }
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
      createdAt: DateTime.now(),
      userId: FirebaseAuth.instance.currentUser!.uid,
      id: IdCreator.create(),
      columnNames: columnNames.toList(),
      destinationTablesIds:
          selectedDestinationTables.map((final e) => e.id).toList(),
      shouldAddNewValues: shouldAddNewValues,
      shouldUpdateValues: shouldUpdateValues,
      sourceTableId: selectedSourceTable!.id,
      shouldClearValueBeforeUpdate: shouldClearValuesBeforeUpdate,
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
