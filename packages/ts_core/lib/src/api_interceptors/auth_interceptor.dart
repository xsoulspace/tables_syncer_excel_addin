part of 'api_interceptors.dart';

class AuthInterceptor extends InterceptorsWrapper {
  AuthInterceptor({
    required this.userNotifier,
    required this.apiServices,
    required this.apiVerifier,
    required this.loggerNotifier,
  });
  final UserNotifier userNotifier;
  final ApiServices apiServices;
  final AnalyticsNotifier loggerNotifier;
  final ApiVerifier apiVerifier;

  @override
  Future<void> onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    final apiStrategy = apiVerifier.getStrategy(options.path);

    Future<void> addToken() async {
      options.headers.addAll(apiServices.authService.getTokenHeader());
    }

    switch (apiStrategy.tokenPolicy) {
      case ApiTokenPolicy.tokenFree:
        break;
      case ApiTokenPolicy.withTokenOnly:
        if (await _isAuthorized()) {
          await addToken();
        } else {
          handler.reject(DioError(requestOptions: options));
        }
        break;
      case ApiTokenPolicy.withTokenOrWithout:
        if (await _isAuthorized()) await addToken();
        break;
    }

    return super.onRequest(options, handler);
  }

  Future<void> _handleResponse({
    required final int? statusCode,
    required final VoidCallback onNext,
    required final ValueChanged<ResponseErrorDescription> onReject,
    required final dynamic data,
    required final String? message,
  }) async {
    switch (statusCode) {
      case 200:
        onNext();
        break;
      case 400:
        // TODO(arenukvern): description
        throw UnimplementedError();
      // onReject(FormatResponseException(options: getOptions()));
      // break;
      case 401:
        // TODO(arenukvern): description
        throw UnimplementedError();
      // await _isAuthorized();
      // onReject(UnauthorizedResponseException(options: getOptions()));
      // break;
      case 404:
        // TODO(arenukvern): description
        throw UnimplementedError();
      // onReject(FormatResponseException(options: getOptions()));
      // break;
      case 500:
        // TODO(arenukvern): description
        throw UnimplementedError();
      // onReject(ServerResponseException(options: getOptions()));
      // break;
      default:
        // TODO(arenukvern): description
        throw UnimplementedError();
      // onReject(AggregateResponseException(options: getOptions()));
      // break;
    }
    return;
  }

  @override
  Future<void> onResponse(
    final Response response,
    final ResponseInterceptorHandler handler,
  ) async {
    await _handleResponse(
      data: response.data,
      message: response.statusMessage,
      onNext: () => handler.next(response),
      onReject: (final error) {
        loggerNotifier.logger.e(error);
        handler.reject(
          DioError(requestOptions: response.requestOptions, error: error),
        );
      },
      statusCode: response.statusCode,
    );
  }

  @override
  Future<void> onError(
    final DioError err,
    final ErrorInterceptorHandler handler,
  ) async {
    await _handleResponse(
      data: err.response?.data,
      message: err.message,
      onNext: () => handler.next(err),
      onReject: (final error) {
        loggerNotifier.logger.e(error);
        handler.reject(
          DioError(
            requestOptions: err.requestOptions,
            error: error,
            response: err.response,
          ),
        );
      },
      statusCode: _stringToStatus(err.message),
    );
    if (handler.isCompleted) return;
    return handler.next(err);
  }

  int? _stringToStatus(final String status) {
    if (status.contains('200')) return 200;
    if (status.contains('400')) return 400;
    if (status.contains('404')) return 404;
    if (status.contains('401')) return 401;
    if (status.contains('500')) return 500;
    return null;
  }

  Future<bool> _isAuthorized() async => userNotifier.checkIsAuthorized();
}
