// ignore_for_file: invalid_annotation_target

part of 'models.dart';

typedef TableParamsModelId = String;

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
    @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
        required final DateTime createdAt,
    required final String worksheetName,
    @Default('') final String keyColumnName,
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
    worksheetName: '',
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
