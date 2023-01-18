import 'package:firebase_core/firebase_core.dart';

/// Toggle this for testing Crashlytics in your app locally.
const kTestingCrashlytics = false;

/// Toggle this for testing Analytics in your app locally.
const kTestingAnalytics = false;

abstract class AbstractFirebaseInitializer {
  Future<void> onLoad(final FirebaseOptions options);
  Future<void> onDelayedLoad(final FirebaseOptions options);
}
