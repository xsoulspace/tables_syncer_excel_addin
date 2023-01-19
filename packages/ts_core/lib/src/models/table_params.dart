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
    @Default('') final String name,
    @Default(0) final int topLeftColumnIndex,
    @Default(0) final int topLeftRowIndex,
    @Default(0) final int headerRowIndex,
    @Default(0) final int firstRowIndex,
    @Default(0) final int keyColumnIndex,
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
}
