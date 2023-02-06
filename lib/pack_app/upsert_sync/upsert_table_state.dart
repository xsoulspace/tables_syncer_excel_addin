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
  @override
  void initState() {
    super.initState();
    headerTopLeftRowIndexController.text =
        initialTableParams?.headerTopLeftCell.relativeRowIndex.toString() ?? '';
    headerTopLeftColumnIndexController.text =
        initialTableParams?.headerTopLeftCell.relativeColumnIndex.toString() ??
            '';
    dataTopLeftRowIndexController.text =
        initialTableParams?.dataTopLeftCell.relativeRowIndex.toString() ?? '';
    dataTopLeftColumnIndexController.text =
        initialTableParams?.dataTopLeftCell.relativeColumnIndex.toString() ??
            '';
    keysColumnNameController.text = initialTableParams?.keyColumnName ?? '';
    nameController.text = initialTableParams?.name ?? '';
    worksheetNameController.text = initialTableParams?.worksheetName ?? '';
  }

  Future<void> onCreate() async {
    await formHelper.submit(
      onValide: () async {
        final table = TableParamsModel(
          worksheetName: worksheetNameController.text,
          createdAt: initialTableParams?.createdAt ?? DateTime.now(),
          userId: FirebaseAuth.instance.currentUser!.uid,
          id: initialTableParams?.id ?? IdCreator.create(),
          // TODO(arenukvern): get workbook name
          workbookOriginName: initialTableParams?.workbookOriginName ?? '',
          keyColumnName: keysColumnNameController.text,
          dataTopLeftCell: CellModel(
            /// converting from relative to absolute
            columnIndex: dataTopLeftColumnIndexController.text.toInt() - 1,

            /// converting from relative to absolute
            rowIndex: dataTopLeftRowIndexController.text.toInt() - 1,
          ),
          headerTopLeftCell: CellModel(
            /// converting from relative to absolute
            columnIndex: headerTopLeftColumnIndexController.text.toInt() - 1,

            /// converting from relative to absolute
            rowIndex: headerTopLeftRowIndexController.text.toInt() - 1,
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
