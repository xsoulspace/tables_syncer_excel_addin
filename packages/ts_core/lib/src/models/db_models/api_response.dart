// ignore_for_file: invalid_annotation_target

part of '../models.dart';

@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
  unionValueCase: FreezedUnionCase.pascal,
  unionKey: 'runtime_type',
  genericArgumentFactories: true,
)
class ApiResponse<T> with _$ApiResponse {
  @JsonSerializable(
    explicitToJson: true,
    genericArgumentFactories: true,
  )
  const factory ApiResponse.successfulDataResponse({
    @JsonKey(name: 'data') required final T data,
  }) = SuccessfulDataResponse;
  @JsonSerializable(
    explicitToJson: true,
    genericArgumentFactories: true,
  )
  const factory ApiResponse.successfulVoidResponse() = SuccessfulVoidResponse;

  @JsonSerializable(
    explicitToJson: true,
    genericArgumentFactories: true,
  )
  const factory ApiResponse.badResponse({
    @Default([])
    @JsonKey(name: 'errors')
        final List<ResponseErrorDescription> errors,
  }) = BadResponse;
  factory ApiResponse.fromJson(
    final Map<String, dynamic> json,
    final T Function(dynamic json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

@JsonSerializable(
  genericArgumentFactories: true,
  createToJson: false,
)
class MixedResponse<T> {
  MixedResponse({
    this.data,
    this.errors,
  });
  factory MixedResponse.fromJson(
    final Map<String, dynamic> json,
    final T Function(dynamic json) fromJsonT,
  ) =>
      _$MixedResponseFromJson(json, fromJsonT);
  final T? data;
  final List<ResponseErrorDescription>? errors;

  ApiResponse<T> toApiResponse() {
    if (isOk) {
      final effectiveData = data;
      if (effectiveData == null) return const SuccessfulVoidResponse();
      return SuccessfulDataResponse<T>(data: effectiveData);
    }

    return BadResponse<T>(errors: errors ?? []);
  }

  bool get isOk => errors == null || errors?.isEmpty == true;
}

@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class ResponseErrorDescription with _$ResponseErrorDescription {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory ResponseErrorDescription({
    required final String code,
    required final String id,
    required final String message,
    final String? detail,
    final String? status,
  }) = _ResponseErrorDescription;
  factory ResponseErrorDescription.fromJson(final dynamic json) =>
      _$ResponseErrorDescriptionFromJson(json as Map<String, dynamic>);
  const ResponseErrorDescription._();

  String get readableString => message;
}
