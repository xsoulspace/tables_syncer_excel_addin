// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResponse<T> _$ApiResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  switch (json['runtime_type']) {
    case 'SuccessfulDataResponse':
      return SuccessfulDataResponse<T>.fromJson(json, fromJsonT);
    case 'SuccessfulVoidResponse':
      return SuccessfulVoidResponse<T>.fromJson(json, fromJsonT);
    case 'BadResponse':
      return BadResponse<T>.fromJson(json, fromJsonT);

    default:
      throw CheckedFromJsonException(json, 'runtime_type', 'ApiResponse',
          'Invalid union type "${json['runtime_type']}"!');
  }
}

/// @nodoc
mixin _$ApiResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'data') T data)
        successfulDataResponse,
    required TResult Function() successfulVoidResponse,
    required TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)
        badResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult? Function()? successfulVoidResponse,
    TResult? Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult Function()? successfulVoidResponse,
    TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfulDataResponse<T> value)
        successfulDataResponse,
    required TResult Function(SuccessfulVoidResponse<T> value)
        successfulVoidResponse,
    required TResult Function(BadResponse<T> value) badResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult? Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult? Function(BadResponse<T> value)? badResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult Function(BadResponse<T> value)? badResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessfulDataResponseCopyWith<T, $Res> {
  factory _$$SuccessfulDataResponseCopyWith(_$SuccessfulDataResponse<T> value,
          $Res Function(_$SuccessfulDataResponse<T>) then) =
      __$$SuccessfulDataResponseCopyWithImpl<T, $Res>;
  @useResult
  $Res call({@JsonKey(name: 'data') T data});
}

/// @nodoc
class __$$SuccessfulDataResponseCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$SuccessfulDataResponse<T>>
    implements _$$SuccessfulDataResponseCopyWith<T, $Res> {
  __$$SuccessfulDataResponseCopyWithImpl(_$SuccessfulDataResponse<T> _value,
      $Res Function(_$SuccessfulDataResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessfulDataResponse<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class _$SuccessfulDataResponse<T> implements SuccessfulDataResponse<T> {
  const _$SuccessfulDataResponse(
      {@JsonKey(name: 'data') required this.data, final String? $type})
      : $type = $type ?? 'SuccessfulDataResponse';

  factory _$SuccessfulDataResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$SuccessfulDataResponseFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'data')
  final T data;

  @JsonKey(name: 'runtime_type')
  final String $type;

  @override
  String toString() {
    return 'ApiResponse<$T>.successfulDataResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessfulDataResponse<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessfulDataResponseCopyWith<T, _$SuccessfulDataResponse<T>>
      get copyWith => __$$SuccessfulDataResponseCopyWithImpl<T,
          _$SuccessfulDataResponse<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'data') T data)
        successfulDataResponse,
    required TResult Function() successfulVoidResponse,
    required TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)
        badResponse,
  }) {
    return successfulDataResponse(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult? Function()? successfulVoidResponse,
    TResult? Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
  }) {
    return successfulDataResponse?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult Function()? successfulVoidResponse,
    TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
    required TResult orElse(),
  }) {
    if (successfulDataResponse != null) {
      return successfulDataResponse(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfulDataResponse<T> value)
        successfulDataResponse,
    required TResult Function(SuccessfulVoidResponse<T> value)
        successfulVoidResponse,
    required TResult Function(BadResponse<T> value) badResponse,
  }) {
    return successfulDataResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult? Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult? Function(BadResponse<T> value)? badResponse,
  }) {
    return successfulDataResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult Function(BadResponse<T> value)? badResponse,
    required TResult orElse(),
  }) {
    if (successfulDataResponse != null) {
      return successfulDataResponse(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$SuccessfulDataResponseToJson<T>(this, toJsonT);
  }
}

abstract class SuccessfulDataResponse<T> implements ApiResponse<T> {
  const factory SuccessfulDataResponse(
          {@JsonKey(name: 'data') required final T data}) =
      _$SuccessfulDataResponse<T>;

  factory SuccessfulDataResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$SuccessfulDataResponse<T>.fromJson;

  @JsonKey(name: 'data')
  T get data;
  @JsonKey(ignore: true)
  _$$SuccessfulDataResponseCopyWith<T, _$SuccessfulDataResponse<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessfulVoidResponseCopyWith<T, $Res> {
  factory _$$SuccessfulVoidResponseCopyWith(_$SuccessfulVoidResponse<T> value,
          $Res Function(_$SuccessfulVoidResponse<T>) then) =
      __$$SuccessfulVoidResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$SuccessfulVoidResponseCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$SuccessfulVoidResponse<T>>
    implements _$$SuccessfulVoidResponseCopyWith<T, $Res> {
  __$$SuccessfulVoidResponseCopyWithImpl(_$SuccessfulVoidResponse<T> _value,
      $Res Function(_$SuccessfulVoidResponse<T>) _then)
      : super(_value, _then);
}

/// @nodoc

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class _$SuccessfulVoidResponse<T> implements SuccessfulVoidResponse<T> {
  const _$SuccessfulVoidResponse({final String? $type})
      : $type = $type ?? 'SuccessfulVoidResponse';

  factory _$SuccessfulVoidResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$SuccessfulVoidResponseFromJson(json, fromJsonT);

  @JsonKey(name: 'runtime_type')
  final String $type;

  @override
  String toString() {
    return 'ApiResponse<$T>.successfulVoidResponse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessfulVoidResponse<T>);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'data') T data)
        successfulDataResponse,
    required TResult Function() successfulVoidResponse,
    required TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)
        badResponse,
  }) {
    return successfulVoidResponse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult? Function()? successfulVoidResponse,
    TResult? Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
  }) {
    return successfulVoidResponse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult Function()? successfulVoidResponse,
    TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
    required TResult orElse(),
  }) {
    if (successfulVoidResponse != null) {
      return successfulVoidResponse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfulDataResponse<T> value)
        successfulDataResponse,
    required TResult Function(SuccessfulVoidResponse<T> value)
        successfulVoidResponse,
    required TResult Function(BadResponse<T> value) badResponse,
  }) {
    return successfulVoidResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult? Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult? Function(BadResponse<T> value)? badResponse,
  }) {
    return successfulVoidResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult Function(BadResponse<T> value)? badResponse,
    required TResult orElse(),
  }) {
    if (successfulVoidResponse != null) {
      return successfulVoidResponse(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$SuccessfulVoidResponseToJson<T>(this, toJsonT);
  }
}

abstract class SuccessfulVoidResponse<T> implements ApiResponse<T> {
  const factory SuccessfulVoidResponse() = _$SuccessfulVoidResponse<T>;

  factory SuccessfulVoidResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$SuccessfulVoidResponse<T>.fromJson;
}

/// @nodoc
abstract class _$$BadResponseCopyWith<T, $Res> {
  factory _$$BadResponseCopyWith(
          _$BadResponse<T> value, $Res Function(_$BadResponse<T>) then) =
      __$$BadResponseCopyWithImpl<T, $Res>;
  @useResult
  $Res call({@JsonKey(name: 'errors') List<ResponseErrorDescription> errors});
}

/// @nodoc
class __$$BadResponseCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$BadResponse<T>>
    implements _$$BadResponseCopyWith<T, $Res> {
  __$$BadResponseCopyWithImpl(
      _$BadResponse<T> _value, $Res Function(_$BadResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = null,
  }) {
    return _then(_$BadResponse<T>(
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ResponseErrorDescription>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class _$BadResponse<T> implements BadResponse<T> {
  const _$BadResponse(
      {@JsonKey(name: 'errors')
          final List<ResponseErrorDescription> errors = const [],
      final String? $type})
      : _errors = errors,
        $type = $type ?? 'BadResponse';

  factory _$BadResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$BadResponseFromJson(json, fromJsonT);

  final List<ResponseErrorDescription> _errors;
  @override
  @JsonKey(name: 'errors')
  List<ResponseErrorDescription> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @JsonKey(name: 'runtime_type')
  final String $type;

  @override
  String toString() {
    return 'ApiResponse<$T>.badResponse(errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadResponse<T> &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BadResponseCopyWith<T, _$BadResponse<T>> get copyWith =>
      __$$BadResponseCopyWithImpl<T, _$BadResponse<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'data') T data)
        successfulDataResponse,
    required TResult Function() successfulVoidResponse,
    required TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)
        badResponse,
  }) {
    return badResponse(errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult? Function()? successfulVoidResponse,
    TResult? Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
  }) {
    return badResponse?.call(errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult Function()? successfulVoidResponse,
    TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
    required TResult orElse(),
  }) {
    if (badResponse != null) {
      return badResponse(errors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfulDataResponse<T> value)
        successfulDataResponse,
    required TResult Function(SuccessfulVoidResponse<T> value)
        successfulVoidResponse,
    required TResult Function(BadResponse<T> value) badResponse,
  }) {
    return badResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult? Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult? Function(BadResponse<T> value)? badResponse,
  }) {
    return badResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult Function(BadResponse<T> value)? badResponse,
    required TResult orElse(),
  }) {
    if (badResponse != null) {
      return badResponse(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$BadResponseToJson<T>(this, toJsonT);
  }
}

abstract class BadResponse<T> implements ApiResponse<T> {
  const factory BadResponse(
      {@JsonKey(name: 'errors')
          final List<ResponseErrorDescription> errors}) = _$BadResponse<T>;

  factory BadResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$BadResponse<T>.fromJson;

  @JsonKey(name: 'errors')
  List<ResponseErrorDescription> get errors;
  @JsonKey(ignore: true)
  _$$BadResponseCopyWith<T, _$BadResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseErrorDescription _$ResponseErrorDescriptionFromJson(
    Map<String, dynamic> json) {
  return _ResponseErrorDescription.fromJson(json);
}

/// @nodoc
mixin _$ResponseErrorDescription {
  String get code => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get detail => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseErrorDescriptionCopyWith<ResponseErrorDescription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseErrorDescriptionCopyWith<$Res> {
  factory $ResponseErrorDescriptionCopyWith(ResponseErrorDescription value,
          $Res Function(ResponseErrorDescription) then) =
      _$ResponseErrorDescriptionCopyWithImpl<$Res, ResponseErrorDescription>;
  @useResult
  $Res call(
      {String code, String id, String message, String? detail, String? status});
}

/// @nodoc
class _$ResponseErrorDescriptionCopyWithImpl<$Res,
        $Val extends ResponseErrorDescription>
    implements $ResponseErrorDescriptionCopyWith<$Res> {
  _$ResponseErrorDescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? id = null,
    Object? message = null,
    Object? detail = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResponseErrorDescriptionCopyWith<$Res>
    implements $ResponseErrorDescriptionCopyWith<$Res> {
  factory _$$_ResponseErrorDescriptionCopyWith(
          _$_ResponseErrorDescription value,
          $Res Function(_$_ResponseErrorDescription) then) =
      __$$_ResponseErrorDescriptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code, String id, String message, String? detail, String? status});
}

/// @nodoc
class __$$_ResponseErrorDescriptionCopyWithImpl<$Res>
    extends _$ResponseErrorDescriptionCopyWithImpl<$Res,
        _$_ResponseErrorDescription>
    implements _$$_ResponseErrorDescriptionCopyWith<$Res> {
  __$$_ResponseErrorDescriptionCopyWithImpl(_$_ResponseErrorDescription _value,
      $Res Function(_$_ResponseErrorDescription) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? id = null,
    Object? message = null,
    Object? detail = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_ResponseErrorDescription(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ResponseErrorDescription extends _ResponseErrorDescription {
  const _$_ResponseErrorDescription(
      {required this.code,
      required this.id,
      required this.message,
      this.detail,
      this.status})
      : super._();

  factory _$_ResponseErrorDescription.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseErrorDescriptionFromJson(json);

  @override
  final String code;
  @override
  final String id;
  @override
  final String message;
  @override
  final String? detail;
  @override
  final String? status;

  @override
  String toString() {
    return 'ResponseErrorDescription(code: $code, id: $id, message: $message, detail: $detail, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResponseErrorDescription &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, id, message, detail, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResponseErrorDescriptionCopyWith<_$_ResponseErrorDescription>
      get copyWith => __$$_ResponseErrorDescriptionCopyWithImpl<
          _$_ResponseErrorDescription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseErrorDescriptionToJson(
      this,
    );
  }
}

abstract class _ResponseErrorDescription extends ResponseErrorDescription {
  const factory _ResponseErrorDescription(
      {required final String code,
      required final String id,
      required final String message,
      final String? detail,
      final String? status}) = _$_ResponseErrorDescription;
  const _ResponseErrorDescription._() : super._();

  factory _ResponseErrorDescription.fromJson(Map<String, dynamic> json) =
      _$_ResponseErrorDescription.fromJson;

  @override
  String get code;
  @override
  String get id;
  @override
  String get message;
  @override
  String? get detail;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseErrorDescriptionCopyWith<_$_ResponseErrorDescription>
      get copyWith => throw _privateConstructorUsedError;
}

TableParamsModel _$TableParamsModelFromJson(Map<String, dynamic> json) {
  return _TableParamsModel.fromJson(json);
}

/// @nodoc
mixin _$TableParamsModel {
  String get id => throw _privateConstructorUsedError;
  String get workbookOriginName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get headerTopLeftColumnIndex => throw _privateConstructorUsedError;
  int get headerTopLeftRowIndex => throw _privateConstructorUsedError;
  int get dataTopLeftColumnIndex => throw _privateConstructorUsedError;
  int get dataTopLeftRowIndex => throw _privateConstructorUsedError;
  int get keyColumnIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TableParamsModelCopyWith<TableParamsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableParamsModelCopyWith<$Res> {
  factory $TableParamsModelCopyWith(
          TableParamsModel value, $Res Function(TableParamsModel) then) =
      _$TableParamsModelCopyWithImpl<$Res, TableParamsModel>;
  @useResult
  $Res call(
      {String id,
      String workbookOriginName,
      String userId,
      @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp) DateTime createdAt,
      String name,
      int headerTopLeftColumnIndex,
      int headerTopLeftRowIndex,
      int dataTopLeftColumnIndex,
      int dataTopLeftRowIndex,
      int keyColumnIndex});
}

/// @nodoc
class _$TableParamsModelCopyWithImpl<$Res, $Val extends TableParamsModel>
    implements $TableParamsModelCopyWith<$Res> {
  _$TableParamsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workbookOriginName = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? name = null,
    Object? headerTopLeftColumnIndex = null,
    Object? headerTopLeftRowIndex = null,
    Object? dataTopLeftColumnIndex = null,
    Object? dataTopLeftRowIndex = null,
    Object? keyColumnIndex = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workbookOriginName: null == workbookOriginName
          ? _value.workbookOriginName
          : workbookOriginName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      headerTopLeftColumnIndex: null == headerTopLeftColumnIndex
          ? _value.headerTopLeftColumnIndex
          : headerTopLeftColumnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      headerTopLeftRowIndex: null == headerTopLeftRowIndex
          ? _value.headerTopLeftRowIndex
          : headerTopLeftRowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      dataTopLeftColumnIndex: null == dataTopLeftColumnIndex
          ? _value.dataTopLeftColumnIndex
          : dataTopLeftColumnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      dataTopLeftRowIndex: null == dataTopLeftRowIndex
          ? _value.dataTopLeftRowIndex
          : dataTopLeftRowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      keyColumnIndex: null == keyColumnIndex
          ? _value.keyColumnIndex
          : keyColumnIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TableParamsModelCopyWith<$Res>
    implements $TableParamsModelCopyWith<$Res> {
  factory _$$_TableParamsModelCopyWith(
          _$_TableParamsModel value, $Res Function(_$_TableParamsModel) then) =
      __$$_TableParamsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String workbookOriginName,
      String userId,
      @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp) DateTime createdAt,
      String name,
      int headerTopLeftColumnIndex,
      int headerTopLeftRowIndex,
      int dataTopLeftColumnIndex,
      int dataTopLeftRowIndex,
      int keyColumnIndex});
}

/// @nodoc
class __$$_TableParamsModelCopyWithImpl<$Res>
    extends _$TableParamsModelCopyWithImpl<$Res, _$_TableParamsModel>
    implements _$$_TableParamsModelCopyWith<$Res> {
  __$$_TableParamsModelCopyWithImpl(
      _$_TableParamsModel _value, $Res Function(_$_TableParamsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workbookOriginName = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? name = null,
    Object? headerTopLeftColumnIndex = null,
    Object? headerTopLeftRowIndex = null,
    Object? dataTopLeftColumnIndex = null,
    Object? dataTopLeftRowIndex = null,
    Object? keyColumnIndex = null,
  }) {
    return _then(_$_TableParamsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workbookOriginName: null == workbookOriginName
          ? _value.workbookOriginName
          : workbookOriginName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      headerTopLeftColumnIndex: null == headerTopLeftColumnIndex
          ? _value.headerTopLeftColumnIndex
          : headerTopLeftColumnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      headerTopLeftRowIndex: null == headerTopLeftRowIndex
          ? _value.headerTopLeftRowIndex
          : headerTopLeftRowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      dataTopLeftColumnIndex: null == dataTopLeftColumnIndex
          ? _value.dataTopLeftColumnIndex
          : dataTopLeftColumnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      dataTopLeftRowIndex: null == dataTopLeftRowIndex
          ? _value.dataTopLeftRowIndex
          : dataTopLeftRowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      keyColumnIndex: null == keyColumnIndex
          ? _value.keyColumnIndex
          : keyColumnIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TableParamsModel extends _TableParamsModel {
  const _$_TableParamsModel(
      {required this.id,
      required this.workbookOriginName,
      required this.userId,
      @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
          required this.createdAt,
      this.name = '',
      this.headerTopLeftColumnIndex = 0,
      this.headerTopLeftRowIndex = 0,
      this.dataTopLeftColumnIndex = 0,
      this.dataTopLeftRowIndex = 0,
      this.keyColumnIndex = 0})
      : super._();

  factory _$_TableParamsModel.fromJson(Map<String, dynamic> json) =>
      _$$_TableParamsModelFromJson(json);

  @override
  final String id;
  @override
  final String workbookOriginName;
  @override
  final String userId;
  @override
  @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
  final DateTime createdAt;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int headerTopLeftColumnIndex;
  @override
  @JsonKey()
  final int headerTopLeftRowIndex;
  @override
  @JsonKey()
  final int dataTopLeftColumnIndex;
  @override
  @JsonKey()
  final int dataTopLeftRowIndex;
  @override
  @JsonKey()
  final int keyColumnIndex;

  @override
  String toString() {
    return 'TableParamsModel(id: $id, workbookOriginName: $workbookOriginName, userId: $userId, createdAt: $createdAt, name: $name, headerTopLeftColumnIndex: $headerTopLeftColumnIndex, headerTopLeftRowIndex: $headerTopLeftRowIndex, dataTopLeftColumnIndex: $dataTopLeftColumnIndex, dataTopLeftRowIndex: $dataTopLeftRowIndex, keyColumnIndex: $keyColumnIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TableParamsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workbookOriginName, workbookOriginName) ||
                other.workbookOriginName == workbookOriginName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(
                    other.headerTopLeftColumnIndex, headerTopLeftColumnIndex) ||
                other.headerTopLeftColumnIndex == headerTopLeftColumnIndex) &&
            (identical(other.headerTopLeftRowIndex, headerTopLeftRowIndex) ||
                other.headerTopLeftRowIndex == headerTopLeftRowIndex) &&
            (identical(other.dataTopLeftColumnIndex, dataTopLeftColumnIndex) ||
                other.dataTopLeftColumnIndex == dataTopLeftColumnIndex) &&
            (identical(other.dataTopLeftRowIndex, dataTopLeftRowIndex) ||
                other.dataTopLeftRowIndex == dataTopLeftRowIndex) &&
            (identical(other.keyColumnIndex, keyColumnIndex) ||
                other.keyColumnIndex == keyColumnIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      workbookOriginName,
      userId,
      createdAt,
      name,
      headerTopLeftColumnIndex,
      headerTopLeftRowIndex,
      dataTopLeftColumnIndex,
      dataTopLeftRowIndex,
      keyColumnIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TableParamsModelCopyWith<_$_TableParamsModel> get copyWith =>
      __$$_TableParamsModelCopyWithImpl<_$_TableParamsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TableParamsModelToJson(
      this,
    );
  }
}

abstract class _TableParamsModel extends TableParamsModel {
  const factory _TableParamsModel(
      {required final String id,
      required final String workbookOriginName,
      required final String userId,
      @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
          required final DateTime createdAt,
      final String name,
      final int headerTopLeftColumnIndex,
      final int headerTopLeftRowIndex,
      final int dataTopLeftColumnIndex,
      final int dataTopLeftRowIndex,
      final int keyColumnIndex}) = _$_TableParamsModel;
  const _TableParamsModel._() : super._();

  factory _TableParamsModel.fromJson(Map<String, dynamic> json) =
      _$_TableParamsModel.fromJson;

  @override
  String get id;
  @override
  String get workbookOriginName;
  @override
  String get userId;
  @override
  @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
  DateTime get createdAt;
  @override
  String get name;
  @override
  int get headerTopLeftColumnIndex;
  @override
  int get headerTopLeftRowIndex;
  @override
  int get dataTopLeftColumnIndex;
  @override
  int get dataTopLeftRowIndex;
  @override
  int get keyColumnIndex;
  @override
  @JsonKey(ignore: true)
  _$$_TableParamsModelCopyWith<_$_TableParamsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TablesSyncParamsModel _$TablesSyncParamsModelFromJson(
    Map<String, dynamic> json) {
  return _TablesSyncParamsModel.fromJson(json);
}

/// @nodoc
mixin _$TablesSyncParamsModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get sourceTableId => throw _privateConstructorUsedError;
  List<String> get destinationTablesIds => throw _privateConstructorUsedError;
  List<String> get columnNames => throw _privateConstructorUsedError;
  bool get shouldUpdateValues => throw _privateConstructorUsedError;
  bool get shouldAddNewValues => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TablesSyncParamsModelCopyWith<TablesSyncParamsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TablesSyncParamsModelCopyWith<$Res> {
  factory $TablesSyncParamsModelCopyWith(TablesSyncParamsModel value,
          $Res Function(TablesSyncParamsModel) then) =
      _$TablesSyncParamsModelCopyWithImpl<$Res, TablesSyncParamsModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp) DateTime createdAt,
      String sourceTableId,
      List<String> destinationTablesIds,
      List<String> columnNames,
      bool shouldUpdateValues,
      bool shouldAddNewValues});
}

/// @nodoc
class _$TablesSyncParamsModelCopyWithImpl<$Res,
        $Val extends TablesSyncParamsModel>
    implements $TablesSyncParamsModelCopyWith<$Res> {
  _$TablesSyncParamsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? sourceTableId = null,
    Object? destinationTablesIds = null,
    Object? columnNames = null,
    Object? shouldUpdateValues = null,
    Object? shouldAddNewValues = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sourceTableId: null == sourceTableId
          ? _value.sourceTableId
          : sourceTableId // ignore: cast_nullable_to_non_nullable
              as String,
      destinationTablesIds: null == destinationTablesIds
          ? _value.destinationTablesIds
          : destinationTablesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      columnNames: null == columnNames
          ? _value.columnNames
          : columnNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shouldUpdateValues: null == shouldUpdateValues
          ? _value.shouldUpdateValues
          : shouldUpdateValues // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldAddNewValues: null == shouldAddNewValues
          ? _value.shouldAddNewValues
          : shouldAddNewValues // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TablesSyncParamsModelCopyWith<$Res>
    implements $TablesSyncParamsModelCopyWith<$Res> {
  factory _$$_TablesSyncParamsModelCopyWith(_$_TablesSyncParamsModel value,
          $Res Function(_$_TablesSyncParamsModel) then) =
      __$$_TablesSyncParamsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp) DateTime createdAt,
      String sourceTableId,
      List<String> destinationTablesIds,
      List<String> columnNames,
      bool shouldUpdateValues,
      bool shouldAddNewValues});
}

/// @nodoc
class __$$_TablesSyncParamsModelCopyWithImpl<$Res>
    extends _$TablesSyncParamsModelCopyWithImpl<$Res, _$_TablesSyncParamsModel>
    implements _$$_TablesSyncParamsModelCopyWith<$Res> {
  __$$_TablesSyncParamsModelCopyWithImpl(_$_TablesSyncParamsModel _value,
      $Res Function(_$_TablesSyncParamsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? sourceTableId = null,
    Object? destinationTablesIds = null,
    Object? columnNames = null,
    Object? shouldUpdateValues = null,
    Object? shouldAddNewValues = null,
  }) {
    return _then(_$_TablesSyncParamsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sourceTableId: null == sourceTableId
          ? _value.sourceTableId
          : sourceTableId // ignore: cast_nullable_to_non_nullable
              as String,
      destinationTablesIds: null == destinationTablesIds
          ? _value._destinationTablesIds
          : destinationTablesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      columnNames: null == columnNames
          ? _value._columnNames
          : columnNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shouldUpdateValues: null == shouldUpdateValues
          ? _value.shouldUpdateValues
          : shouldUpdateValues // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldAddNewValues: null == shouldAddNewValues
          ? _value.shouldAddNewValues
          : shouldAddNewValues // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TablesSyncParamsModel extends _TablesSyncParamsModel {
  const _$_TablesSyncParamsModel(
      {required this.id,
      required this.userId,
      @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
          required this.createdAt,
      required this.sourceTableId,
      required final List<String> destinationTablesIds,
      required final List<String> columnNames,
      required this.shouldUpdateValues,
      required this.shouldAddNewValues})
      : _destinationTablesIds = destinationTablesIds,
        _columnNames = columnNames,
        super._();

  factory _$_TablesSyncParamsModel.fromJson(Map<String, dynamic> json) =>
      _$$_TablesSyncParamsModelFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
  final DateTime createdAt;
  @override
  final String sourceTableId;
  final List<String> _destinationTablesIds;
  @override
  List<String> get destinationTablesIds {
    if (_destinationTablesIds is EqualUnmodifiableListView)
      return _destinationTablesIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_destinationTablesIds);
  }

  final List<String> _columnNames;
  @override
  List<String> get columnNames {
    if (_columnNames is EqualUnmodifiableListView) return _columnNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_columnNames);
  }

  @override
  final bool shouldUpdateValues;
  @override
  final bool shouldAddNewValues;

  @override
  String toString() {
    return 'TablesSyncParamsModel(id: $id, userId: $userId, createdAt: $createdAt, sourceTableId: $sourceTableId, destinationTablesIds: $destinationTablesIds, columnNames: $columnNames, shouldUpdateValues: $shouldUpdateValues, shouldAddNewValues: $shouldAddNewValues)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TablesSyncParamsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.sourceTableId, sourceTableId) ||
                other.sourceTableId == sourceTableId) &&
            const DeepCollectionEquality()
                .equals(other._destinationTablesIds, _destinationTablesIds) &&
            const DeepCollectionEquality()
                .equals(other._columnNames, _columnNames) &&
            (identical(other.shouldUpdateValues, shouldUpdateValues) ||
                other.shouldUpdateValues == shouldUpdateValues) &&
            (identical(other.shouldAddNewValues, shouldAddNewValues) ||
                other.shouldAddNewValues == shouldAddNewValues));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      createdAt,
      sourceTableId,
      const DeepCollectionEquality().hash(_destinationTablesIds),
      const DeepCollectionEquality().hash(_columnNames),
      shouldUpdateValues,
      shouldAddNewValues);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TablesSyncParamsModelCopyWith<_$_TablesSyncParamsModel> get copyWith =>
      __$$_TablesSyncParamsModelCopyWithImpl<_$_TablesSyncParamsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TablesSyncParamsModelToJson(
      this,
    );
  }
}

abstract class _TablesSyncParamsModel extends TablesSyncParamsModel {
  const factory _TablesSyncParamsModel(
      {required final String id,
      required final String userId,
      @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
          required final DateTime createdAt,
      required final String sourceTableId,
      required final List<String> destinationTablesIds,
      required final List<String> columnNames,
      required final bool shouldUpdateValues,
      required final bool shouldAddNewValues}) = _$_TablesSyncParamsModel;
  const _TablesSyncParamsModel._() : super._();

  factory _TablesSyncParamsModel.fromJson(Map<String, dynamic> json) =
      _$_TablesSyncParamsModel.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
  DateTime get createdAt;
  @override
  String get sourceTableId;
  @override
  List<String> get destinationTablesIds;
  @override
  List<String> get columnNames;
  @override
  bool get shouldUpdateValues;
  @override
  bool get shouldAddNewValues;
  @override
  @JsonKey(ignore: true)
  _$$_TablesSyncParamsModelCopyWith<_$_TablesSyncParamsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  Locale? get locale => throw _privateConstructorUsedError;
  ThemeMode get themeMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(fromJson: localeFromString, toJson: localeToString)
          Locale? locale,
      ThemeMode themeMode});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? locale = freezed,
    Object? themeMode = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(fromJson: localeFromString, toJson: localeToString)
          Locale? locale,
      ThemeMode themeMode});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? locale = freezed,
    Object? themeMode = null,
  }) {
    return _then(_$_UserModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_UserModel extends _UserModel {
  const _$_UserModel(
      {this.id = '',
      @JsonKey(fromJson: localeFromString, toJson: localeToString) this.locale,
      this.themeMode = ThemeMode.system})
      : super._();

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  final Locale? locale;
  @override
  @JsonKey()
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'UserModel(id: $id, locale: $locale, themeMode: $themeMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.locale, locale) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(locale), themeMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {final String id,
      @JsonKey(fromJson: localeFromString, toJson: localeToString)
          final Locale? locale,
      final ThemeMode themeMode}) = _$_UserModel;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  Locale? get locale;
  @override
  ThemeMode get themeMode;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
