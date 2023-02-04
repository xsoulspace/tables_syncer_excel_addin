import 'package:office_addin_helper/office_addin_helper.dart';

class ExcelTableMockApi implements ExcelTableApi {
  ExcelTableMockApi({
    required this.tables,
  });
  final Map<CellModel, List<List<dynamic>?>> tables;

  @override
  Future<ExcelLiveRange> getColumnRange({
    required final CellModel topLeftCell,
    final int relativeColumnIndex = 0,
    final bool shouldInsertUnderLastRow = false,
    final bool keepRangeAlive = false,
    final int? rowsCount,
  }) async {
    final values = tables[topLeftCell]!;
    final int rowIndex;
    if (shouldInsertUnderLastRow) {
      rowIndex = values.length;
    } else {
      rowIndex = 0;
    }
    return ExcelLiveRange.mock(
      rowsCount: rowsCount ?? values.length,
      columnsCount: 1,
      relativeTopLeftCell: CellModel(
        rowIndex: rowIndex,
        columnIndex: relativeColumnIndex,
      ),
      topLeftCell: topLeftCell,
    );
  }

  @override
  Future<ExcelLiveRange> getRowRange({
    required final CellModel topLeftCell,
    final bool keepRangeAlive = false,
    final int relativeRowIndex = 0,
  }) async {
    final values = tables[topLeftCell]!;
    return ExcelLiveRange.mock(
      rowsCount: 1,
      columnsCount: values.first!.length,
      relativeTopLeftCell: CellModel(
        rowIndex: relativeRowIndex,
        columnIndex: 0,
      ),
      topLeftCell: topLeftCell,
    );
  }

  @override
  Future<ExcelTableData> loadRangeValues({
    required final ExcelLiveRange range,
  }) async {
    final values = tables[range.topLeftCell]!;
    return values
        .getRange(
      range.relativeTopLeftCell.rowIndex,
      range.relativeTopLeftCell.rowIndex + range.rowsCount,
    )
        .map((final e) {
      return e!
          .getRange(
            range.relativeTopLeftCell.columnIndex,
            range.relativeTopLeftCell.columnIndex + range.columnsCount,
          )
          .toList();
    }).toList();
  }

  @override
  Future<void> updateRangeValues({
    required final ExcelLiveRange range,
    required final ExcelTableData values,
  }) async {
    final oldValues = tables[range.topLeftCell]!;
    final topLeftCell = range.relativeTopLeftCell;
    final List<List<dynamic>?> rangeValues = [...oldValues];

    for (var index = 0; index < values.length; index++) {
      final rowIndex = range.relativeTopLeftCell.rowIndex + index;
      final List<dynamic> effectiveRowValues;
      if (rowIndex < rangeValues.length) {
        effectiveRowValues = [...?rangeValues[rowIndex]];
      } else {
        effectiveRowValues =
            List.filled(rangeValues.first?.length ?? range.columnsCount, null);
        rangeValues.length = rowIndex + 1;
      }
      final rowValues = values[index];
      effectiveRowValues.setRange(
        topLeftCell.columnIndex,
        topLeftCell.columnIndex + range.columnsCount,
        rowValues,
      );
      rangeValues[rowIndex] = [...effectiveRowValues];
    }
    tables[range.topLeftCell] = rangeValues;
  }
}
