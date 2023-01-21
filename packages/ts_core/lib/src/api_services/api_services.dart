import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ts_core.dart';
import 'abstract/abstract.dart';

export 'api_service_initializer.dart';
export 'auth_local_service.dart';
export 'auth_service.dart';
export 'firebase/firebase.dart';
export 'local_data_service.dart';
export 'local_data_service.dart';
export 'local_data_service.dart';
export 'local_user_service.dart';

abstract class ApiService {}

class ApiServices {
  ApiServices._({
    required this.user,
    required this.tables,
    required this.authService,
    required this.localUser,
    required this.tablesSync,
  });

  factory ApiServices.create(final BuildContext context) {
    final dio = context.read<ApiServiceInitializer>().dio;

    final ILocalDataService localDataService = SharedPreferencesDataService();
    final authLocalService = AuthLocalService(
      authLocalApi: AuthLocalApi(localDataService: localDataService),
    );
    final authService = AuthService(
      authLocalService: authLocalService,
      authApi: AuthApi(dio),
    );
    final IUserApiService userApiService = FirebaseUserApiService();
    return ApiServices._(
      user: userApiService,
      tablesSync: FirebaseTableSyncApiService(),
      tables: FirebaseTableApiService(),
      localUser: LocalUserService(localDataService: localDataService),
      authService: authService,
    );
  }

  final IUserApiService user;
  final LocalUserService localUser;
  final ITableApiService tables;
  final ITableSyncApiService tablesSync;
  final AuthService authService;
}
