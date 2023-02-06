import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tables_syncer_excel_addin/firebase_options.dart';
import 'package:tables_syncer_excel_addin/pack_core/app/app_services_provider.dart';
import 'package:tables_syncer_excel_addin/pack_core/global_states/global_states.dart';

Future<void> bootstrap(
  final Widget Function({
    required AppServicesProviderDiDto servicesDiDto,
  })
      builder,
) async {
  WidgetsFlutterBinding.ensureInitialized();
  final firebaseIntializer = GlobalStateNotifiers.getFirebaseIntializer();
  await firebaseIntializer.onLoad(DefaultFirebaseOptions.currentPlatform);

  // await Flame.device.fullScreen();
  final analyticsNotifier = GlobalStateNotifiers.getAnalytics();
  final userNotifier = GlobalStateNotifiers.getUser();
  await analyticsNotifier.onLoad();
  final servicesDiDto = AppServicesProviderDiDto(
    analyticsNotifier: analyticsNotifier,
    userNotifier: userNotifier,
  );
  runZonedGuarded(
    () => runApp(builder(servicesDiDto: servicesDiDto)),
    analyticsNotifier.recordError,
  );
}
