// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MixedResponse<T> _$MixedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    MixedResponse<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ResponseErrorDescription.fromJson(e))
          .toList(),
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

_$SuccessfulDataResponse<T> _$$SuccessfulDataResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$SuccessfulDataResponse<T>(
      data: fromJsonT(json['data']),
      $type: json['runtime_type'] as String?,
    );

Map<String, dynamic> _$$SuccessfulDataResponseToJson<T>(
  _$SuccessfulDataResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'runtime_type': instance.$type,
    };

_$SuccessfulVoidResponse<T> _$$SuccessfulVoidResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$SuccessfulVoidResponse<T>(
      $type: json['runtime_type'] as String?,
    );

Map<String, dynamic> _$$SuccessfulVoidResponseToJson<T>(
  _$SuccessfulVoidResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'runtime_type': instance.$type,
    };

_$BadResponse<T> _$$BadResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$BadResponse<T>(
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => ResponseErrorDescription.fromJson(e))
              .toList() ??
          const [],
      $type: json['runtime_type'] as String?,
    );

Map<String, dynamic> _$$BadResponseToJson<T>(
  _$BadResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'errors': instance.errors.map((e) => e.toJson()).toList(),
      'runtime_type': instance.$type,
    };

_$_ResponseErrorDescription _$$_ResponseErrorDescriptionFromJson(
        Map<String, dynamic> json) =>
    _$_ResponseErrorDescription(
      code: json['code'] as String,
      id: json['id'] as String,
      message: json['message'] as String,
      detail: json['detail'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_ResponseErrorDescriptionToJson(
        _$_ResponseErrorDescription instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'message': instance.message,
      'detail': instance.detail,
      'status': instance.status,
    };

_$_TableParamsModel _$$_TableParamsModelFromJson(Map<String, dynamic> json) =>
    _$_TableParamsModel(
      id: json['id'] as String,
      workbookOriginName: json['workbookOriginName'] as String,
      userId: json['userId'] as String,
      keyColumnName: json['keyColumnName'] as String,
      createdAt: fromTimestamp(json['createdAt'] as Timestamp),
      worksheetName: json['worksheetName'] as String,
      name: json['name'] as String? ?? '',
      headerTopLeftCell: json['headerTopLeftCell'] == null
          ? CellModel.zero
          : CellModel.fromJson(json['headerTopLeftCell']),
      dataTopLeftCell: json['dataTopLeftCell'] == null
          ? CellModel.zero
          : CellModel.fromJson(json['dataTopLeftCell']),
    );

Map<String, dynamic> _$$_TableParamsModelToJson(_$_TableParamsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workbookOriginName': instance.workbookOriginName,
      'userId': instance.userId,
      'keyColumnName': instance.keyColumnName,
      'createdAt': toTimestamp(instance.createdAt),
      'worksheetName': instance.worksheetName,
      'name': instance.name,
      'headerTopLeftCell': instance.headerTopLeftCell.toJson(),
      'dataTopLeftCell': instance.dataTopLeftCell.toJson(),
    };

_$_TablesSyncParamsModel _$$_TablesSyncParamsModelFromJson(
        Map<String, dynamic> json) =>
    _$_TablesSyncParamsModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      createdAt: fromTimestamp(json['createdAt'] as Timestamp),
      sourceTableId: json['sourceTableId'] as String,
      destinationTablesIds: (json['destinationTablesIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      columnNames: (json['columnNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      shouldUpdateValues: json['shouldUpdateValues'] as bool,
      shouldAddNewValues: json['shouldAddNewValues'] as bool,
      shouldClearValueBeforeUpdate:
          json['shouldClearValueBeforeUpdate'] as bool,
      shouldAddNewHeaders: json['shouldAddNewHeaders'] as bool? ?? false,
      workbookName: json['workbookName'] as String? ?? '',
      name: json['name'] as String? ?? '',
      lastSyncAt: fromMaybeTimestamp(json['lastSyncAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_TablesSyncParamsModelToJson(
        _$_TablesSyncParamsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': toTimestamp(instance.createdAt),
      'sourceTableId': instance.sourceTableId,
      'destinationTablesIds': instance.destinationTablesIds,
      'columnNames': instance.columnNames,
      'shouldUpdateValues': instance.shouldUpdateValues,
      'shouldAddNewValues': instance.shouldAddNewValues,
      'shouldClearValueBeforeUpdate': instance.shouldClearValueBeforeUpdate,
      'shouldAddNewHeaders': instance.shouldAddNewHeaders,
      'workbookName': instance.workbookName,
      'name': instance.name,
      'lastSyncAt': toMaybeTimestamp(instance.lastSyncAt),
    };

_$_TablesSyncParamsRuntimeModel _$$_TablesSyncParamsRuntimeModelFromJson(
        Map<String, dynamic> json) =>
    _$_TablesSyncParamsRuntimeModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      createdAt: fromTimestamp(json['createdAt'] as Timestamp),
      sourceTable: TableParamsModel.fromJson(json['sourceTable']),
      columnNames: (json['columnNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      shouldUpdateValues: json['shouldUpdateValues'] as bool,
      shouldAddNewValues: json['shouldAddNewValues'] as bool,
      shouldClearValueBeforeUpdate:
          json['shouldClearValueBeforeUpdate'] as bool,
      shouldAddNewHeaders: json['shouldAddNewHeaders'] as bool? ?? false,
      destinationTables: (json['destinationTables'] as List<dynamic>?)
              ?.map((e) => TableParamsModel.fromJson(e))
              .toList() ??
          const [],
      workbookName: json['workbookName'] as String? ?? '',
      name: json['name'] as String? ?? '',
      lastSyncAt: fromMaybeTimestamp(json['lastSyncAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_TablesSyncParamsRuntimeModelToJson(
        _$_TablesSyncParamsRuntimeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': toTimestamp(instance.createdAt),
      'sourceTable': instance.sourceTable.toJson(),
      'columnNames': instance.columnNames,
      'shouldUpdateValues': instance.shouldUpdateValues,
      'shouldAddNewValues': instance.shouldAddNewValues,
      'shouldClearValueBeforeUpdate': instance.shouldClearValueBeforeUpdate,
      'shouldAddNewHeaders': instance.shouldAddNewHeaders,
      'destinationTables':
          instance.destinationTables.map((e) => e.toJson()).toList(),
      'workbookName': instance.workbookName,
      'name': instance.name,
      'lastSyncAt': toMaybeTimestamp(instance.lastSyncAt),
    };

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String? ?? '',
      locale: localeFromString(json['locale'] as String?),
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
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
