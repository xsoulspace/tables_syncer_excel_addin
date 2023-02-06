import '../../models/models.dart';

abstract class IUserApiService {
  Future<void> upsertUser(final UserModel model);
  Future<UserModel?> getUserById(final String id);
}
