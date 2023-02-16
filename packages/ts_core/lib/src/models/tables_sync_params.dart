// ignore_for_file: invalid_annotation_target

part of 'models.dart';

typedef TablesSyncParamsModelId = String;

@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class TablesSyncParamsModel with _$TablesSyncParamsModel {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory TablesSyncParamsModel({
    required final TablesSyncParamsModelId id,
    required final String userId,
    @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
        required final DateTime createdAt,
    required final TableParamsModelId sourceTableId,
    required final List<TableParamsModelId> destinationTablesIds,
    required final List<String> columnNames,
    required final bool shouldUpdateValues,
    required final bool shouldAddNewValues,
    required final bool shouldClearValueBeforeUpdate,
    @Default('') final String keyColumnName,
    @Default(0) final int index,
    @Default(false) final bool shouldAddNewHeaders,
    @Default('') final String workbookName,
    @Default('') final String name,
    @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
        final DateTime? lastSyncAt,
  }) = _TablesSyncParamsModel;

  const TablesSyncParamsModel._();

  factory TablesSyncParamsModel.fromJson(final dynamic json) =>
      _$TablesSyncParamsModelFromJson(json as Map<String, dynamic>);
  factory TablesSyncParamsModel.fromFirestore(
    final DocumentSnapshot<Map<String, dynamic>> snapshot,
    // ignore: avoid_unused_constructor_parameters
    final SnapshotOptions? options,
  ) {
    final json = snapshot.data();
    return TablesSyncParamsModel.fromJson(json);
  }

  static Map<String, Object?> toFirestore(
    final Object value,
    final SetOptions? options,
  ) {
    if (value is TablesSyncParamsModel) {
      return value.toJson();
    } else if (value is Map && options?.merge == true) {
      return value as Map<String, Object?>;
    } else {
      throw ArgumentError.value(value);
    }
  }
}

/// This model is used only for runtime and should not be used for
/// server-side api calls.
@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class TablesSyncParamsRuntimeModel with _$TablesSyncParamsRuntimeModel {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory TablesSyncParamsRuntimeModel({
    required final TablesSyncParamsModelId id,
    required final String userId,
    @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
        required final DateTime createdAt,
    required final List<String> columnNames,
    required final bool shouldUpdateValues,
    required final bool shouldAddNewValues,
    required final bool shouldClearValueBeforeUpdate,
    required final String keyColumnName,
    final TableParamsModel? sourceTable,
    @Default(false) final bool shouldAddNewHeaders,
    @Default([]) final List<TableParamsModel> destinationTables,
    @Default('') final String workbookName,
    @Default('') final String name,
    @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
        final DateTime? lastSyncAt,
  }) = _TablesSyncParamsRuntimeModel;

  const TablesSyncParamsRuntimeModel._();
  factory TablesSyncParamsRuntimeModel.fromJson(final dynamic json) =>
      _$TablesSyncParamsRuntimeModelFromJson(json as Map<String, dynamic>);

  factory TablesSyncParamsRuntimeModel.fromModel({
    required final TablesSyncParamsModel syncParams,
    required final Map<TableParamsModelId, TableParamsModel> tablesParams,
  }) {
    final sourceTable = tablesParams[syncParams.sourceTableId];
    final json = syncParams.toJson()..['sourceTable'] = sourceTable?.toJson();

    return TablesSyncParamsRuntimeModel.fromJson(json).copyWith(
      destinationTables: syncParams.destinationTablesIds
          .map((final tableId) {
            return tablesParams[tableId];
          })
          .whereNotNull()
          .toList(),
    );
  }
}
