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
  final batchService = FirebaseTableSyncApiBatchService();

  Future<void> onReorderSync(
    final int oldIndex,
    final int newIndex,
    final List<QueryDocumentSnapshot<TablesSyncParamsModel>> docs,
  ) async {
    int index = newIndex;
    if (oldIndex < newIndex) {
      index -= 1;
    }
    final updatedDocs = [...docs];
    final item = updatedDocs.removeAt(oldIndex);
    updatedDocs.insert(index, item);
    final batch = batchService.getBatch();
    for (var i = 0; i < updatedDocs.length; i++) {
      final doc = updatedDocs[i];
      final syncParams = doc.data();
      if (syncParams.index != i) {
        batch.set(doc.reference, {'index': i}, SetOptions(merge: true));
      }
    }
    await batch.commit();
  }
}
