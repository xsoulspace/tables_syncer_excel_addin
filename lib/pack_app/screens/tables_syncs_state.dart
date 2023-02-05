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
  void onEditSync(final TablesSyncParamsModel tablesSync) {}
  Future<void> onSync(final TablesSyncParamsModel syncParams) async {
    final runtimeSyncParams = SyncParamsNormalizer.normalize(
      syncParams: syncParams,
      tablesMap: diDto.syncerParamsNotifier.tablesParamsMap,
    );

    await diDto.syncerService.syncTables(runtimeSyncParams: runtimeSyncParams);
  }

  void onDeleteSync(final TablesSyncParamsModel syncParams) {}
}
