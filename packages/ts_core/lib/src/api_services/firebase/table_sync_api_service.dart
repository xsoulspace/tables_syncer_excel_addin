import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/models.dart';
import '../abstract/abstract.dart';

class _FirebaseTableSyncApiCoreService {
  _FirebaseTableSyncApiCoreService();
  FirebaseFirestore get _store => FirebaseFirestore.instance;
  User get _user => FirebaseAuth.instance.currentUser!;
  CollectionReference<Map<String, dynamic>> get _collection =>
      _store.collection('table_syncs').doc(_user.uid).collection('root');
}

class FirebaseTableSyncApiBatchService
    extends _FirebaseTableSyncApiCoreService {
  FirebaseTableSyncApiBatchService();
  WriteBatch getBatch() => _store.batch();
}

class FirebaseTableSyncApiService extends _FirebaseTableSyncApiCoreService
    implements ITableSyncApiService {
  FirebaseTableSyncApiService();

  CollectionReference<TablesSyncParamsModel> get _docCollection =>
      _collection.withConverter(
        fromFirestore: TablesSyncParamsModel.fromFirestore,
        toFirestore: TablesSyncParamsModel.toFirestore,
      );

  @override
  Future<TablesSyncParamsModel?> getByTableSyncId(
    final TableParamsModelId id,
  ) async {
    final ref = _docCollection.doc(id);
    final snapshot = await ref.get();
    return snapshot.data();
  }

  @override
  Query<TablesSyncParamsModel> get tableSyncQuery {
    return _docCollection.orderBy('index');
  }

  @override
  Future<TablesSyncParamsModel> upsertTableSync(
    final TablesSyncParamsModel model,
  ) async {
    TablesSyncParamsModel? table;
    if (model.id.isNotEmpty) {
      table = await getByTableSyncId(model.id);
    }
    if (table != null) {
      // update
      await _docCollection.doc(model.id).set(model);
    } else {
      // create
      final docRef = await _docCollection.add(model);
      final newId = docRef.id;
      table = model.copyWith(id: newId);
      await _docCollection.doc(newId).set(table);
    }

    return table;
  }

  @override
  Future<void> deleteTableSync(final TablesSyncParamsModel model) async {
    await _docCollection.doc(model.id).delete();
  }
}
