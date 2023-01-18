// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FirebaseSyncParams _$FirebaseSyncParamsFromJson(Map<String, dynamic> json) {
  return _FirebaseSyncParams.fromJson(json);
}

/// @nodoc
mixin _$FirebaseSyncParams {
  String get sourceTableId => throw _privateConstructorUsedError;
  List<String> get destinationTablesIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirebaseSyncParamsCopyWith<FirebaseSyncParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseSyncParamsCopyWith<$Res> {
  factory $FirebaseSyncParamsCopyWith(
          FirebaseSyncParams value, $Res Function(FirebaseSyncParams) then) =
      _$FirebaseSyncParamsCopyWithImpl<$Res, FirebaseSyncParams>;
  @useResult
  $Res call({String sourceTableId, List<String> destinationTablesIds});
}

/// @nodoc
class _$FirebaseSyncParamsCopyWithImpl<$Res, $Val extends FirebaseSyncParams>
    implements $FirebaseSyncParamsCopyWith<$Res> {
  _$FirebaseSyncParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceTableId = null,
    Object? destinationTablesIds = null,
  }) {
    return _then(_value.copyWith(
      sourceTableId: null == sourceTableId
          ? _value.sourceTableId
          : sourceTableId // ignore: cast_nullable_to_non_nullable
              as String,
      destinationTablesIds: null == destinationTablesIds
          ? _value.destinationTablesIds
          : destinationTablesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FirebaseSyncParamsCopyWith<$Res>
    implements $FirebaseSyncParamsCopyWith<$Res> {
  factory _$$_FirebaseSyncParamsCopyWith(_$_FirebaseSyncParams value,
          $Res Function(_$_FirebaseSyncParams) then) =
      __$$_FirebaseSyncParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sourceTableId, List<String> destinationTablesIds});
}

/// @nodoc
class __$$_FirebaseSyncParamsCopyWithImpl<$Res>
    extends _$FirebaseSyncParamsCopyWithImpl<$Res, _$_FirebaseSyncParams>
    implements _$$_FirebaseSyncParamsCopyWith<$Res> {
  __$$_FirebaseSyncParamsCopyWithImpl(
      _$_FirebaseSyncParams _value, $Res Function(_$_FirebaseSyncParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceTableId = null,
    Object? destinationTablesIds = null,
  }) {
    return _then(_$_FirebaseSyncParams(
      sourceTableId: null == sourceTableId
          ? _value.sourceTableId
          : sourceTableId // ignore: cast_nullable_to_non_nullable
              as String,
      destinationTablesIds: null == destinationTablesIds
          ? _value._destinationTablesIds
          : destinationTablesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FirebaseSyncParams extends _FirebaseSyncParams {
  const _$_FirebaseSyncParams(
      {required this.sourceTableId,
      required final List<String> destinationTablesIds})
      : _destinationTablesIds = destinationTablesIds,
        super._();

  factory _$_FirebaseSyncParams.fromJson(Map<String, dynamic> json) =>
      _$$_FirebaseSyncParamsFromJson(json);

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

  @override
  String toString() {
    return 'FirebaseSyncParams(sourceTableId: $sourceTableId, destinationTablesIds: $destinationTablesIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FirebaseSyncParams &&
            (identical(other.sourceTableId, sourceTableId) ||
                other.sourceTableId == sourceTableId) &&
            const DeepCollectionEquality()
                .equals(other._destinationTablesIds, _destinationTablesIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sourceTableId,
      const DeepCollectionEquality().hash(_destinationTablesIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FirebaseSyncParamsCopyWith<_$_FirebaseSyncParams> get copyWith =>
      __$$_FirebaseSyncParamsCopyWithImpl<_$_FirebaseSyncParams>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirebaseSyncParamsToJson(
      this,
    );
  }
}

abstract class _FirebaseSyncParams extends FirebaseSyncParams {
  const factory _FirebaseSyncParams(
          {required final String sourceTableId,
          required final List<String> destinationTablesIds}) =
      _$_FirebaseSyncParams;
  const _FirebaseSyncParams._() : super._();

  factory _FirebaseSyncParams.fromJson(Map<String, dynamic> json) =
      _$_FirebaseSyncParams.fromJson;

  @override
  String get sourceTableId;
  @override
  List<String> get destinationTablesIds;
  @override
  @JsonKey(ignore: true)
  _$$_FirebaseSyncParamsCopyWith<_$_FirebaseSyncParams> get copyWith =>
      throw _privateConstructorUsedError;
}

FirebaseTableParams _$FirebaseTableParamsFromJson(Map<String, dynamic> json) {
  return _FirebaseTableParams.fromJson(json);
}

/// @nodoc
mixin _$FirebaseTableParams {
  String get id => throw _privateConstructorUsedError;
  String get workbookOriginName => throw _privateConstructorUsedError;
  int get topLeftColumnIndex => throw _privateConstructorUsedError;
  int get topLeftRowIndex => throw _privateConstructorUsedError;
  List<String> get columnNames => throw _privateConstructorUsedError;
  bool get shouldUpdateValues => throw _privateConstructorUsedError;
  bool get shouldAddNewValues => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirebaseTableParamsCopyWith<FirebaseTableParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseTableParamsCopyWith<$Res> {
  factory $FirebaseTableParamsCopyWith(
          FirebaseTableParams value, $Res Function(FirebaseTableParams) then) =
      _$FirebaseTableParamsCopyWithImpl<$Res, FirebaseTableParams>;
  @useResult
  $Res call(
      {String id,
      String workbookOriginName,
      int topLeftColumnIndex,
      int topLeftRowIndex,
      List<String> columnNames,
      bool shouldUpdateValues,
      bool shouldAddNewValues});
}

/// @nodoc
class _$FirebaseTableParamsCopyWithImpl<$Res, $Val extends FirebaseTableParams>
    implements $FirebaseTableParamsCopyWith<$Res> {
  _$FirebaseTableParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workbookOriginName = null,
    Object? topLeftColumnIndex = null,
    Object? topLeftRowIndex = null,
    Object? columnNames = null,
    Object? shouldUpdateValues = null,
    Object? shouldAddNewValues = null,
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
      topLeftColumnIndex: null == topLeftColumnIndex
          ? _value.topLeftColumnIndex
          : topLeftColumnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      topLeftRowIndex: null == topLeftRowIndex
          ? _value.topLeftRowIndex
          : topLeftRowIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$_FirebaseTableParamsCopyWith<$Res>
    implements $FirebaseTableParamsCopyWith<$Res> {
  factory _$$_FirebaseTableParamsCopyWith(_$_FirebaseTableParams value,
          $Res Function(_$_FirebaseTableParams) then) =
      __$$_FirebaseTableParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String workbookOriginName,
      int topLeftColumnIndex,
      int topLeftRowIndex,
      List<String> columnNames,
      bool shouldUpdateValues,
      bool shouldAddNewValues});
}

/// @nodoc
class __$$_FirebaseTableParamsCopyWithImpl<$Res>
    extends _$FirebaseTableParamsCopyWithImpl<$Res, _$_FirebaseTableParams>
    implements _$$_FirebaseTableParamsCopyWith<$Res> {
  __$$_FirebaseTableParamsCopyWithImpl(_$_FirebaseTableParams _value,
      $Res Function(_$_FirebaseTableParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workbookOriginName = null,
    Object? topLeftColumnIndex = null,
    Object? topLeftRowIndex = null,
    Object? columnNames = null,
    Object? shouldUpdateValues = null,
    Object? shouldAddNewValues = null,
  }) {
    return _then(_$_FirebaseTableParams(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workbookOriginName: null == workbookOriginName
          ? _value.workbookOriginName
          : workbookOriginName // ignore: cast_nullable_to_non_nullable
              as String,
      topLeftColumnIndex: null == topLeftColumnIndex
          ? _value.topLeftColumnIndex
          : topLeftColumnIndex // ignore: cast_nullable_to_non_nullable
              as int,
      topLeftRowIndex: null == topLeftRowIndex
          ? _value.topLeftRowIndex
          : topLeftRowIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_FirebaseTableParams extends _FirebaseTableParams {
  const _$_FirebaseTableParams(
      {required this.id,
      required this.workbookOriginName,
      required this.topLeftColumnIndex,
      required this.topLeftRowIndex,
      required final List<String> columnNames,
      required this.shouldUpdateValues,
      required this.shouldAddNewValues})
      : _columnNames = columnNames,
        super._();

  factory _$_FirebaseTableParams.fromJson(Map<String, dynamic> json) =>
      _$$_FirebaseTableParamsFromJson(json);

  @override
  final String id;
  @override
  final String workbookOriginName;
  @override
  final int topLeftColumnIndex;
  @override
  final int topLeftRowIndex;
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
    return 'FirebaseTableParams(id: $id, workbookOriginName: $workbookOriginName, topLeftColumnIndex: $topLeftColumnIndex, topLeftRowIndex: $topLeftRowIndex, columnNames: $columnNames, shouldUpdateValues: $shouldUpdateValues, shouldAddNewValues: $shouldAddNewValues)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FirebaseTableParams &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workbookOriginName, workbookOriginName) ||
                other.workbookOriginName == workbookOriginName) &&
            (identical(other.topLeftColumnIndex, topLeftColumnIndex) ||
                other.topLeftColumnIndex == topLeftColumnIndex) &&
            (identical(other.topLeftRowIndex, topLeftRowIndex) ||
                other.topLeftRowIndex == topLeftRowIndex) &&
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
      workbookOriginName,
      topLeftColumnIndex,
      topLeftRowIndex,
      const DeepCollectionEquality().hash(_columnNames),
      shouldUpdateValues,
      shouldAddNewValues);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FirebaseTableParamsCopyWith<_$_FirebaseTableParams> get copyWith =>
      __$$_FirebaseTableParamsCopyWithImpl<_$_FirebaseTableParams>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirebaseTableParamsToJson(
      this,
    );
  }
}

abstract class _FirebaseTableParams extends FirebaseTableParams {
  const factory _FirebaseTableParams(
      {required final String id,
      required final String workbookOriginName,
      required final int topLeftColumnIndex,
      required final int topLeftRowIndex,
      required final List<String> columnNames,
      required final bool shouldUpdateValues,
      required final bool shouldAddNewValues}) = _$_FirebaseTableParams;
  const _FirebaseTableParams._() : super._();

  factory _FirebaseTableParams.fromJson(Map<String, dynamic> json) =
      _$_FirebaseTableParams.fromJson;

  @override
  String get id;
  @override
  String get workbookOriginName;
  @override
  int get topLeftColumnIndex;
  @override
  int get topLeftRowIndex;
  @override
  List<String> get columnNames;
  @override
  bool get shouldUpdateValues;
  @override
  bool get shouldAddNewValues;
  @override
  @JsonKey(ignore: true)
  _$$_FirebaseTableParamsCopyWith<_$_FirebaseTableParams> get copyWith =>
      throw _privateConstructorUsedError;
}
