// ignore_for_file: invalid_annotation_target

part of 'models.dart';

@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class UserModel with _$UserModel {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory UserModel({
    @Default('')
        final String id,
    @JsonKey(
      fromJson: localeFromString,
      toJson: localeToString,
    )
        final Locale? locale,
    @Default(ThemeMode.system)
        final ThemeMode themeMode,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(final dynamic json) =>
      _$UserModelFromJson(json as Map<String, dynamic>);
  factory UserModel.fromFirestore(
    final DocumentSnapshot<Map<String, dynamic>> snapshot,
    // ignore: avoid_unused_constructor_parameters
    final SnapshotOptions? options,
  ) {
    final json = snapshot.data();
    return UserModel.fromJson(json);
  }

  static Map<String, Object?> toFirestore(
    final UserModel value,
    final SetOptions? options,
  ) {
    return value.toJson();
  }

  static const empty = UserModel();
}
