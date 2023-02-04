import '../models/models.dart';

abstract class ExcelLiveRange {
  ExcelLiveRange({
    required this.rowsCount,
    required this.columnsCount,
  });
  final int rowsCount;
  final int columnsCount;
  void close();
}

abstract class ExcelTableApi {
  Future<ExcelLiveRange> getRowRange({
    required final CellModel topLeftCell,
    required final bool keepRangeAlive,
  });
  Future<ExcelLiveRange> getColumnRange({
    required final CellModel topLeftCell,
    required final int relativeIndex,
    required final bool keepRangeAlive,
  });
  Future<ExcelTableData> loadRangeValues({
    required final ExcelLiveRange range,
  });
  Future<ExcelTableData> updateRangeValues({
    required final ExcelLiveRange range,
    required final ExcelTableData values,
  });
}

class ExcelTableMockApi implements ExcelTableApi {
  ExcelTableMockApi({
    required this.tables,
    required this.tablesHeaders,
  });
  final Map<CellModel, ExcelTableStringData> tables;
  final Map<CellModel, ExcelTableStringData> tablesHeaders;

  @override
  Future<ExcelLiveRange> getColumnRange({
    required final CellModel topLeftCell,
    required final int relativeIndex,
    required final bool keepRangeAlive,
  }) {
    // TODO: implement getColumnRange
    throw UnimplementedError();
  }

  @override
  Future<ExcelLiveRange> getRowRange({
    required final CellModel topLeftCell,
    required final bool keepRangeAlive,
  }) {
    // TODO: implement getRowRange
    throw UnimplementedError();
  }

  @override
  Future<ExcelTableData> loadRangeValues({
    required final ExcelLiveRange range,
  }) {
    // TODO: implement loadRangeValues
    throw UnimplementedError();
  }

  @override
  Future<ExcelTableData> updateRangeValues({
    required final ExcelLiveRange range,
    required final ExcelTableData values,
  }) {
    // TODO: implement updateRangeValues
    throw UnimplementedError();
  }
}
