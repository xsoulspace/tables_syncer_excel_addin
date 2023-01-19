part of 'create_sync.dart';

class CreateTablesSyncDiDto {
  CreateTablesSyncDiDto.use(final Locator read) : syncParamsNotifier = read();
  final SyncParamsNotifier syncParamsNotifier;
}

CreateTablesSyncState useCreateTablesSyncState({required final Locator read}) =>
    use(
      ContextfulLifeHook(
        debugLabel: 'CreateTablesSyncState',
        state: CreateTablesSyncState(diDto: CreateTablesSyncDiDto.use(read)),
      ),
    );

class CreateTablesSyncState extends ContextfulLifeState {
  CreateTablesSyncState({
    required this.diDto,
  });

  final CreateTablesSyncDiDto diDto;
  final isFilledNotifier = ValueNotifier<bool>(false);
  final newColumnController = TextEditingController();
  final syncColumnsSetNotifier = ValueNotifier<Set<String>>({});

  void onAddSyncColumn([final String? column]) {
    final text = newColumnController.text;
    if (text.isEmpty) return;
    syncColumnsSetNotifier.value = {...syncColumnsSetNotifier.value, text};
    newColumnController.clear();
  }

  void onDeleteSyncColumn(final String column) {
    syncColumnsSetNotifier.value = {...syncColumnsSetNotifier.value}
      ..remove(column);
  }

  final sourceTableNotifier = ValueNotifier<TableParamsModel?>(null);

  void onDeleteDestination(final int index) {
    destinationTablesNotifier.value = [...destinationTablesNotifier.value]
      ..removeAt(index);
  }

  void onAddDestination(final TableParamsModel table) {
    destinationTablesNotifier.value = [
      ...destinationTablesNotifier.value,
      table
    ];
  }

  final destinationTablesNotifier = ValueNotifier<List<TableParamsModel>>([]);
  void onAddNewTable() {
    showCreateTableDialog(getContext());
  }

  void _validate() {
    if (destinationTablesNotifier.value.isEmpty) {
      isFilledNotifier.value = false;
      return;
    }
    if (sourceTableNotifier.value == null) {
      isFilledNotifier.value = false;
      return;
    }

    if (syncColumnsSetNotifier.value.isEmpty) {
      isFilledNotifier.value = false;
      return;
    }
  }

  void onSubmit() {
    _validate();
    if (!isFilledNotifier.value) return;
    //
  }

  @override
  void dispose() {
    newColumnController.dispose();
    isFilledNotifier.dispose();
    super.dispose();
  }
}
