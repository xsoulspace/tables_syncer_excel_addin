// ignore_for_file: invalid_annotation_target

part of 'create_sync_bloc.dart';

@immutable
abstract class CreateSyncState {
  const CreateSyncState();
}

@immutable
class EmptyCreateSyncState extends CreateSyncState {
  const EmptyCreateSyncState();
}

@immutable
@Freezed(
  fromJson: false,
  toJson: false,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class LiveSyncParamsState
    with _$LiveSyncParamsState
    implements CreateSyncState {
  @Implements<CreateSyncState>()
  const factory LiveSyncParamsState({
    @Default([]) final List<String> columnNames,
    @Default({}) final Set<TableParamsModel> unselectedDestinationTables,
    @Default({}) final Set<TableParamsModel> selectedDestinationTables,
    final TableParamsModel? selectedSourceTable,
    @Default(true) final bool shouldUpdateValues,
    @Default(true) final bool shouldAddNewValues,
    final TablesSyncParamsModel? syncParams,
  }) = _LiveSyncParamsState;

  const LiveSyncParamsState._();

  factory LiveSyncParamsState.fromSyncParams({
    required final TablesSyncParamsModel syncParams,
    required final SyncParamsNotifier syncNotifier,
  }) {
    final tablesMap = syncNotifier.tablesParamsMap;
    final destinationTables = {...tablesMap};
    final selectedDestinationTables = <TableParamsModel>{};
    for (final tableId in syncParams.destinationTablesIds) {
      final table = tablesMap[tableId];
      if (table == null) continue;
      selectedDestinationTables.add(table);
      destinationTables.remove(tableId);
    }

    return LiveSyncParamsState(
      columnNames: syncParams.columnNames,
      selectedSourceTable: tablesMap[syncParams.sourceTableId],
      selectedDestinationTables: selectedDestinationTables,
      unselectedDestinationTables: destinationTables.values.toSet(),
    );
  }
}
