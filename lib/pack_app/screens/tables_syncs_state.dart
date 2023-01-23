part of './tables_syncs.dart';

class TablesSyncsListDiDto {
  // ignore: avoid_unused_constructor_parameters
  TablesSyncsListDiDto.use(final Locator read);
}

TablesSyncsListState useTablesSyncsListState({required final Locator read}) =>
    use(
      ContextfulLifeHook(
        debugLabel: 'TablesSyncsListState',
        state: TablesSyncsListState(diDto: TablesSyncsListDiDto.use(read)),
      ),
    );

class TablesSyncsListState extends ContextfulLifeState {
  TablesSyncsListState({
    required this.diDto,
  });
  final TablesSyncsListDiDto diDto;
  void onEditSync(final TablesSyncParamsModel tablesSync) {}
}
