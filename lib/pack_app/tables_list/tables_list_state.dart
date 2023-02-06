part of 'tables_list.dart';

class TablesListDiDto {
  // ignore: avoid_unused_constructor_parameters
  TablesListDiDto.use(final Locator read);
}

TablesListState useTablesListState({required final Locator read}) => use(
      ContextfulLifeHook(
        debugLabel: 'TablesListState',
        state: TablesListState(diDto: TablesListDiDto.use(read)),
      ),
    );

class TablesListState extends ContextfulLifeState {
  TablesListState({
    required this.diDto,
  });
  final TablesListDiDto diDto;
  Future<void> onEditTable(final TableParamsModel table) async {
    await showUpsertTableDialog(
      getContext(),
      initialTableParams: table,
    );
  }

  void onDeleteTable(final TableParamsModel table) {
    showDeleteTableDialog(getContext(), table: table);
  }
}
