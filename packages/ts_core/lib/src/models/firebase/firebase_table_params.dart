// ignore_for_file: invalid_annotation_target

part of 'firebase.dart';

typedef FirebaseTableParamsId = String;

@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class FirebaseTableParams with _$FirebaseTableParams {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory FirebaseTableParams({
    required final FirebaseTableParamsId id,
    required final String workbookOriginName,
    required final int topLeftColumnIndex,
    required final int topLeftRowIndex,
    required final List<String> columnNames,
    required final bool shouldUpdateValues,
    required final bool shouldAddNewValues,
  }) = _FirebaseTableParams;

  const FirebaseTableParams._();

  factory FirebaseTableParams.fromJson(final Map<String, dynamic> json) =>
      _$FirebaseTableParamsFromJson(json);
}
