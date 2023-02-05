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
  void onEditTable(final TableParamsModel table) {}
  void onDeleteTable(final TableParamsModel table) {}
}
