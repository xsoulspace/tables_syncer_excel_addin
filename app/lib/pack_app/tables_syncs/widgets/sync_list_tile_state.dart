part of 'sync_list_tile.dart';

class TableSyncListTileDiDto {
  TableSyncListTileDiDto.use(final Locator read)
      : syncerService = read(),
        syncParamsNotifier = read();
  final ExcelTableSyncerService syncerService;
  final SyncParamsNotifier syncParamsNotifier;
}

TableSyncListTileState useTableSyncListTileState({
  required final Locator read,
  required final TablesSyncParamsModel tablesSync,
}) =>
    use(
      ContextfulLifeHook(
        debugLabel: 'TableSyncListTileState',
        state: TableSyncListTileState(
          diDto: TableSyncListTileDiDto.use(read),
          tablesSync: tablesSync,
        ),
      ),
    );

class TableSyncListTileState extends ContextfulLifeState {
  TableSyncListTileState({
    required this.diDto,
    required this.tablesSync,
  });
  final TablesSyncParamsModel tablesSync;

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
        tablesMap: diDto.syncParamsNotifier.tablesParamsMap,
      );
      if (runtimeSyncParams == null) {
        throw Error();
      }

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
