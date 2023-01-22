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
    required final TableParamsModelId sourceTableId,
    required final List<TableParamsModelId> destinationTablesIds,
    required final List<String> columnNames,
    required final bool shouldUpdateValues,
    required final bool shouldAddNewValues,
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
    final TablesSyncParamsModel value,
    final SetOptions? options,
  ) {
    return value.toJson();
  }
}
