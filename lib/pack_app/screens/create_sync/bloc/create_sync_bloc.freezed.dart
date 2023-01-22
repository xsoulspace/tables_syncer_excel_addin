// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_sync_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LiveCreateSyncState {
  Set<TableParamsModel> get unselectedDestinationTables =>
      throw _privateConstructorUsedError;
  Set<TableParamsModel> get selectedDestinationTables =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LiveCreateSyncStateCopyWith<LiveSyncParamsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveCreateSyncStateCopyWith<$Res> {
  factory $LiveCreateSyncStateCopyWith(
          LiveSyncParamsState value, $Res Function(LiveSyncParamsState) then) =
      _$LiveCreateSyncStateCopyWithImpl<$Res, LiveSyncParamsState>;
  @useResult
  $Res call(
      {Set<TableParamsModel> unselectedDestinationTables,
      Set<TableParamsModel> selectedDestinationTables});
}

/// @nodoc
class _$LiveCreateSyncStateCopyWithImpl<$Res, $Val extends LiveSyncParamsState>
    implements $LiveCreateSyncStateCopyWith<$Res> {
  _$LiveCreateSyncStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unselectedDestinationTables = null,
    Object? selectedDestinationTables = null,
  }) {
    return _then(_value.copyWith(
      unselectedDestinationTables: null == unselectedDestinationTables
          ? _value.unselectedDestinationTables
          : unselectedDestinationTables // ignore: cast_nullable_to_non_nullable
              as Set<TableParamsModel>,
      selectedDestinationTables: null == selectedDestinationTables
          ? _value.selectedDestinationTables
          : selectedDestinationTables // ignore: cast_nullable_to_non_nullable
              as Set<TableParamsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LiveCreateSyncStateCopyWith<$Res>
    implements $LiveCreateSyncStateCopyWith<$Res> {
  factory _$$_LiveCreateSyncStateCopyWith(_$_LiveCreateSyncState value,
          $Res Function(_$_LiveCreateSyncState) then) =
      __$$_LiveCreateSyncStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Set<TableParamsModel> unselectedDestinationTables,
      Set<TableParamsModel> selectedDestinationTables});
}

/// @nodoc
class __$$_LiveCreateSyncStateCopyWithImpl<$Res>
    extends _$LiveCreateSyncStateCopyWithImpl<$Res, _$_LiveCreateSyncState>
    implements _$$_LiveCreateSyncStateCopyWith<$Res> {
  __$$_LiveCreateSyncStateCopyWithImpl(_$_LiveCreateSyncState _value,
      $Res Function(_$_LiveCreateSyncState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unselectedDestinationTables = null,
    Object? selectedDestinationTables = null,
  }) {
    return _then(_$_LiveCreateSyncState(
      unselectedDestinationTables: null == unselectedDestinationTables
          ? _value._unselectedDestinationTables
          : unselectedDestinationTables // ignore: cast_nullable_to_non_nullable
              as Set<TableParamsModel>,
      selectedDestinationTables: null == selectedDestinationTables
          ? _value._selectedDestinationTables
          : selectedDestinationTables // ignore: cast_nullable_to_non_nullable
              as Set<TableParamsModel>,
    ));
  }
}

/// @nodoc

class _$_LiveCreateSyncState extends _LiveCreateSyncState {
  const _$_LiveCreateSyncState(
      {required final Set<TableParamsModel> unselectedDestinationTables,
      required final Set<TableParamsModel> selectedDestinationTables})
      : _unselectedDestinationTables = unselectedDestinationTables,
        _selectedDestinationTables = selectedDestinationTables,
        super._();

  final Set<TableParamsModel> _unselectedDestinationTables;
  @override
  Set<TableParamsModel> get unselectedDestinationTables {
    if (_unselectedDestinationTables is EqualUnmodifiableSetView)
      return _unselectedDestinationTables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_unselectedDestinationTables);
  }

  final Set<TableParamsModel> _selectedDestinationTables;
  @override
  Set<TableParamsModel> get selectedDestinationTables {
    if (_selectedDestinationTables is EqualUnmodifiableSetView)
      return _selectedDestinationTables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedDestinationTables);
  }

  @override
  String toString() {
    return 'LiveCreateSyncState(unselectedDestinationTables: $unselectedDestinationTables, selectedDestinationTables: $selectedDestinationTables)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LiveCreateSyncState &&
            const DeepCollectionEquality().equals(
                other._unselectedDestinationTables,
                _unselectedDestinationTables) &&
            const DeepCollectionEquality().equals(
                other._selectedDestinationTables, _selectedDestinationTables));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_unselectedDestinationTables),
      const DeepCollectionEquality().hash(_selectedDestinationTables));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LiveCreateSyncStateCopyWith<_$_LiveCreateSyncState> get copyWith =>
      __$$_LiveCreateSyncStateCopyWithImpl<_$_LiveCreateSyncState>(
          this, _$identity);
}

abstract class _LiveCreateSyncState extends LiveSyncParamsState
    implements CreateSyncState {
  const factory _LiveCreateSyncState(
          {required final Set<TableParamsModel> unselectedDestinationTables,
          required final Set<TableParamsModel> selectedDestinationTables}) =
      _$_LiveCreateSyncState;
  const _LiveCreateSyncState._() : super._();

  @override
  Set<TableParamsModel> get unselectedDestinationTables;
  @override
  Set<TableParamsModel> get selectedDestinationTables;
  @override
  @JsonKey(ignore: true)
  _$$_LiveCreateSyncStateCopyWith<_$_LiveCreateSyncState> get copyWith =>
      throw _privateConstructorUsedError;
}
