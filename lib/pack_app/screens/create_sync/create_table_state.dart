part of 'create_table.dart';

class CreateTableDiDto {
  CreateTableDiDto.use(final Locator read) : apiServices = read();
  final ApiServices apiServices;
}

CreateTableState useCreateTableState({
  required final Locator read,
}) =>
    use(
      LifeHook(
        debugLabel: 'CreateTableState',
        state: CreateTableState(diDto: CreateTableDiDto.use(read)),
      ),
    );

class CreateTableState extends LifeState {
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
