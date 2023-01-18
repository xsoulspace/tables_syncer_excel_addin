import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/models.dart';

abstract class ITableSyncApiService {
  Future<TablesSyncParamsModel> upsertTableSync(
    final TablesSyncParamsModel model,
  );
  Future<void> deleteTableSync(final TablesSyncParamsModel model);
  @useResult
  Query<TablesSyncParamsModel> get tableSyncQuery;
  Future<TablesSyncParamsModel?> getByTableSyncId(final TableParamsModelId id);
}
