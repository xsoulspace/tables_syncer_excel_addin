part of './tables_syncs.dart';

class TablesSyncsListDiDto {
  TablesSyncsListDiDto.use(final Locator read)
      : syncerService = read(),
        syncerParamsNotifier = read();
  final ExcelTableSyncerService syncerService;
  final SyncParamsNotifier syncerParamsNotifier;
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
}
