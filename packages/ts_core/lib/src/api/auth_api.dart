part of 'api.dart';

@RestApi(baseUrl: '')
abstract class AuthApi {
  factory AuthApi(final Dio dio, {final String baseUrl}) = _AuthApi;
}
