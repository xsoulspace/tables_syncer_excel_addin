part of 'create_sync.dart';

class CreateTablesSyncDiDto {
  CreateTablesSyncDiDto.use(final Locator read) : syncParamsNotifier = read();
  final SyncParamsNotifier syncParamsNotifier;
}

CreateTablesSyncState useCreateTablesSyncState({required final Locator read}) =>
    use(
      LifeHook(
        debugLabel: 'CreateTablesSyncState',
        state: CreateTablesSyncState(diDto: CreateTablesSyncDiDto.use(read)),
      ),
    );

class CreateTablesSyncState extends LifeState {
  CreateTablesSyncState({
    required this.diDto,
  });

  final CreateTablesSyncDiDto diDto;
  final isFilledNotifier = ValueNotifier<bool>(false);
  TableParamsModel? _sourceTable;
  TableParamsModel? get sourceTable => _sourceTable;
  set sourceTable(final TableParamsModel? sourceTable) {
    _sourceTable = sourceTable;
    setState();
  }

  void onDeleteDestination(final int index) {
    destinationSheets.removeAt(index);
    setState();
  }

  void onAddDestination(final TableParamsModel table) {
    destinationSheets.add(table);
    setState();
  }

  final destinationSheets = <TableParamsModel>[];
  void onAddNewTable() {}
  void onSubmit() {}

  @override
  void dispose() {
    isFilledNotifier.value = false;
    super.dispose();
  }
}
