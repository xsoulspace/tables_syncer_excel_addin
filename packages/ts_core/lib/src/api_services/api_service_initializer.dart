import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../analytics/analytics.dart';
import '../api_interceptors/api_interceptors.dart';
import '../global_states/global_states.dart';
import 'api_services.dart';

class ApiServiceInitializer extends ChangeNotifier {
  ApiServiceInitializer({
    required this.baseUrl,
  }) {
    dio = _initDio();
  }
  final String baseUrl;
  late final Dio dio;

  @override
  void dispose() {
    dio.close();

    super.dispose();
  }

  Dio _initDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Access-Control-Allow-Origin': '*',
        },
      ),
    );

    return dio;
  }

  void addInterceptors({
    required final UserNotifier userNotifier,
    required final ApiServices apiServices,
    required final AnalyticsNotifier loggerNotifier,
    required final ApiVerifier apiVerifier,
  }) {
    dio.interceptors
      ..add(
        AuthInterceptor(
          apiServices: apiServices,
          userNotifier: userNotifier,
          apiVerifier: apiVerifier,
          loggerNotifier: loggerNotifier,
        ),
      )
      ..add(
        LoggerInterceptor(loggerNotifier: loggerNotifier),
      );
  }
}
