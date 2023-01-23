// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MixedResponse<T> _$MixedResponseFromJson<T>(
  final Map<String, dynamic> json,
  final T Function(Object? json) fromJsonT,
) =>
    MixedResponse<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      errors: (json['errors'] as List<dynamic>?)
          ?.map(ResponseErrorDescription.fromJson)
          .toList(),
    );

T? _$nullableGenericFromJson<T>(
  final Object? input,
  final T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

_$SuccessfulDataResponse<T> _$$SuccessfulDataResponseFromJson<T>(
  final Map<String, dynamic> json,
  final T Function(Object? json) fromJsonT,
) =>
    _$SuccessfulDataResponse<T>(
      data: fromJsonT(json['data']),
      $type: json['runtime_type'] as String?,
    );

Map<String, dynamic> _$$SuccessfulDataResponseToJson<T>(
  final _$SuccessfulDataResponse<T> instance,
  final Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'runtime_type': instance.$type,
    };

_$SuccessfulVoidResponse<T> _$$SuccessfulVoidResponseFromJson<T>(
  final Map<String, dynamic> json,
  final T Function(Object? json) fromJsonT,
) =>
    _$SuccessfulVoidResponse<T>(
      $type: json['runtime_type'] as String?,
    );

Map<String, dynamic> _$$SuccessfulVoidResponseToJson<T>(
  final _$SuccessfulVoidResponse<T> instance,
  final Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'runtime_type': instance.$type,
    };

_$BadResponse<T> _$$BadResponseFromJson<T>(
  final Map<String, dynamic> json,
  final T Function(Object? json) fromJsonT,
) =>
    _$BadResponse<T>(
      errors: (json['errors'] as List<dynamic>?)
              ?.map(ResponseErrorDescription.fromJson)
              .toList() ??
          const [],
      $type: json['runtime_type'] as String?,
    );

Map<String, dynamic> _$$BadResponseToJson<T>(
  final _$BadResponse<T> instance,
  final Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'errors': instance.errors.map((final e) => e.toJson()).toList(),
      'runtime_type': instance.$type,
    };

_$_ResponseErrorDescription _$$_ResponseErrorDescriptionFromJson(
  final Map<String, dynamic> json,
) =>
    _$_ResponseErrorDescription(
      code: json['code'] as String,
      id: json['id'] as String,
      message: json['message'] as String,
      detail: json['detail'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_ResponseErrorDescriptionToJson(
  final _$_ResponseErrorDescription instance,
) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'message': instance.message,
      'detail': instance.detail,
      'status': instance.status,
    };

_$_TableParamsModel _$$_TableParamsModelFromJson(
        final Map<String, dynamic> json) =>
    _$_TableParamsModel(
      id: json['id'] as String,
      workbookOriginName: json['workbookOriginName'] as String,
      userId: json['userId'] as String,
      createdAt: fromTimestamp(json['createdAt'] as Timestamp),
      name: json['name'] as String? ?? '',
      headerTopLeftColumnIndex: json['headerTopLeftColumnIndex'] as int? ?? 0,
      headerTopLeftRowIndex: json['headerTopLeftRowIndex'] as int? ?? 0,
      dataTopLeftColumnIndex: json['dataTopLeftColumnIndex'] as int? ?? 0,
      dataTopLeftRowIndex: json['dataTopLeftRowIndex'] as int? ?? 0,
      keyColumnIndex: json['keyColumnIndex'] as int? ?? 0,
    );

Map<String, dynamic> _$$_TableParamsModelToJson(
        final _$_TableParamsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workbookOriginName': instance.workbookOriginName,
      'userId': instance.userId,
      'createdAt': toTimestamp(instance.createdAt),
      'name': instance.name,
      'headerTopLeftColumnIndex': instance.headerTopLeftColumnIndex,
      'headerTopLeftRowIndex': instance.headerTopLeftRowIndex,
      'dataTopLeftColumnIndex': instance.dataTopLeftColumnIndex,
      'dataTopLeftRowIndex': instance.dataTopLeftRowIndex,
      'keyColumnIndex': instance.keyColumnIndex,
    };

_$_TablesSyncParamsModel _$$_TablesSyncParamsModelFromJson(
  final Map<String, dynamic> json,
) =>
    _$_TablesSyncParamsModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      createdAt: fromTimestamp(json['createdAt'] as Timestamp),
      sourceTableId: json['sourceTableId'] as String,
      destinationTablesIds: (json['destinationTablesIds'] as List<dynamic>)
          .map((final e) => e as String)
          .toList(),
      columnNames: (json['columnNames'] as List<dynamic>)
          .map((final e) => e as String)
          .toList(),
      shouldUpdateValues: json['shouldUpdateValues'] as bool,
      shouldAddNewValues: json['shouldAddNewValues'] as bool,
      workbookName: json['workbookName'] as String? ?? '',
      name: json['name'] as String? ?? '',
      lastSyncAt: fromMaybeTimestamp(json['lastSyncAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_TablesSyncParamsModelToJson(
  final _$_TablesSyncParamsModel instance,
) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': toTimestamp(instance.createdAt),
      'sourceTableId': instance.sourceTableId,
      'destinationTablesIds': instance.destinationTablesIds,
      'columnNames': instance.columnNames,
      'shouldUpdateValues': instance.shouldUpdateValues,
      'shouldAddNewValues': instance.shouldAddNewValues,
      'workbookName': instance.workbookName,
      'name': instance.name,
      'lastSyncAt': toMaybeTimestamp(instance.lastSyncAt),
    };

_$_UserModel _$$_UserModelFromJson(final Map<String, dynamic> json) =>
    _$_UserModel(
      id: json['id'] as String? ?? '',
      locale: localeFromString(json['locale'] as String?),
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
    );

Map<String, dynamic> _$$_UserModelToJson(final _$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locale': localeToString(instance.locale),
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
