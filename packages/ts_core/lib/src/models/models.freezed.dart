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
  CellModel get headerTopLeftCell => throw _privateConstructorUsedError;
  CellModel get dataTopLeftCell => throw _privateConstructorUsedError;
  String get keyColumnName => throw _privateConstructorUsedError;

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
      CellModel headerTopLeftCell,
      CellModel dataTopLeftCell,
      String keyColumnName});

  $CellModelCopyWith<$Res> get headerTopLeftCell;
  $CellModelCopyWith<$Res> get dataTopLeftCell;
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
    Object? headerTopLeftCell = null,
    Object? dataTopLeftCell = null,
    Object? keyColumnName = null,
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
      headerTopLeftCell: null == headerTopLeftCell
          ? _value.headerTopLeftCell
          : headerTopLeftCell // ignore: cast_nullable_to_non_nullable
              as CellModel,
      dataTopLeftCell: null == dataTopLeftCell
          ? _value.dataTopLeftCell
          : dataTopLeftCell // ignore: cast_nullable_to_non_nullable
              as CellModel,
      keyColumnName: null == keyColumnName
          ? _value.keyColumnName
          : keyColumnName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CellModelCopyWith<$Res> get headerTopLeftCell {
    return $CellModelCopyWith<$Res>(_value.headerTopLeftCell, (value) {
      return _then(_value.copyWith(headerTopLeftCell: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CellModelCopyWith<$Res> get dataTopLeftCell {
    return $CellModelCopyWith<$Res>(_value.dataTopLeftCell, (value) {
      return _then(_value.copyWith(dataTopLeftCell: value) as $Val);
    });
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
      CellModel headerTopLeftCell,
      CellModel dataTopLeftCell,
      String keyColumnName});

  @override
  $CellModelCopyWith<$Res> get headerTopLeftCell;
  @override
  $CellModelCopyWith<$Res> get dataTopLeftCell;
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
    Object? headerTopLeftCell = null,
    Object? dataTopLeftCell = null,
    Object? keyColumnName = null,
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
      headerTopLeftCell: null == headerTopLeftCell
          ? _value.headerTopLeftCell
          : headerTopLeftCell // ignore: cast_nullable_to_non_nullable
              as CellModel,
      dataTopLeftCell: null == dataTopLeftCell
          ? _value.dataTopLeftCell
          : dataTopLeftCell // ignore: cast_nullable_to_non_nullable
              as CellModel,
      keyColumnName: null == keyColumnName
          ? _value.keyColumnName
          : keyColumnName // ignore: cast_nullable_to_non_nullable
              as String,
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
      this.headerTopLeftCell = CellModel.zero,
      this.dataTopLeftCell = CellModel.zero,
      this.keyColumnName = ''})
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
  final CellModel headerTopLeftCell;
  @override
  @JsonKey()
  final CellModel dataTopLeftCell;
  @override
  @JsonKey()
  final String keyColumnName;

  @override
  String toString() {
    return 'TableParamsModel(id: $id, workbookOriginName: $workbookOriginName, userId: $userId, createdAt: $createdAt, name: $name, headerTopLeftCell: $headerTopLeftCell, dataTopLeftCell: $dataTopLeftCell, keyColumnName: $keyColumnName)';
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
            (identical(other.headerTopLeftCell, headerTopLeftCell) ||
                other.headerTopLeftCell == headerTopLeftCell) &&
            (identical(other.dataTopLeftCell, dataTopLeftCell) ||
                other.dataTopLeftCell == dataTopLeftCell) &&
            (identical(other.keyColumnName, keyColumnName) ||
                other.keyColumnName == keyColumnName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, workbookOriginName, userId,
      createdAt, name, headerTopLeftCell, dataTopLeftCell, keyColumnName);

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
      final CellModel headerTopLeftCell,
      final CellModel dataTopLeftCell,
      final String keyColumnName}) = _$_TableParamsModel;
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
  CellModel get headerTopLeftCell;
  @override
  CellModel get dataTopLeftCell;
  @override
  String get keyColumnName;
  @override
  @JsonKey(ignore: true)
  _$$_TableParamsModelCopyWith<_$_TableParamsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TableHeadersModel {
  /// For example:
  /// [
  ///   ['ids', 'color', 'quantity'],
  /// ]
  List<List<String>> get data => throw _privateConstructorUsedError;
  CellModel get topLeftCell => throw _privateConstructorUsedError;
  Map<String, int> get indexesMap => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TableHeadersModelCopyWith<TableHeadersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableHeadersModelCopyWith<$Res> {
  factory $TableHeadersModelCopyWith(
          TableHeadersModel value, $Res Function(TableHeadersModel) then) =
      _$TableHeadersModelCopyWithImpl<$Res, TableHeadersModel>;
  @useResult
  $Res call(
      {List<List<String>> data,
      CellModel topLeftCell,
      Map<String, int> indexesMap});

  $CellModelCopyWith<$Res> get topLeftCell;
}

/// @nodoc
class _$TableHeadersModelCopyWithImpl<$Res, $Val extends TableHeadersModel>
    implements $TableHeadersModelCopyWith<$Res> {
  _$TableHeadersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? topLeftCell = null,
    Object? indexesMap = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      topLeftCell: null == topLeftCell
          ? _value.topLeftCell
          : topLeftCell // ignore: cast_nullable_to_non_nullable
              as CellModel,
      indexesMap: null == indexesMap
          ? _value.indexesMap
          : indexesMap // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CellModelCopyWith<$Res> get topLeftCell {
    return $CellModelCopyWith<$Res>(_value.topLeftCell, (value) {
      return _then(_value.copyWith(topLeftCell: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TableHeadersModelCopyWith<$Res>
    implements $TableHeadersModelCopyWith<$Res> {
  factory _$$_TableHeadersModelCopyWith(_$_TableHeadersModel value,
          $Res Function(_$_TableHeadersModel) then) =
      __$$_TableHeadersModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<String>> data,
      CellModel topLeftCell,
      Map<String, int> indexesMap});

  @override
  $CellModelCopyWith<$Res> get topLeftCell;
}

/// @nodoc
class __$$_TableHeadersModelCopyWithImpl<$Res>
    extends _$TableHeadersModelCopyWithImpl<$Res, _$_TableHeadersModel>
    implements _$$_TableHeadersModelCopyWith<$Res> {
  __$$_TableHeadersModelCopyWithImpl(
      _$_TableHeadersModel _value, $Res Function(_$_TableHeadersModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? topLeftCell = null,
    Object? indexesMap = null,
  }) {
    return _then(_$_TableHeadersModel(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      topLeftCell: null == topLeftCell
          ? _value.topLeftCell
          : topLeftCell // ignore: cast_nullable_to_non_nullable
              as CellModel,
      indexesMap: null == indexesMap
          ? _value._indexesMap
          : indexesMap // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc

class _$_TableHeadersModel implements _TableHeadersModel {
  const _$_TableHeadersModel(
      {required final List<List<String>> data,
      required this.topLeftCell,
      required final Map<String, int> indexesMap})
      : _data = data,
        _indexesMap = indexesMap;

  /// For example:
  /// [
  ///   ['ids', 'color', 'quantity'],
  /// ]
  final List<List<String>> _data;

  /// For example:
  /// [
  ///   ['ids', 'color', 'quantity'],
  /// ]
  @override
  List<List<String>> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final CellModel topLeftCell;
  final Map<String, int> _indexesMap;
  @override
  Map<String, int> get indexesMap {
    if (_indexesMap is EqualUnmodifiableMapView) return _indexesMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_indexesMap);
  }

  @override
  String toString() {
    return 'TableHeadersModel(data: $data, topLeftCell: $topLeftCell, indexesMap: $indexesMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TableHeadersModel &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.topLeftCell, topLeftCell) ||
                other.topLeftCell == topLeftCell) &&
            const DeepCollectionEquality()
                .equals(other._indexesMap, _indexesMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      topLeftCell,
      const DeepCollectionEquality().hash(_indexesMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TableHeadersModelCopyWith<_$_TableHeadersModel> get copyWith =>
      __$$_TableHeadersModelCopyWithImpl<_$_TableHeadersModel>(
          this, _$identity);
}

abstract class _TableHeadersModel implements TableHeadersModel {
  const factory _TableHeadersModel(
      {required final List<List<String>> data,
      required final CellModel topLeftCell,
      required final Map<String, int> indexesMap}) = _$_TableHeadersModel;

  @override

  /// For example:
  /// [
  ///   ['ids', 'color', 'quantity'],
  /// ]
  List<List<String>> get data;
  @override
  CellModel get topLeftCell;
  @override
  Map<String, int> get indexesMap;
  @override
  @JsonKey(ignore: true)
  _$$_TableHeadersModelCopyWith<_$_TableHeadersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

CellModel _$CellModelFromJson(Map<String, dynamic> json) {
  return _CellModel.fromJson(json);
}

/// @nodoc
mixin _$CellModel {
  int get rowIndex => throw _privateConstructorUsedError;
  int get columnIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CellModelCopyWith<CellModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CellModelCopyWith<$Res> {
  factory $CellModelCopyWith(CellModel value, $Res Function(CellModel) then) =
      _$CellModelCopyWithImpl<$Res, CellModel>;
  @useResult
  $Res call({int rowIndex, int columnIndex});
}

/// @nodoc
class _$CellModelCopyWithImpl<$Res, $Val extends CellModel>
    implements $CellModelCopyWith<$Res> {
  _$CellModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowIndex = null,
    Object? columnIndex = null,
  }) {
    return _then(_value.copyWith(
      rowIndex: null == rowIndex
          ? _value.rowIndex
          : rowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      columnIndex: null == columnIndex
          ? _value.columnIndex
          : columnIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CellModelCopyWith<$Res> implements $CellModelCopyWith<$Res> {
  factory _$$_CellModelCopyWith(
          _$_CellModel value, $Res Function(_$_CellModel) then) =
      __$$_CellModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int rowIndex, int columnIndex});
}

/// @nodoc
class __$$_CellModelCopyWithImpl<$Res>
    extends _$CellModelCopyWithImpl<$Res, _$_CellModel>
    implements _$$_CellModelCopyWith<$Res> {
  __$$_CellModelCopyWithImpl(
      _$_CellModel _value, $Res Function(_$_CellModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowIndex = null,
    Object? columnIndex = null,
  }) {
    return _then(_$_CellModel(
      rowIndex: null == rowIndex
          ? _value.rowIndex
          : rowIndex // ignore: cast_nullable_to_non_nullable
              as int,
      columnIndex: null == columnIndex
          ? _value.columnIndex
          : columnIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CellModel extends _CellModel {
  const _$_CellModel({required this.rowIndex, required this.columnIndex})
      : super._();

  factory _$_CellModel.fromJson(Map<String, dynamic> json) =>
      _$$_CellModelFromJson(json);

  @override
  final int rowIndex;
  @override
  final int columnIndex;

  @override
  String toString() {
    return 'CellModel(rowIndex: $rowIndex, columnIndex: $columnIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CellModel &&
            (identical(other.rowIndex, rowIndex) ||
                other.rowIndex == rowIndex) &&
            (identical(other.columnIndex, columnIndex) ||
                other.columnIndex == columnIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rowIndex, columnIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CellModelCopyWith<_$_CellModel> get copyWith =>
      __$$_CellModelCopyWithImpl<_$_CellModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CellModelToJson(
      this,
    );
  }
}

abstract class _CellModel extends CellModel {
  const factory _CellModel(
      {required final int rowIndex,
      required final int columnIndex}) = _$_CellModel;
  const _CellModel._() : super._();

  factory _CellModel.fromJson(Map<String, dynamic> json) =
      _$_CellModel.fromJson;

  @override
  int get rowIndex;
  @override
  int get columnIndex;
  @override
  @JsonKey(ignore: true)
  _$$_CellModelCopyWith<_$_CellModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IndexedValueModel {
  List<int> get rowIndexes => throw _privateConstructorUsedError;
  int get originRowIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IndexedValueModelCopyWith<IndexedValueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndexedValueModelCopyWith<$Res> {
  factory $IndexedValueModelCopyWith(
          IndexedValueModel value, $Res Function(IndexedValueModel) then) =
      _$IndexedValueModelCopyWithImpl<$Res, IndexedValueModel>;
  @useResult
  $Res call({List<int> rowIndexes, int originRowIndex});
}

/// @nodoc
class _$IndexedValueModelCopyWithImpl<$Res, $Val extends IndexedValueModel>
    implements $IndexedValueModelCopyWith<$Res> {
  _$IndexedValueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowIndexes = null,
    Object? originRowIndex = null,
  }) {
    return _then(_value.copyWith(
      rowIndexes: null == rowIndexes
          ? _value.rowIndexes
          : rowIndexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      originRowIndex: null == originRowIndex
          ? _value.originRowIndex
          : originRowIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IndexedValueModelCopyWith<$Res>
    implements $IndexedValueModelCopyWith<$Res> {
  factory _$$_IndexedValueModelCopyWith(_$_IndexedValueModel value,
          $Res Function(_$_IndexedValueModel) then) =
      __$$_IndexedValueModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> rowIndexes, int originRowIndex});
}

/// @nodoc
class __$$_IndexedValueModelCopyWithImpl<$Res>
    extends _$IndexedValueModelCopyWithImpl<$Res, _$_IndexedValueModel>
    implements _$$_IndexedValueModelCopyWith<$Res> {
  __$$_IndexedValueModelCopyWithImpl(
      _$_IndexedValueModel _value, $Res Function(_$_IndexedValueModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowIndexes = null,
    Object? originRowIndex = null,
  }) {
    return _then(_$_IndexedValueModel(
      rowIndexes: null == rowIndexes
          ? _value._rowIndexes
          : rowIndexes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      originRowIndex: null == originRowIndex
          ? _value.originRowIndex
          : originRowIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_IndexedValueModel implements _IndexedValueModel {
  const _$_IndexedValueModel(
      {required final List<int> rowIndexes, required this.originRowIndex})
      : _rowIndexes = rowIndexes;

  final List<int> _rowIndexes;
  @override
  List<int> get rowIndexes {
    if (_rowIndexes is EqualUnmodifiableListView) return _rowIndexes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rowIndexes);
  }

  @override
  final int originRowIndex;

  @override
  String toString() {
    return 'IndexedValueModel(rowIndexes: $rowIndexes, originRowIndex: $originRowIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IndexedValueModel &&
            const DeepCollectionEquality()
                .equals(other._rowIndexes, _rowIndexes) &&
            (identical(other.originRowIndex, originRowIndex) ||
                other.originRowIndex == originRowIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_rowIndexes), originRowIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IndexedValueModelCopyWith<_$_IndexedValueModel> get copyWith =>
      __$$_IndexedValueModelCopyWithImpl<_$_IndexedValueModel>(
          this, _$identity);
}

abstract class _IndexedValueModel implements IndexedValueModel {
  const factory _IndexedValueModel(
      {required final List<int> rowIndexes,
      required final int originRowIndex}) = _$_IndexedValueModel;

  @override
  List<int> get rowIndexes;
  @override
  int get originRowIndex;
  @override
  @JsonKey(ignore: true)
  _$$_IndexedValueModelCopyWith<_$_IndexedValueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IndexedKeysChangesModel {
  Map<String, IndexedValueModel> get newValues =>
      throw _privateConstructorUsedError;
  Map<String, IndexedValueModel> get updatableValues =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IndexedKeysChangesModelCopyWith<IndexedKeysChangesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndexedKeysChangesModelCopyWith<$Res> {
  factory $IndexedKeysChangesModelCopyWith(IndexedKeysChangesModel value,
          $Res Function(IndexedKeysChangesModel) then) =
      _$IndexedKeysChangesModelCopyWithImpl<$Res, IndexedKeysChangesModel>;
  @useResult
  $Res call(
      {Map<String, IndexedValueModel> newValues,
      Map<String, IndexedValueModel> updatableValues});
}

/// @nodoc
class _$IndexedKeysChangesModelCopyWithImpl<$Res,
        $Val extends IndexedKeysChangesModel>
    implements $IndexedKeysChangesModelCopyWith<$Res> {
  _$IndexedKeysChangesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newValues = null,
    Object? updatableValues = null,
  }) {
    return _then(_value.copyWith(
      newValues: null == newValues
          ? _value.newValues
          : newValues // ignore: cast_nullable_to_non_nullable
              as Map<String, IndexedValueModel>,
      updatableValues: null == updatableValues
          ? _value.updatableValues
          : updatableValues // ignore: cast_nullable_to_non_nullable
              as Map<String, IndexedValueModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IndexedKeysChangesModelCopyWith<$Res>
    implements $IndexedKeysChangesModelCopyWith<$Res> {
  factory _$$_IndexedKeysChangesModelCopyWith(_$_IndexedKeysChangesModel value,
          $Res Function(_$_IndexedKeysChangesModel) then) =
      __$$_IndexedKeysChangesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, IndexedValueModel> newValues,
      Map<String, IndexedValueModel> updatableValues});
}

/// @nodoc
class __$$_IndexedKeysChangesModelCopyWithImpl<$Res>
    extends _$IndexedKeysChangesModelCopyWithImpl<$Res,
        _$_IndexedKeysChangesModel>
    implements _$$_IndexedKeysChangesModelCopyWith<$Res> {
  __$$_IndexedKeysChangesModelCopyWithImpl(_$_IndexedKeysChangesModel _value,
      $Res Function(_$_IndexedKeysChangesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newValues = null,
    Object? updatableValues = null,
  }) {
    return _then(_$_IndexedKeysChangesModel(
      newValues: null == newValues
          ? _value._newValues
          : newValues // ignore: cast_nullable_to_non_nullable
              as Map<String, IndexedValueModel>,
      updatableValues: null == updatableValues
          ? _value._updatableValues
          : updatableValues // ignore: cast_nullable_to_non_nullable
              as Map<String, IndexedValueModel>,
    ));
  }
}

/// @nodoc

class _$_IndexedKeysChangesModel implements _IndexedKeysChangesModel {
  const _$_IndexedKeysChangesModel(
      {required final Map<String, IndexedValueModel> newValues,
      required final Map<String, IndexedValueModel> updatableValues})
      : _newValues = newValues,
        _updatableValues = updatableValues;

  final Map<String, IndexedValueModel> _newValues;
  @override
  Map<String, IndexedValueModel> get newValues {
    if (_newValues is EqualUnmodifiableMapView) return _newValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_newValues);
  }

  final Map<String, IndexedValueModel> _updatableValues;
  @override
  Map<String, IndexedValueModel> get updatableValues {
    if (_updatableValues is EqualUnmodifiableMapView) return _updatableValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_updatableValues);
  }

  @override
  String toString() {
    return 'IndexedKeysChangesModel(newValues: $newValues, updatableValues: $updatableValues)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IndexedKeysChangesModel &&
            const DeepCollectionEquality()
                .equals(other._newValues, _newValues) &&
            const DeepCollectionEquality()
                .equals(other._updatableValues, _updatableValues));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_newValues),
      const DeepCollectionEquality().hash(_updatableValues));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IndexedKeysChangesModelCopyWith<_$_IndexedKeysChangesModel>
      get copyWith =>
          __$$_IndexedKeysChangesModelCopyWithImpl<_$_IndexedKeysChangesModel>(
              this, _$identity);
}

abstract class _IndexedKeysChangesModel implements IndexedKeysChangesModel {
  const factory _IndexedKeysChangesModel(
          {required final Map<String, IndexedValueModel> newValues,
          required final Map<String, IndexedValueModel> updatableValues}) =
      _$_IndexedKeysChangesModel;

  @override
  Map<String, IndexedValueModel> get newValues;
  @override
  Map<String, IndexedValueModel> get updatableValues;
  @override
  @JsonKey(ignore: true)
  _$$_IndexedKeysChangesModelCopyWith<_$_IndexedKeysChangesModel>
      get copyWith => throw _privateConstructorUsedError;
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
  bool get shouldClearValueBeforeUpdate => throw _privateConstructorUsedError;
  String get workbookName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
  DateTime? get lastSyncAt => throw _privateConstructorUsedError;

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
      @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
          DateTime createdAt,
      String sourceTableId,
      List<String> destinationTablesIds,
      List<String> columnNames,
      bool shouldUpdateValues,
      bool shouldAddNewValues,
      bool shouldClearValueBeforeUpdate,
      String workbookName,
      String name,
      @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
          DateTime? lastSyncAt});
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
    Object? shouldClearValueBeforeUpdate = null,
    Object? workbookName = null,
    Object? name = null,
    Object? lastSyncAt = freezed,
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
      shouldClearValueBeforeUpdate: null == shouldClearValueBeforeUpdate
          ? _value.shouldClearValueBeforeUpdate
          : shouldClearValueBeforeUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      workbookName: null == workbookName
          ? _value.workbookName
          : workbookName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncAt: freezed == lastSyncAt
          ? _value.lastSyncAt
          : lastSyncAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      @JsonKey(fromJson: fromTimestamp, toJson: toTimestamp)
          DateTime createdAt,
      String sourceTableId,
      List<String> destinationTablesIds,
      List<String> columnNames,
      bool shouldUpdateValues,
      bool shouldAddNewValues,
      bool shouldClearValueBeforeUpdate,
      String workbookName,
      String name,
      @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
          DateTime? lastSyncAt});
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
    Object? shouldClearValueBeforeUpdate = null,
    Object? workbookName = null,
    Object? name = null,
    Object? lastSyncAt = freezed,
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
      shouldClearValueBeforeUpdate: null == shouldClearValueBeforeUpdate
          ? _value.shouldClearValueBeforeUpdate
          : shouldClearValueBeforeUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      workbookName: null == workbookName
          ? _value.workbookName
          : workbookName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncAt: freezed == lastSyncAt
          ? _value.lastSyncAt
          : lastSyncAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      required this.shouldAddNewValues,
      required this.shouldClearValueBeforeUpdate,
      this.workbookName = '',
      this.name = '',
      @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
          this.lastSyncAt})
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
  final bool shouldClearValueBeforeUpdate;
  @override
  @JsonKey()
  final String workbookName;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
  final DateTime? lastSyncAt;

  @override
  String toString() {
    return 'TablesSyncParamsModel(id: $id, userId: $userId, createdAt: $createdAt, sourceTableId: $sourceTableId, destinationTablesIds: $destinationTablesIds, columnNames: $columnNames, shouldUpdateValues: $shouldUpdateValues, shouldAddNewValues: $shouldAddNewValues, shouldClearValueBeforeUpdate: $shouldClearValueBeforeUpdate, workbookName: $workbookName, name: $name, lastSyncAt: $lastSyncAt)';
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
                other.shouldAddNewValues == shouldAddNewValues) &&
            (identical(other.shouldClearValueBeforeUpdate,
                    shouldClearValueBeforeUpdate) ||
                other.shouldClearValueBeforeUpdate ==
                    shouldClearValueBeforeUpdate) &&
            (identical(other.workbookName, workbookName) ||
                other.workbookName == workbookName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastSyncAt, lastSyncAt) ||
                other.lastSyncAt == lastSyncAt));
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
      shouldAddNewValues,
      shouldClearValueBeforeUpdate,
      workbookName,
      name,
      lastSyncAt);

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
      required final bool shouldAddNewValues,
      required final bool shouldClearValueBeforeUpdate,
      final String workbookName,
      final String name,
      @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
          final DateTime? lastSyncAt}) = _$_TablesSyncParamsModel;
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
  bool get shouldClearValueBeforeUpdate;
  @override
  String get workbookName;
  @override
  String get name;
  @override
  @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
  DateTime? get lastSyncAt;
  @override
  @JsonKey(ignore: true)
  _$$_TablesSyncParamsModelCopyWith<_$_TablesSyncParamsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TablesSyncParamsRuntimeModel _$TablesSyncParamsRuntimeModelFromJson(
    Map<String, dynamic> json) {
  return _TablesSyncParamsRuntimeModel.fromJson(json);
}

/// @nodoc
mixin _$TablesSyncParamsRuntimeModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  TableParamsModel get sourceTable => throw _privateConstructorUsedError;
  List<String> get columnNames => throw _privateConstructorUsedError;
  bool get shouldUpdateValues => throw _privateConstructorUsedError;
  bool get shouldAddNewValues => throw _privateConstructorUsedError;
  bool get shouldClearValueBeforeUpdate => throw _privateConstructorUsedError;
  List<TableParamsModel> get destinationTables =>
      throw _privateConstructorUsedError;
  String get workbookName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime? get lastSyncAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TablesSyncParamsRuntimeModelCopyWith<TablesSyncParamsRuntimeModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TablesSyncParamsRuntimeModelCopyWith<$Res> {
  factory $TablesSyncParamsRuntimeModelCopyWith(
          TablesSyncParamsRuntimeModel value,
          $Res Function(TablesSyncParamsRuntimeModel) then) =
      _$TablesSyncParamsRuntimeModelCopyWithImpl<$Res,
          TablesSyncParamsRuntimeModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime createdAt,
      TableParamsModel sourceTable,
      List<String> columnNames,
      bool shouldUpdateValues,
      bool shouldAddNewValues,
      bool shouldClearValueBeforeUpdate,
      List<TableParamsModel> destinationTables,
      String workbookName,
      String name,
      DateTime? lastSyncAt});

  $TableParamsModelCopyWith<$Res> get sourceTable;
}

/// @nodoc
class _$TablesSyncParamsRuntimeModelCopyWithImpl<$Res,
        $Val extends TablesSyncParamsRuntimeModel>
    implements $TablesSyncParamsRuntimeModelCopyWith<$Res> {
  _$TablesSyncParamsRuntimeModelCopyWithImpl(this._value, this._then);

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
    Object? sourceTable = null,
    Object? columnNames = null,
    Object? shouldUpdateValues = null,
    Object? shouldAddNewValues = null,
    Object? shouldClearValueBeforeUpdate = null,
    Object? destinationTables = null,
    Object? workbookName = null,
    Object? name = null,
    Object? lastSyncAt = freezed,
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
      sourceTable: null == sourceTable
          ? _value.sourceTable
          : sourceTable // ignore: cast_nullable_to_non_nullable
              as TableParamsModel,
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
      shouldClearValueBeforeUpdate: null == shouldClearValueBeforeUpdate
          ? _value.shouldClearValueBeforeUpdate
          : shouldClearValueBeforeUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      destinationTables: null == destinationTables
          ? _value.destinationTables
          : destinationTables // ignore: cast_nullable_to_non_nullable
              as List<TableParamsModel>,
      workbookName: null == workbookName
          ? _value.workbookName
          : workbookName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncAt: freezed == lastSyncAt
          ? _value.lastSyncAt
          : lastSyncAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TableParamsModelCopyWith<$Res> get sourceTable {
    return $TableParamsModelCopyWith<$Res>(_value.sourceTable, (value) {
      return _then(_value.copyWith(sourceTable: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TablesSyncParamsRuntimeModelCopyWith<$Res>
    implements $TablesSyncParamsRuntimeModelCopyWith<$Res> {
  factory _$$_TablesSyncParamsRuntimeModelCopyWith(
          _$_TablesSyncParamsRuntimeModel value,
          $Res Function(_$_TablesSyncParamsRuntimeModel) then) =
      __$$_TablesSyncParamsRuntimeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime createdAt,
      TableParamsModel sourceTable,
      List<String> columnNames,
      bool shouldUpdateValues,
      bool shouldAddNewValues,
      bool shouldClearValueBeforeUpdate,
      List<TableParamsModel> destinationTables,
      String workbookName,
      String name,
      DateTime? lastSyncAt});

  @override
  $TableParamsModelCopyWith<$Res> get sourceTable;
}

/// @nodoc
class __$$_TablesSyncParamsRuntimeModelCopyWithImpl<$Res>
    extends _$TablesSyncParamsRuntimeModelCopyWithImpl<$Res,
        _$_TablesSyncParamsRuntimeModel>
    implements _$$_TablesSyncParamsRuntimeModelCopyWith<$Res> {
  __$$_TablesSyncParamsRuntimeModelCopyWithImpl(
      _$_TablesSyncParamsRuntimeModel _value,
      $Res Function(_$_TablesSyncParamsRuntimeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? sourceTable = null,
    Object? columnNames = null,
    Object? shouldUpdateValues = null,
    Object? shouldAddNewValues = null,
    Object? shouldClearValueBeforeUpdate = null,
    Object? destinationTables = null,
    Object? workbookName = null,
    Object? name = null,
    Object? lastSyncAt = freezed,
  }) {
    return _then(_$_TablesSyncParamsRuntimeModel(
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
      sourceTable: null == sourceTable
          ? _value.sourceTable
          : sourceTable // ignore: cast_nullable_to_non_nullable
              as TableParamsModel,
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
      shouldClearValueBeforeUpdate: null == shouldClearValueBeforeUpdate
          ? _value.shouldClearValueBeforeUpdate
          : shouldClearValueBeforeUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      destinationTables: null == destinationTables
          ? _value._destinationTables
          : destinationTables // ignore: cast_nullable_to_non_nullable
              as List<TableParamsModel>,
      workbookName: null == workbookName
          ? _value.workbookName
          : workbookName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastSyncAt: freezed == lastSyncAt
          ? _value.lastSyncAt
          : lastSyncAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TablesSyncParamsRuntimeModel extends _TablesSyncParamsRuntimeModel {
  const _$_TablesSyncParamsRuntimeModel(
      {required this.id,
      required this.userId,
      required this.createdAt,
      required this.sourceTable,
      required final List<String> columnNames,
      required this.shouldUpdateValues,
      required this.shouldAddNewValues,
      required this.shouldClearValueBeforeUpdate,
      final List<TableParamsModel> destinationTables = const [],
      this.workbookName = '',
      this.name = '',
      this.lastSyncAt})
      : _columnNames = columnNames,
        _destinationTables = destinationTables,
        super._();

  factory _$_TablesSyncParamsRuntimeModel.fromJson(Map<String, dynamic> json) =>
      _$$_TablesSyncParamsRuntimeModelFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime createdAt;
  @override
  final TableParamsModel sourceTable;
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
  final bool shouldClearValueBeforeUpdate;
  final List<TableParamsModel> _destinationTables;
  @override
  @JsonKey()
  List<TableParamsModel> get destinationTables {
    if (_destinationTables is EqualUnmodifiableListView)
      return _destinationTables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_destinationTables);
  }

  @override
  @JsonKey()
  final String workbookName;
  @override
  @JsonKey()
  final String name;
  @override
  final DateTime? lastSyncAt;

  @override
  String toString() {
    return 'TablesSyncParamsRuntimeModel(id: $id, userId: $userId, createdAt: $createdAt, sourceTable: $sourceTable, columnNames: $columnNames, shouldUpdateValues: $shouldUpdateValues, shouldAddNewValues: $shouldAddNewValues, shouldClearValueBeforeUpdate: $shouldClearValueBeforeUpdate, destinationTables: $destinationTables, workbookName: $workbookName, name: $name, lastSyncAt: $lastSyncAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TablesSyncParamsRuntimeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.sourceTable, sourceTable) ||
                other.sourceTable == sourceTable) &&
            const DeepCollectionEquality()
                .equals(other._columnNames, _columnNames) &&
            (identical(other.shouldUpdateValues, shouldUpdateValues) ||
                other.shouldUpdateValues == shouldUpdateValues) &&
            (identical(other.shouldAddNewValues, shouldAddNewValues) ||
                other.shouldAddNewValues == shouldAddNewValues) &&
            (identical(other.shouldClearValueBeforeUpdate,
                    shouldClearValueBeforeUpdate) ||
                other.shouldClearValueBeforeUpdate ==
                    shouldClearValueBeforeUpdate) &&
            const DeepCollectionEquality()
                .equals(other._destinationTables, _destinationTables) &&
            (identical(other.workbookName, workbookName) ||
                other.workbookName == workbookName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastSyncAt, lastSyncAt) ||
                other.lastSyncAt == lastSyncAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      createdAt,
      sourceTable,
      const DeepCollectionEquality().hash(_columnNames),
      shouldUpdateValues,
      shouldAddNewValues,
      shouldClearValueBeforeUpdate,
      const DeepCollectionEquality().hash(_destinationTables),
      workbookName,
      name,
      lastSyncAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TablesSyncParamsRuntimeModelCopyWith<_$_TablesSyncParamsRuntimeModel>
      get copyWith => __$$_TablesSyncParamsRuntimeModelCopyWithImpl<
          _$_TablesSyncParamsRuntimeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TablesSyncParamsRuntimeModelToJson(
      this,
    );
  }
}

abstract class _TablesSyncParamsRuntimeModel
    extends TablesSyncParamsRuntimeModel {
  const factory _TablesSyncParamsRuntimeModel(
      {required final String id,
      required final String userId,
      required final DateTime createdAt,
      required final TableParamsModel sourceTable,
      required final List<String> columnNames,
      required final bool shouldUpdateValues,
      required final bool shouldAddNewValues,
      required final bool shouldClearValueBeforeUpdate,
      final List<TableParamsModel> destinationTables,
      final String workbookName,
      final String name,
      final DateTime? lastSyncAt}) = _$_TablesSyncParamsRuntimeModel;
  const _TablesSyncParamsRuntimeModel._() : super._();

  factory _TablesSyncParamsRuntimeModel.fromJson(Map<String, dynamic> json) =
      _$_TablesSyncParamsRuntimeModel.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get createdAt;
  @override
  TableParamsModel get sourceTable;
  @override
  List<String> get columnNames;
  @override
  bool get shouldUpdateValues;
  @override
  bool get shouldAddNewValues;
  @override
  bool get shouldClearValueBeforeUpdate;
  @override
  List<TableParamsModel> get destinationTables;
  @override
  String get workbookName;
  @override
  String get name;
  @override
  DateTime? get lastSyncAt;
  @override
  @JsonKey(ignore: true)
  _$$_TablesSyncParamsRuntimeModelCopyWith<_$_TablesSyncParamsRuntimeModel>
      get copyWith => throw _privateConstructorUsedError;
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
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, locale, themeMode);

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
