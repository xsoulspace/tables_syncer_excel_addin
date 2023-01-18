import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../ts_core.dart';
import '../abstract/abstract.dart';

class FirebaseTableApiService implements ITableApiService {
  FirebaseTableApiService({
    required this.userApiService,
  });
  final IUserApiService userApiService;
  final _store = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> get _collection =>
      _store.collection('tables');
  CollectionReference<TableParamsModel> get _docCollection =>
      _collection.withConverter(
        fromFirestore: TableParamsModel.fromFirestore,
        toFirestore: TableParamsModel.toFirestore,
      );

  @override
  Future<TableParamsModel?> getByTableId(final TableParamsId id) async {
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
