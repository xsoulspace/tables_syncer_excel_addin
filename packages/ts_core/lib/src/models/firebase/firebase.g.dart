// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirebaseSyncParams _$$_FirebaseSyncParamsFromJson(
  final Map<String, dynamic> json,
) =>
    _$_FirebaseSyncParams(
      sourceTableId: json['sourceTableId'] as String,
      destinationTablesIds: (json['destinationTablesIds'] as List<dynamic>)
          .map((final e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_FirebaseSyncParamsToJson(
  final _$_FirebaseSyncParams instance,
) =>
    <String, dynamic>{
      'sourceTableId': instance.sourceTableId,
      'destinationTablesIds': instance.destinationTablesIds,
    };

_$_FirebaseTableParams _$$_FirebaseTableParamsFromJson(
  final Map<String, dynamic> json,
) =>
    _$_FirebaseTableParams(
      id: json['id'] as String,
      workbookOriginName: json['workbookOriginName'] as String,
      topLeftColumnIndex: json['topLeftColumnIndex'] as int,
      topLeftRowIndex: json['topLeftRowIndex'] as int,
      columnNames: (json['columnNames'] as List<dynamic>)
          .map((final e) => e as String)
          .toList(),
      shouldUpdateValues: json['shouldUpdateValues'] as bool,
      shouldAddNewValues: json['shouldAddNewValues'] as bool,
    );

Map<String, dynamic> _$$_FirebaseTableParamsToJson(
  final _$_FirebaseTableParams instance,
) =>
    <String, dynamic>{
      'id': instance.id,
      'workbookOriginName': instance.workbookOriginName,
      'topLeftColumnIndex': instance.topLeftColumnIndex,
      'topLeftRowIndex': instance.topLeftRowIndex,
      'columnNames': instance.columnNames,
      'shouldUpdateValues': instance.shouldUpdateValues,
      'shouldAddNewValues': instance.shouldAddNewValues,
    };
