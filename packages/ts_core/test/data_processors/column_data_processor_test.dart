import 'package:flutter_test/flutter_test.dart';
import 'package:ts_core/src/data_processors/column_data_processor.dart';

void main() {
  group('ColumnDataProcessor basics', () {
    final keyData = [
      ['red1'],
      ['red2'],
      ['red3'],
    ];
    final columnValues = [
      ['1'],
      ['2'],
      ['3'],
    ];
    final secondaryKeyData = [
      ['red5'],
      ['red2'],
      ['red1'],
    ];
    final secondaryColumnValues = [
      ['5'],
      ['x'],
      ['red'],
    ];
    final columnProcessor = ColumnDataProcessor.fromKeys(
      columnValues: keyData,
      secondaryColumnValues: secondaryKeyData,
    );

    test('can updateSecondaryValues', () {
      final resultSecondaryValues = columnProcessor.updateColumnData(
        shouldUpdateValues: true,
        shouldInsertNewValues: false,
        shouldClearAllValuesBefore: false,
        columnValues: columnValues,
        secondaryColumnValues: secondaryColumnValues,
      );

      final expectedSecondaryValues = [
        ['5'],
        ['2'],
        ['1'],
      ];

      expect(
        resultSecondaryValues,
        equals(expectedSecondaryValues),
      );
    });
    test('can insertToSecondaryValues', () {
      final resultSecondaryValues = columnProcessor.updateColumnData(
        shouldUpdateValues: false,
        shouldInsertNewValues: true,
        shouldClearAllValuesBefore: false,
        columnValues: columnValues,
        secondaryColumnValues: secondaryColumnValues,
      );

      final expectedSecondaryValues = [
        ...secondaryColumnValues,
        ['3']
      ];

      expect(
        resultSecondaryValues,
        equals(expectedSecondaryValues),
      );
    });
    test('can clearSecondaryValues before action', () {
      final resultSecondaryValues = columnProcessor.updateColumnData(
        shouldUpdateValues: false,
        shouldInsertNewValues: false,
        shouldClearAllValuesBefore: true,
        columnValues: columnValues,
        secondaryColumnValues: secondaryColumnValues,
      );

      final expectedSecondaryValues = [
        [null],
        [null],
        [null],
      ];

      expect(
        resultSecondaryValues,
        equals(expectedSecondaryValues),
      );
    });
  });
  group('ColumnDataProcessor', () {
    final keyData = [
      ['red1'],
      ['red2'],
      ['red3'],
    ];
    final columnValues = [
      ['1'],
      ['2'],
      ['3'],
    ];
    final secondaryKeyData = [
      ['red5'],
      ['red2'],
      ['red1'],
      ['red2'],
      ['red1'],
      ['red2'],
    ];
    final secondaryColumnValues = [
      ['5'],
      ['x'],
      ['tr'],
      ['s'],
      ['v'],
      ['xc'],
    ];
    final columnProcessor = ColumnDataProcessor.fromKeys(
      columnValues: keyData,
      secondaryColumnValues: secondaryKeyData,
    );

    test('can update, insert, clear with duplicate keys', () {
      final expectedSecondaryValues = [
        [null],
        ['2'],
        ['1'],
        ['2'],
        ['1'],
        ['2'],
        ['3'],
      ];
      final resultSecondaryValues = columnProcessor.updateColumnData(
        shouldUpdateValues: true,
        shouldInsertNewValues: true,
        shouldClearAllValuesBefore: true,
        columnValues: columnValues,
        secondaryColumnValues: secondaryColumnValues,
      );
      expect(
        resultSecondaryValues,
        equals(expectedSecondaryValues),
      );
    });
  });
}
