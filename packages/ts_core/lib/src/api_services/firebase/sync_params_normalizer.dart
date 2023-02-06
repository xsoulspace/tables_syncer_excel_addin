import '../../models/models.dart';

class SyncParamsNormalizer {
  SyncParamsNormalizer._();
  static TablesSyncParamsRuntimeModel? normalize({
    required final TablesSyncParamsModel syncParams,
    required final Map<TableParamsModelId, TableParamsModel> tablesMap,
  }) {
    return TablesSyncParamsRuntimeModel.fromModel(
      syncParams: syncParams,
      tablesParams: tablesMap,
    );
  }
}
