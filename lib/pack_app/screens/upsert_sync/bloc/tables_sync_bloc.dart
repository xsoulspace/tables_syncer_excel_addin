import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_app/screens/upsert_sync/upsert_table.dart';
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
  final isSaving = ValueNotifier(false);

  @override
  void dispose() {
    isSaving.dispose();
    newColumn.dispose();
  }
}

class TablesSyncBloc extends Bloc<TablesSyncEvent, TablesSyncState> {
  TablesSyncBloc({
    required this.diDto,
  }) : super(const EmptyTablesSyncState()) {
    on<TablesSyncInitEvent>(_onInit);
    on<TablesSyncSaveEvent>(_onSave);
    on<TablesSyncAddColumnNameEvent>(_onAddColumnName);
    on<TablesSyncDeleteColumnNameEvent>(_onDeleteColumnName);
    on<TablesSyncAddDestinationTableEvent>(_onAddDestinationTable);
    on<TablesSyncDeleteDestinationTableEvent>(_onDeleteDestinationTable);
    on<TablesSyncSelectSourceTableEvent>(_onSelectSourceTable);
    on<TablesSyncShouldUpdateValuesTableEvent>(_onShouldUpdateValues);
    on<TablesSyncShouldAddNewValuesTableEvent>(_onShouldAddNewValues);
  }
  final controllers = TablesSyncBlocControllers();
  final TablesSyncBlocDiDto diDto;

  void _onInit(
    final TablesSyncInitEvent event,
    final Emitter<TablesSyncState> emit,
  ) {
    final syncParams = diDto.syncParamsNotifier.syncParamsMap[event.syncId];
    final newState = LiveTablesSyncParamsState.fromSyncParams(
      syncParams: syncParams,
      syncNotifier: diDto.syncParamsNotifier,
    );
    emit(newState);
  }

  Future<void> _onSave(
    final TablesSyncSaveEvent event,
    final Emitter<TablesSyncState> emit,
  ) async {
    controllers.isSaving.value = true;
    final liveState = getLiveState();
    final tablesSync = liveState.toTablesSync();

    await diDto.apiServices.tablesSync.upsertTableSync(tablesSync);
    controllers.isSaving.value = false;
    diDto.appRouterController.toTablesSyncs();
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
