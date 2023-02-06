import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:office_addin_helper/office_addin_helper.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_core/ads/ads.dart';
import 'package:tables_syncer_excel_addin/pack_core/pack_core.dart';
import 'package:ts_core/ts_core.dart';
import 'package:ts_design_core/ts_design_core.dart';

class GlobalSettingsInitializer extends StateInitializer {
  @override
  Future<void> onLoad(final BuildContext context) async {
    final read = context.read;
    final appSettingsNotifier = read<UserNotifier>();
    await appSettingsNotifier.onLoad();
  }
}

class GlobalStateInitializer extends AppStateInitializer {
  GlobalStateInitializer({required this.firebaseOptions});
  final FirebaseOptions firebaseOptions;
  @override
  Future<void> onPostBindingLoad(final BuildContext context) async {
    final read = context.read;
    final adManager = read<AdManager>();
    final AnalyticsNotifier analyticsNotifier = read();
    final services = read<ApiServices>();
    final appRouterController = AppRouterController.use(read);
    await FirebaseInitializer().onDelayedLoad(firebaseOptions);
    final guards = appRouterController.routeState.parser.guards;

    if (guards != null) {
      for (final guard in guards) {
        await guard.onLoad();
      }
    }
    await analyticsNotifier.onDelayedLoad();
    await adManager.onLoad();
    final completer = Completer();

    final UserNotifier settings = read();
    final ExcelApiI excelApi = read();
    WidgetsBinding.instance.addPostFrameCallback((final timeStamp) async {
      try {
        Future<void> check() async {
          settings.excelAvailable.value =
              await ExcelHelper.checkIsExcelAvailable();
        }

        for (var i = 0; i < 4; i++) {
          await Future.delayed(const Duration(milliseconds: 300));
          await check();
          if (settings.excelAvailable.value) break;
        }
        await excelApi.onLoad();
        await FirebaseInitializer().onDelayedLoad(firebaseOptions);
        await analyticsNotifier.onDelayedLoad();

        if (settings.excelAvailable.value) {
          unawaited(
            analyticsNotifier.logAnalyticEvent(AnalyticEvents.usedInExcel),
          );
        } else {
          unawaited(
            analyticsNotifier.logAnalyticEvent(AnalyticEvents.usedInWeb),
          );
        }
      } finally {
        completer.complete();
      }
    });

    return completer.future;
  }
}

class AuthStateInitializer extends AppStateInitializer {
  AuthStateInitializer();
  @override
  Future<void> onLoad(final BuildContext context) async {
    final read = context.read;
    final syncParamsNotifier = read<SyncParamsNotifier>();
    await syncParamsNotifier.onLoad();
  }
}
