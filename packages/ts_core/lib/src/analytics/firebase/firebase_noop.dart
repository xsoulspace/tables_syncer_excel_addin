import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../notifiers/analytics_notifier.dart';
import 'abstract_firebase.dart';

class FirebaseInitializer implements AbstractFirebaseInitializer {
  @override
  Future<void> onLoad(final FirebaseOptions options) async {
    return;
  }

  @override
  Future<void> onDelayedLoad(final FirebaseOptions options) async {
    return;
  }
}

class FirebaseAnalyticsPlugin implements AbstractAnalytics {
  bool isSupported = false;
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

  @override
  Future<void> onDelayedLoad() async {
    return;
  }

  @override
  Future<void> logAnalyticEvent(final AnalyticEvents event) async {}
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
