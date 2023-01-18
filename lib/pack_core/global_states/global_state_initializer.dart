import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/firebase_options.dart';
import 'package:tables_syncer_excel_addin/pack_core/ads/ads.dart';
import 'package:tables_syncer_excel_addin/pack_core/pack_core.dart';
import 'package:ts_core/ts_core.dart';
import 'package:universal_io/io.dart';

class GlobalSettingsInitializer extends StateInitializer {
  @override
  Future<void> onLoad(final BuildContext context) async {
    final read = context.read;
    final appSettingsNotifier = read<UserNotifier>();
    await appSettingsNotifier.onLoad();
  }
}

class GlobalStateInitializer extends StateInitializer {
  @override
  Future<void> onLoad(final BuildContext context) async {
    final read = context.read;
    final adManager = read<AdManager>();
    final services = read<ApiServices>();
    final analyticsNotifier = read<AnalyticsNotifier>();
    final appRouterController = AppRouterController.use(read);
    await FirebaseInitializer()
        .onDelayedLoad(DefaultFirebaseOptions.currentPlatform);
    await analyticsNotifier.onDelayedLoad();
    await adManager.onLoad();
    final event = () {
      if (kIsWeb) return AnalyticEvents.usedInWeb;
      if (Platform.isAndroid) return AnalyticEvents.usedInAndroid;
    }();
    if (event != null) unawaited(analyticsNotifier.logAnalyticEvent(event));
  }
}
