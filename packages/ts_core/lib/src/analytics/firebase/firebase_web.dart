import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:flutter/material.dart';

import '../notifiers/analytics_notifier.dart';
import 'abstract_firebase.dart';

class FirebaseInitializer implements AbstractFirebaseInitializer {
  @override
  Future<void> onLoad(final FirebaseOptions options) async {}
  @override
  Future<void> onDelayedLoad(final FirebaseOptions options) async {
    await FirebaseCoreWeb().initializeApp(
      options: options,
    );
  }
}

class FirebaseAnalyticsPlugin implements AbstractAnalytics {
  FirebaseAnalyticsWeb analytics = FirebaseAnalyticsWeb();
  bool isEnabled = false;
  @override
  Future<void> onLoad() async {}
  @override
  Future<void> onDelayedLoad() async {
    isEnabled = kTestingAnalytics || await analytics.isSupported();
    if (isEnabled) {
      /// Logs the standard `app_open` event.
      ///
      /// See: https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Event.html#APP_OPEN
      await analytics.logEvent(name: 'app_open');
    }
  }

  @override
  Future<void> recordError(
    final dynamic exception,
    final StackTrace? stack, {
    final dynamic reason,
    final Iterable<DiagnosticsNode> information = const [],
    final bool fatal = false,
    final bool? printDetails,
  }) async {
    if (!isEnabled) return;
    final errorDetailsStr = convertErrorDetailsToString(
      exception,
      stack,
      reason: reason,
      information: information,
      fatal: fatal,
      printDetails: printDetails,
    );
    await analytics.logEvent(
      name: 'error',
      parameters: {'details': errorDetailsStr},
    );
  }

  @override
  Future<void> recordFlutterError(
    final FlutterErrorDetails flutterErrorDetails, {
    final bool fatal = false,
  }) async {
    if (!isEnabled) return;
    await recordError(
      flutterErrorDetails.exceptionAsString(),
      flutterErrorDetails.stack,
      reason: flutterErrorDetails.context,
      information: flutterErrorDetails.informationCollector == null
          ? []
          : flutterErrorDetails.informationCollector!(),
      printDetails: false,
      fatal: fatal,
    );
  }

  @override
  Future<void> logAnalyticEvent(final AnalyticEvents event) async {
    if (!isEnabled) return;
    await analytics.logEvent(name: event.name);
  }
}

class FirebaseCrashlyticsPlugin implements AbstractAnalytics {
  @override
  Future<void> logAnalyticEvent(final AnalyticEvents event) async {}

  @override
  Future<void> onDelayedLoad() async {}

  @override
  Future<void> onLoad() async {}

  @override
  Future<void> recordError(
    final dynamic exception,
    final StackTrace? stack, {
    final dynamic reason,
    final Iterable<DiagnosticsNode> information = const [],
    final bool fatal = false,
    final bool? printDetails,
  }) async {}

  @override
  Future<void> recordFlutterError(
    final FlutterErrorDetails flutterErrorDetails, {
    final bool fatal = false,
  }) async {}
}
