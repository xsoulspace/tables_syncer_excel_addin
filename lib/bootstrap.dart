import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tables_syncer_excel_addin/pack_core/app/app_services_provider.dart';
import 'package:tables_syncer_excel_addin/pack_core/pack_core.dart';

Future<void> bootstrap(
  final Widget Function({
    required AppServicesProviderDiDto servicesDiDto,
  })
      builder,
) async {
  WidgetsFlutterBinding.ensureInitialized();
  final firebaseIntializer = FirebaseInitializer();
  await firebaseIntializer.onLoad();

  // await Flame.device.fullScreen();

  final analyticsNotifier = AnalyticsNotifier();
  await analyticsNotifier.onLoad();
  final servicesDiDto = AppServicesProviderDiDto(
    analyticsNotifier: analyticsNotifier,
  );
  runZonedGuarded(
    () => runApp(builder(servicesDiDto: servicesDiDto)),
    analyticsNotifier.recordError,
  );
}
