// ignore_for_file: invalid_annotation_target

part of 'firebase.dart';

@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class FirebaseSyncParams with _$FirebaseSyncParams {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory FirebaseSyncParams({
    required final FirebaseTableParamsId sourceTableId,
    required final List<FirebaseTableParamsId> destinationTablesIds,
  }) = _FirebaseSyncParams;

  const FirebaseSyncParams._();

  factory FirebaseSyncParams.fromJson(final Map<String, dynamic> json) =>
      _$FirebaseSyncParamsFromJson(json);
}
