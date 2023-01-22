part of 'create_table.dart';

class CreateTableDiDto {
  CreateTableDiDto.use(final Locator read) : apiServices = read();
  final ApiServices apiServices;
}

CreateTableState useCreateTableState({
  required final Locator read,
}) =>
    use(
      ContextfulLifeHook(
        debugLabel: 'CreateTableState',
        state: CreateTableState(diDto: CreateTableDiDto.use(read)),
      ),
    );

class CreateTableState extends ContextfulLifeState {
  CreateTableState({
    required this.diDto,
  });

  final CreateTableDiDto diDto;
  final formHelper = FormHelper();

  final headerTopLeftRowIndexController = TextEditingController();
  final headerTopLeftColumnIndexController = TextEditingController();
  final dataTopLeftRowIndexController = TextEditingController();
  final dataTopLeftColumnIndexController = TextEditingController();
  final keysColumnIndexController = TextEditingController();
  final nameController = TextEditingController();

  Future<void> onCreate() async {
    await formHelper.submit(
      onValide: () async {
        final table = TableParamsModel(
          createdAt: DateTime.now(),
          userId: FirebaseAuth.instance.currentUser!.uid,
          id: IdCreator.create(),
          // TODO(arenukvern): get workbook name
          workbookOriginName: '',
          keyColumnIndex: keysColumnIndexController.text.toInt(),
          dataTopLeftColumnIndex: dataTopLeftColumnIndexController.text.toInt(),
          dataTopLeftRowIndex: dataTopLeftRowIndexController.text.toInt(),
          headerTopLeftColumnIndex:
              headerTopLeftColumnIndexController.text.toInt(),
          headerTopLeftRowIndex: headerTopLeftRowIndexController.text.toInt(),
          name: nameController.text,
        );
        await diDto.apiServices.tables.upsertTable(table);
        if (mounted) Navigator.pop(getContext());
      },
    );
  }

  @override
  void dispose() {
    headerTopLeftRowIndexController.dispose();
    headerTopLeftColumnIndexController.dispose();
    dataTopLeftRowIndexController.dispose();
    dataTopLeftColumnIndexController.dispose();
    keysColumnIndexController.dispose();
    nameController.dispose();
    formHelper.dispose();
    super.dispose();
  }
}
