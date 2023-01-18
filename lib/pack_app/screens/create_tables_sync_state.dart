part of 'create_tables_sync.dart';

CreateTablesSyncState useCreateTablesSyncState() => use(
      LifeHook(
        debugLabel: 'CreateTablesSyncState',
        state: CreateTablesSyncState(),
      ),
    );

class CreateTablesSyncState extends LifeState {
  CreateTablesSyncState();
  final isFilledNotifier = ValueNotifier<bool>(false);

  void onSubmit() {}

  @override
  void dispose() {
    isFilledNotifier.value = false;
    super.dispose();
  }
}
