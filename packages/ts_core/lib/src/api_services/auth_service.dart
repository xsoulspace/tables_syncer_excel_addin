import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:life_hooks/life_hooks.dart';

import '../api/api.dart';
import '../models/models.dart';
import 'api_services.dart';

class AuthService extends ChangeNotifier implements ApiService, Loadable {
  AuthService({
    required this.authLocalService,
    required this.authApi,
  });
  final AuthApi authApi;
  final _isAuthEnabled = false;
  @override
  Future<void> onLoad() async {}

  @override
  void dispose() {
    super.dispose();
    _accessToken.dispose();
  }

  final AuthLocalService authLocalService;

  Future<SuccessfulDataResponse<void>> signUp({
    required final SignUpDto dto,
  }) async {
    // TODO(arenukvern): description
    throw UnimplementedError();
  }

  Future<SuccessfulDataResponse<void>> signIn({
    required final SignInDto dto,
  }) async {
    // TODO(arenukevrn): description
    throw UnimplementedError();
  }

  bool get isAuthorized {
    if (!_isAuthEnabled) return true;

    if (accessTokenStr.isEmpty) return false;
    return !JwtDecoder.isExpired(accessTokenStr);
  }

  final _accessToken = ValueNotifier<String>('');
  String get accessTokenStr => accessToken.value;
  ValueListenable<String> get accessToken => _accessToken;

  Map<String, dynamic> getTokenHeader() {
    if (accessTokenStr.isEmpty) return {};

    return {
      'Authorization': 'Bearer $accessTokenStr',
    };
  }

  void logout() {}
}
