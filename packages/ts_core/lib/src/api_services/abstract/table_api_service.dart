import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/models.dart';

abstract class ITableApiService {
  Future<TableParamsModel> upsertTable(final TableParamsModel model);
  Future<void> deleteTable(final TableParamsModel model);
  @useResult
  Query<TableParamsModel> get tableQuery;
  Future<TableParamsModel?> getByTableId(final TableParamsModelId id);
}
