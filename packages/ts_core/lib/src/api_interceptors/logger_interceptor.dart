part of 'api_interceptors.dart';

class LoggerInterceptor extends InterceptorsWrapper {
  LoggerInterceptor({required this.loggerNotifier});
  final AnalyticsNotifier loggerNotifier;

  @override
  Future<void> onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    loggerNotifier.dynamicInfoLog(options.data);
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    final Response response,
    final ResponseInterceptorHandler handler,
  ) async {
    loggerNotifier.dynamicInfoLog(response);
    handler.next(response);
  }

  @override
  Future<void> onError(
    final DioError err,
    final ErrorInterceptorHandler handler,
  ) async {
    loggerNotifier.dynamicErrorLog(err);
    return handler.next(err);
  }
}
