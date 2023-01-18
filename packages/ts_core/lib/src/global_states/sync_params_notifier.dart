import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_hooks/life_hooks.dart';

import '../api_services/api_services.dart';
import '../models/models.dart';

class SyncParamsNotifier extends ChangeNotifier
    implements Loadable, Disposable {
  SyncParamsNotifier({
    required this.apiServices,
  });
  factory SyncParamsNotifier.create(final BuildContext context) {
    return SyncParamsNotifier(apiServices: context.read());
  }
  final ApiServices apiServices;
  final tableParams = <TableParamsModel>[];
  final syncParams = <TablesSyncParamsModel>[];

  void loadTablesParams() {}
  void loadTablesSyncParams() {}

  @override
  Future<void> onLoad() async {
    final tablesStream = apiServices.tables.tableQuery.snapshots();
    tablesSubscription = tablesStream.listen(onTableSnapshot);
    final syncStream = apiServices.tablesSync.tableSyncQuery.snapshots();
    tablesSyncsSubscription = syncStream.listen(onTableSyncSnapshot);
  }

  void onTableSnapshot(final QuerySnapshot<TableParamsModel> snapshot) {
    if (snapshot.docChanges.isEmpty) return;
    for (final change in snapshot.docChanges) {
      final table = change.doc.data()!;
      switch (change.type) {
        case DocumentChangeType.added:
          tableParams.insert(change.newIndex, table);
          break;
        case DocumentChangeType.modified:
          tableParams.removeAt(change.oldIndex);
          tableParams.insert(change.newIndex, table);
          break;
        case DocumentChangeType.removed:
          tableParams.removeAt(change.oldIndex);
          break;
      }
    }
    notifyListeners();
  }

  void onTableSyncSnapshot(
    final QuerySnapshot<TablesSyncParamsModel> snapshot,
  ) {
    if (snapshot.docChanges.isEmpty) return;
    for (final change in snapshot.docChanges) {
      final tableSync = change.doc.data()!;
      switch (change.type) {
        case DocumentChangeType.added:
          syncParams.insert(change.newIndex, tableSync);
          break;
        case DocumentChangeType.modified:
          syncParams.removeAt(change.oldIndex);
          syncParams.insert(change.newIndex, tableSync);
          break;
        case DocumentChangeType.removed:
          syncParams.removeAt(change.oldIndex);
          break;
      }
    }
    notifyListeners();
  }

  StreamSubscription<QuerySnapshot<TableParamsModel>>? tablesSubscription;
  StreamSubscription<QuerySnapshot<TablesSyncParamsModel>>?
      tablesSyncsSubscription;

  @override
  void dispose() {
    tablesSubscription?.cancel();
    tablesSyncsSubscription?.cancel();
    super.dispose();
  }
}
