import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_app/upsert_sync/upsert_table.dart';
import 'package:tables_syncer_excel_addin/pack_core/pack_core.dart';
import 'package:ts_core/ts_core.dart';

part 'tables_sync_bloc.freezed.dart';
part 'tables_sync_bloc_events.dart';
part 'tables_sync_bloc_states.dart';

class TablesSyncBlocDiDto {
  TablesSyncBlocDiDto.use(final Locator read)
      : apiServices = read(),
        syncParamsNotifier = read(),
        appRouterController = AppRouterController.use(read);
  final ApiServices apiServices;
  final SyncParamsNotifier syncParamsNotifier;
  final AppRouterController appRouterController;
}

class TablesSyncBlocControllers implements Disposable {
  final newColumn = TextEditingController();
  final keyColumnName = TextEditingController();
  final isSaving = ValueNotifier(false);

  @override
  void dispose() {
    keyColumnName.dispose();
    isSaving.dispose();
    newColumn.dispose();
  }
}

class TablesSyncBloc extends Bloc<TablesSyncEvent, TablesSyncState> {
  TablesSyncBloc({
    required this.diDto,
    required this.shouldPopAfterSubmit,
    required this.onPopContext,
  }) : super(const EmptyTablesSyncState()) {
    on<TablesSyncInitEvent>(_onInit);
    on<TablesSyncResetEvent>(_onReset);
    on<TablesSyncSaveEvent>(_onSave);
    on<TablesSyncAddColumnNameEvent>(_onAddColumnName);
    on<TablesSyncDeleteColumnNameEvent>(_onDeleteColumnName);
    on<TablesSyncAddDestinationTableEvent>(_onAddDestinationTable);
    on<TablesSyncDeleteDestinationTableEvent>(_onDeleteDestinationTable);
    on<TablesSyncSelectSourceTableEvent>(_onSelectSourceTable);
    on<TablesSyncShouldUpdateValuesTableEvent>(_onShouldUpdateValues);
    on<TablesSyncShouldAddNewValuesTableEvent>(_onShouldAddNewValues);
    on<TablesSyncShouldClearBeforeUpdateTableEvent>(_onShouldClearBeforeUpdate);
  }
  final controllers = TablesSyncBlocControllers();
  final TablesSyncBlocDiDto diDto;
  final bool shouldPopAfterSubmit;
  final VoidCallback onPopContext;

  void _onInit(
    final TablesSyncInitEvent event,
    final Emitter<TablesSyncState> emit,
  ) {
    final syncParams = diDto.syncParamsNotifier.syncParamsMap[event.syncId];
    final newState = LiveTablesSyncParamsState.fromSyncParams(
      syncParams: syncParams,
      syncNotifier: diDto.syncParamsNotifier,
      controllers: controllers,
    );
    emit(newState);
  }

  void _onReset(
    final TablesSyncResetEvent event,
    final Emitter<TablesSyncState> emit,
  ) {
    final newState = LiveTablesSyncParamsState.fromSyncParams(
      syncParams: null,
      syncNotifier: diDto.syncParamsNotifier,
      controllers: controllers,
    );
    emit(newState);
  }

  Future<void> _onSave(
    final TablesSyncSaveEvent event,
    final Emitter<TablesSyncState> emit,
  ) async {
    controllers.isSaving.value = true;
    final liveState = getLiveState();
    final tablesSync = liveState.toTablesSync(controllers: controllers);

    await diDto.apiServices.tablesSync.upsertTableSync(tablesSync);
    controllers.isSaving.value = false;
    add(const TablesSyncResetEvent());
    if (shouldPopAfterSubmit) {
      onPopContext();
    } else {
      diDto.appRouterController.toTablesSyncs();
    }
  }

  @override
  Future<void> close() {
    controllers.dispose();
    return super.close();
  }

  void _onAddColumnName(
    final TablesSyncAddColumnNameEvent event,
    final Emitter<TablesSyncState> emit,
  ) {
    final text = controllers.newColumn.text;
    if (text.isEmpty) return;
    controllers.newColumn.clear();
    LiveTablesSyncParamsState liveState = getLiveState();
    final columnNames = {...liveState.columnNames};
    liveState = liveState.copyWith(
      columnNames: {...columnNames, text},
    );
    emit(liveState);
  }

  void _onDeleteColumnName(
    final TablesSyncDeleteColumnNameEvent event,
    final Emitter<TablesSyncState> emit,
  ) {
    LiveTablesSyncParamsState liveState = getLiveState();
    final columnNames = {...liveState.columnNames};
    liveState = liveState.copyWith(
      columnNames: {...columnNames}..remove(event.columnName),
    );
    emit(liveState);
  }

  void _onAddDestinationTable(
    final TablesSyncAddDestinationTableEvent event,
    final Emitter<TablesSyncState> emit,
  ) {
    LiveTablesSyncParamsState liveState = getLiveState();
    final selectedDestinationTables = {...liveState.selectedDestinationTables}
      ..add(event.table);
    final unselectedDestinationTables = {
      ...liveState.unselectedDestinationTables
    }..remove(event.table);

    liveState = liveState.copyWith(
      selectedDestinationTables: selectedDestinationTables,
      unselectedDestinationTables: unselectedDestinationTables,
    );
    emit(liveState);
  }

  void _onDeleteDestinationTable(
    final TablesSyncDeleteDestinationTableEvent event,
    final Emitter<TablesSyncState> emit,
  ) {
    LiveTablesSyncParamsState liveState = getLiveState();
    final selectedDestinationTables = {...liveState.selectedDestinationTables}
      ..remove(event.table);
    final unselectedDestinationTables = {
      ...liveState.unselectedDestinationTables
    }..add(event.table);

    liveState = liveState.copyWith(
      selectedDestinationTables: selectedDestinationTables,
      unselectedDestinationTables: unselectedDestinationTables,
    );
    emit(liveState);
  }

  void _onSelectSourceTable(
    final TablesSyncSelectSourceTableEvent event,
    final Emitter<TablesSyncState> emit,
  ) {
    LiveTablesSyncParamsState liveState = getLiveState();

    liveState = liveState.copyWith(
      selectedSourceTable: event.table,
    );
    emit(liveState);
  }

  Future<void> onCreateTable(final BuildContext context) async {
    final table = await showUpsertTableDialog(context);
    if (table == null) return;
    add(TablesSyncDeleteDestinationTableEvent(table: table));
  }

  void _onShouldClearBeforeUpdate(
    final TablesSyncShouldClearBeforeUpdateTableEvent event,
    final Emitter<TablesSyncState> emit,
  ) {
    LiveTablesSyncParamsState liveState = getLiveState();

    liveState = liveState.copyWith(
      shouldClearValuesBeforeUpdate: event.shouldClear,
    );
    emit(liveState);
  }

  void _onShouldUpdateValues(
    final TablesSyncShouldUpdateValuesTableEvent event,
    final Emitter<TablesSyncState> emit,
  ) {
    LiveTablesSyncParamsState liveState = getLiveState();

    liveState = liveState.copyWith(
      shouldUpdateValues: event.shouldUpdate,
    );
    emit(liveState);
  }

  void _onShouldAddNewValues(
    final TablesSyncShouldAddNewValuesTableEvent event,
    final Emitter<TablesSyncState> emit,
  ) {
    LiveTablesSyncParamsState liveState = getLiveState();

    liveState = liveState.copyWith(
      shouldAddNewValues: event.shouldAdd,
    );
    emit(liveState);
  }

  LiveTablesSyncParamsState getLiveState() {
    final state = this.state;
    if (state is LiveTablesSyncParamsState) return state;
    throw ArgumentError();
  }
}
