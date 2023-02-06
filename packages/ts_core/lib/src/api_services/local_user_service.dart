import '../models/models.dart';
import 'abstract/abstract.dart';

/// The purpose of the service is to get | set information about
/// application wide user settings like locale, etc
class LocalUserService {
  LocalUserService({
    required this.localDataService,
  });
  final ILocalDataService localDataService;
  static const _persistenceKey = 'user';
  Future<void> saveUser({
    required final UserModel user,
  }) async {
    await localDataService.setMap(_persistenceKey, user.toJson());
  }

  Future<UserModel> loadUser() async {
    final jsonMap = await localDataService.getMap(_persistenceKey);
    if (jsonMap.isEmpty) return UserModel.empty;
    try {
      return UserModel.fromJson(jsonMap);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      // TODO(arenukvern): ignore this error but handle it in future
      return UserModel.empty;
    }
  }
}
