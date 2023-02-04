part of 'tables_sync.dart';

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
  void onSelectSourceTable(final AutoSuggestBoxItem<TableParamsModel> item) {
    bloc.add(TablesSyncSelectSourceTableEvent(table: item.value));
  }

  @override
  void initState() {
    super.initState();
    bloc.add(const TablesSyncInitEvent());
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
  void onChangeShouldAddNewValues(final bool shouldAdd) {
    bloc.add(TablesSyncShouldAddNewValuesTableEvent(shouldAdd: shouldAdd));
  }

  // ignore: avoid_positional_boolean_parameters
  void onChangeShouldUpdateValues(final bool shouldUpdate) {
    bloc.add(
      TablesSyncShouldUpdateValuesTableEvent(shouldUpdate: shouldUpdate),
    );
  }

  void onSubmit() {
    bloc.add(const TablesSyncSaveEvent());
  }
}
