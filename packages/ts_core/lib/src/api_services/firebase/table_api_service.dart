import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/models.dart';
import '../abstract/abstract.dart';

class FirebaseTableApiService implements ITableApiService {
  FirebaseTableApiService();
  FirebaseFirestore get _store => FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> get _collection {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw ArgumentError.notNull();
    return _store.collection('tables/${user.uid}');
  }

  CollectionReference<TableParamsModel> get _docCollection =>
      _collection.withConverter(
        fromFirestore: TableParamsModel.fromFirestore,
        toFirestore: TableParamsModel.toFirestore,
      );

  @override
  Future<TableParamsModel?> getByTableId(final TableParamsModelId id) async {
    final ref = _docCollection.doc(id);
    final snapshot = await ref.get();
    return snapshot.data();
  }

  @override
  Query<TableParamsModel> get tableQuery {
    return _docCollection.orderBy('createdAt', descending: true);
  }

  @override
  Future<TableParamsModel> upsertTable(final TableParamsModel model) async {
    TableParamsModel? table;
    if (model.id.isNotEmpty) {
      table = await getByTableId(model.id);
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
  Future<void> deleteTable(final TableParamsModel model) async {
    await _docCollection.doc(model.id).delete();
  }
}
