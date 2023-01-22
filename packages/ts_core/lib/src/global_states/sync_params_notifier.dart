import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_hooks/life_hooks.dart';

import '../../ts_core.dart';

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

  Future<void> loadTablesParams() async {
    final snapshot = await apiServices.tables.tableQuery.get();
    final tables = snapshot.docs.map((final e) => e.data());
    tableParams.addAll(tables);
  }

  Future<void> loadTablesSyncParams() async {
    final snapshot = await apiServices.tablesSync.tableSyncQuery.get();
    final syncs = snapshot.docs.map((final e) => e.data());
    syncParams.addAll(syncs);
  }

  @override
  Future<void> onLoad() async {
    await _clearData();
    await loadTablesParams();
    await loadTablesSyncParams();
    final tablesStream = apiServices.tables.tableQuery.snapshots();
    tablesSubscription = tablesStream.listen(onTableSnapshot);
    final syncStream = apiServices.tablesSync.tableSyncQuery.snapshots();
    tablesSyncsSubscription = syncStream.listen(onTableSyncSnapshot);
  }

  void onTableSnapshot(final QuerySnapshot<TableParamsModel> snapshot) {
    tableParams
      ..clear()
      ..addAll(snapshot.docs.map((final e) => e.data()));

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

  Future<void> _clearData() async {
    await tablesSubscription?.cancel();
    await tablesSyncsSubscription?.cancel();
    tableParams.clear();
    syncParams.clear();
  }

  @override
  void dispose() {
    _clearData();
    super.dispose();
  }
}
