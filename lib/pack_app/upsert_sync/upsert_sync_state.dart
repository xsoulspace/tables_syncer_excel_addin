part of 'upsert_sync.dart';

TablesSyncWidgetState useTablesSyncWidgetState({
  required final TablesSyncParamsModelId? syncId,
}) =>
    use(
      ContextfulLifeHook(
        debugLabel: 'TablesSyncWidgetState',
        state: TablesSyncWidgetState(syncId: syncId),
      ),
    );

class TablesSyncWidgetState extends ContextfulLifeState {
  TablesSyncWidgetState({
    required this.syncId,
  });
  TablesSyncBloc get bloc => getContext().read<TablesSyncBloc>();
  final TablesSyncParamsModelId? syncId;
  bool get isCreateSync => syncId == null || syncId?.isEmpty == true;
  void onSelectSourceTable(final TableParamsModel? table) {
    bloc.add(TablesSyncSelectSourceTableEvent(table: table));
  }

  void onUnselectSourceTable() {
    bloc.add(const TablesSyncSelectSourceTableEvent(table: null));
  }

  @override
  void initState() {
    super.initState();
    bloc.add(TablesSyncInitEvent(syncId: syncId));
  }

  void onAddNewTable() {
    bloc.onCreateTable(getContext());
  }

  void onAddDestinationTable(final TableParamsModel table) {
    bloc.add(TablesSyncAddDestinationTableEvent(table: table));
  }

  void onDeleteDestinationTable(final TableParamsModel table) {
    bloc.add(TablesSyncDeleteDestinationTableEvent(table: table));
  }

  void onAddColumn([final String? value]) {
    bloc.add(const TablesSyncAddColumnNameEvent());
  }

  void onDeleteColumn(final String columnName) {
    bloc.add(TablesSyncDeleteColumnNameEvent(columnName: columnName));
  }

  // ignore: avoid_positional_boolean_parameters
  void onChangeShouldAddNewValues(final bool? shouldAdd) {
    if (shouldAdd == null) return;
    bloc.add(TablesSyncShouldAddNewValuesTableEvent(shouldAdd: shouldAdd));
  }

  // ignore: avoid_positional_boolean_parameters
  void onChangeShouldUpdateValues(final bool? shouldUpdate) {
    if (shouldUpdate == null) return;
    bloc.add(
      TablesSyncShouldUpdateValuesTableEvent(shouldUpdate: shouldUpdate),
    );
  }

  // ignore: avoid_positional_boolean_parameters
  void onChangeShouldClearValuesBeforeUpdate(final bool? shouldClear) {
    if (shouldClear == null) return;
    bloc.add(
      TablesSyncShouldClearBeforeUpdateTableEvent(shouldClear: shouldClear),
    );
  }

  void onSubmit() {
    bloc.add(const TablesSyncSaveEvent());
  }
}
