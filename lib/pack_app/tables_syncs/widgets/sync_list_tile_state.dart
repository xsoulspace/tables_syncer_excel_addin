part of 'sync_list_tile.dart';

class TableSyncListTileDiDto {
  TableSyncListTileDiDto.use(final Locator read)
      : syncerService = read(),
        syncerParamsNotifier = read();
  final ExcelTableSyncerService syncerService;
  final SyncParamsNotifier syncerParamsNotifier;
}

TableSyncListTileState useTableSyncListTileState({
  required final Locator read,
}) =>
    use(
      ContextfulLifeHook(
        debugLabel: 'TableSyncListTileState',
        state: TableSyncListTileState(diDto: TableSyncListTileDiDto.use(read)),
      ),
    );

class TableSyncListTileState extends ContextfulLifeState {
  TableSyncListTileState({
    required this.diDto,
  });

  final TableSyncListTileDiDto diDto;
  bool _isHovering = false;

  bool get isHovering => _isHovering;

  set isHovering(final bool value) {
    _isHovering = value;
    setState();
  }

  bool _syncing = false;
  bool isSyncingFailed = false;
  bool isSyncingCompleted = false;

  bool get syncing => _syncing;

  set syncing(final bool value) {
    _syncing = value;
    setState();
  }

  void onEditSync(final TablesSyncParamsModel tablesSync) {
    showUpsertTableSyncDialog(getContext(), syncId: tablesSync.id);
  }

  Future<void> onSync(final TablesSyncParamsModel syncParams) async {
    try {
      isSyncingFailed = false;
      isSyncingCompleted = false;
      syncing = true;
      final runtimeSyncParams = SyncParamsNormalizer.normalize(
        syncParams: syncParams,
        tablesMap: diDto.syncerParamsNotifier.tablesParamsMap,
      );

      await diDto.syncerService
          .syncTables(runtimeSyncParams: runtimeSyncParams);
      isSyncingCompleted = true;
      syncing = false;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      isSyncingFailed = true;
      syncing = false;

      rethrow;
    }
  }

  void onDeleteSync(final TablesSyncParamsModel syncParams) {
    showDeleteTablesSyncDialog(getContext(), tablesSync: syncParams);
  }
}
