part of 'api_interceptors.dart';

class ApiVersionPathsStrategies {
  ApiVersionPathsStrategies._();
  static final v1 = <String, ApiStrategy>{
    '/auth': ApiStrategy(
      equalityPolicy: EqualityPolicy.startWith,
    ),
  };
}
