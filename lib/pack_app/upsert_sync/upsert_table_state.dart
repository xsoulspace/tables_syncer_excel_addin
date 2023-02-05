part of 'upsert_table.dart';

class UpsertTableDiDto {
  UpsertTableDiDto.use(final Locator read) : apiServices = read();
  final ApiServices apiServices;
}

UpsertTableState useTableParamsState({
  required final Locator read,
  required final TableParamsModel? initialTableParams,
}) =>
    use(
      ContextfulLifeHook(
        debugLabel: 'UpsertTableState',
        state: UpsertTableState(
          diDto: UpsertTableDiDto.use(read),
          initialTableParams: initialTableParams,
        ),
      ),
    );

class UpsertTableState extends ContextfulLifeState {
  UpsertTableState({
    required this.diDto,
    required this.initialTableParams,
  });
  final TableParamsModel? initialTableParams;
  final UpsertTableDiDto diDto;
  final formHelper = FormHelper();

  final headerTopLeftRowIndexController = TextEditingController();
  final headerTopLeftColumnIndexController = TextEditingController();
  final dataTopLeftRowIndexController = TextEditingController();
  final dataTopLeftColumnIndexController = TextEditingController();
  final keysColumnNameController = TextEditingController();
  final nameController = TextEditingController();
  final worksheetNameController = TextEditingController();

  Future<void> onCreate() async {
    await formHelper.submit(
      onValide: () async {
        final table = TableParamsModel(
          worksheetName: worksheetNameController.text,
          createdAt: DateTime.now(),
          userId: FirebaseAuth.instance.currentUser!.uid,
          id: IdCreator.create(),
          // TODO(arenukvern): get workbook name
          workbookOriginName: '',
          keyColumnName: keysColumnNameController.text,
          dataTopLeftCell: CellModel(
            columnIndex: dataTopLeftColumnIndexController.text.toInt(),
            rowIndex: dataTopLeftRowIndexController.text.toInt(),
          ),
          headerTopLeftCell: CellModel(
            columnIndex: headerTopLeftColumnIndexController.text.toInt(),
            rowIndex: headerTopLeftRowIndexController.text.toInt(),
          ),
          name: nameController.text,
        );
        await diDto.apiServices.tables.upsertTable(table);
        if (mounted) Navigator.pop(getContext(), table);
      },
    );
  }

  @override
  void dispose() {
    headerTopLeftRowIndexController.dispose();
    headerTopLeftColumnIndexController.dispose();
    dataTopLeftRowIndexController.dispose();
    dataTopLeftColumnIndexController.dispose();
    keysColumnNameController.dispose();
    nameController.dispose();
    worksheetNameController.dispose();
    formHelper.dispose();
    super.dispose();
  }
}
