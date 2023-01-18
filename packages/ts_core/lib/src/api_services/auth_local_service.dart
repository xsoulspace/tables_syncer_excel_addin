import '../api/api.dart';
import 'api_services.dart';

class AuthLocalService implements ApiService {
  AuthLocalService({
    required this.authLocalApi,
  });
  final AuthLocalApi authLocalApi;
}
