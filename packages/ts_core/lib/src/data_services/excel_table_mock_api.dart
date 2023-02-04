import '../../ts_core.dart';

abstract class ExcelLiveRange {
  ExcelLiveRange({
    required this.rowsCount,
    required this.columnsCount,
    required this.topLeftCell,
    required this.relativeTopLeftCell,
  });
  const factory ExcelLiveRange.mock({
    required final int rowsCount,
    required final int columnsCount,
    required final CellModel topLeftCell,
    required final CellModel relativeTopLeftCell,
  }) = ExcelLiveMockRange;
  final int rowsCount;
  final int columnsCount;
  final CellModel topLeftCell;
  final CellModel relativeTopLeftCell;
  void close();
}

class ExcelLiveMockRange implements ExcelLiveRange {
  const ExcelLiveMockRange({
    required this.rowsCount,
    required this.columnsCount,
    required this.topLeftCell,
    required this.relativeTopLeftCell,
  });
  @override
  final int rowsCount;
  @override
  final int columnsCount;
  @override
  final CellModel topLeftCell;
  @override
  final CellModel relativeTopLeftCell;
  @override
  void close() {}
}

abstract class ExcelTableApi {
  Future<ExcelLiveRange> getRowRange({
    required final CellModel topLeftCell,
    final bool keepRangeAlive = false,
    final int relativeRowIndex = 0,
  });
  Future<ExcelLiveRange> getColumnRange({
    required final CellModel topLeftCell,
    final bool keepRangeAlive = false,
    final int relativeColumnIndex = 0,
  });
  Future<ExcelTableData> loadRangeValues({
    required final ExcelLiveRange range,
  });
  Future<void> updateRangeValues({
    required final ExcelLiveRange range,
    required final ExcelTableData values,
  });
}

class ExcelTableMockApi implements ExcelTableApi {
  ExcelTableMockApi({
    required this.tables,
  });
  final Map<CellModel, ExcelTableData> tables;

  @override
  Future<ExcelLiveRange> getColumnRange({
    required final CellModel topLeftCell,
    final int relativeColumnIndex = 0,
    final bool keepRangeAlive = false,
  }) async {
    final values = tables[topLeftCell]!;
    return ExcelLiveRange.mock(
      rowsCount: values.length,
      columnsCount: 1,
      relativeTopLeftCell: CellModel(
        rowIndex: 0,
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
      columnsCount: values.first.length,
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
      return e
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
    final List<List<dynamic>> rangeValues = oldValues
        .getRange(
          range.relativeTopLeftCell.rowIndex,
          range.relativeTopLeftCell.rowIndex + range.rowsCount,
        )
        .toList();

    for (var rowIndex = 0; rowIndex < rangeValues.length; rowIndex++) {
      final oldRowValues = rangeValues[rowIndex];
      final rowValues = values[rowIndex];
      oldRowValues.setRange(
        range.relativeTopLeftCell.columnIndex,
        range.relativeTopLeftCell.columnIndex + range.columnsCount,
        rowValues,
      );
      rangeValues[rowIndex] = oldRowValues;
    }
    tables[range.topLeftCell] = rangeValues;
  }
}
