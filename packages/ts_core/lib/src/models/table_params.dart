// ignore_for_file: invalid_annotation_target

part of 'models.dart';

typedef TableParamsModelId = String;
typedef ExcelTableData = List<List<dynamic>>;
typedef ExcelTableStringData = List<List<String>>;

@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class TableParamsModel with _$TableParamsModel {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory TableParamsModel({
    required final TableParamsModelId id,
    required final String workbookOriginName,
    required final String userId,
    required final String keyColumnName,
    @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
        required final DateTime createdAt,
    @Default('') final String name,
    @Default(CellModel.zero) final CellModel headerTopLeftCell,
    @Default(CellModel.zero) final CellModel dataTopLeftCell,
  }) = _TableParamsModel;

  const TableParamsModel._();

  factory TableParamsModel.fromJson(final dynamic json) =>
      _$TableParamsModelFromJson(json as Map<String, dynamic>);
  factory TableParamsModel.fromFirestore(
    final DocumentSnapshot<Map<String, dynamic>> snapshot,
    // ignore: avoid_unused_constructor_parameters
    final SnapshotOptions? options,
  ) {
    final json = snapshot.data();
    return TableParamsModel.fromJson(json);
  }

  static Map<String, Object?> toFirestore(
    final TableParamsModel value,
    final SetOptions? options,
  ) {
    return value.toJson();
  }

  static final empty = TableParamsModel(
    createdAt: DateTime.now(),
    id: '',
    userId: '',
    workbookOriginName: '',
    keyColumnName: '',
  );
}

@immutable
@Freezed(
  fromJson: false,
  toJson: false,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class TableHeadersModel with _$TableHeadersModel {
  const factory TableHeadersModel({
    /// For example:
    /// [
    ///   ['ids', 'color', 'quantity'],
    /// ]
    required final List<List<String>> data,
    required final CellModel topLeftCell,
    required final Map<String, int> indexesMap,
  }) = _TableHeadersModel;
}

@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class CellModel with _$CellModel {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory CellModel({
    required final int rowIndex,
    required final int columnIndex,
  }) = _CellModel;
  const CellModel._();

  factory CellModel.fromJson(final dynamic json) =>
      _$CellModelFromJson(json as Map<String, dynamic>);

  static const zero = CellModel(columnIndex: 0, rowIndex: 0);
}

@immutable
@Freezed(
  fromJson: false,
  toJson: false,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class IndexedValueModel with _$IndexedValueModel {
  const factory IndexedValueModel({
    required final List<int> rowIndexes,
    required final int originRowIndex,
  }) = _IndexedValueModel;
}

@immutable
@Freezed(
  fromJson: false,
  toJson: false,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class IndexedKeysChangesModel with _$IndexedKeysChangesModel {
  const factory IndexedKeysChangesModel({
    required final IndexedKeysWithOriginMap newValues,
    required final IndexedKeysWithOriginMap updatableValues,
  }) = _IndexedKeysChangesModel;
}
