import '../models/models.dart';

abstract class ExcelTableApi {}

class ExcelTablesMockApi extends ExcelTableApi {
  ExcelTablesMockApi({
    required this.tables,
    required this.tablesHeaders,
  });
  final Map<CellModel, ExcelTableStringData> tables;
  final Map<CellModel, ExcelTableStringData> tablesHeaders;
}
