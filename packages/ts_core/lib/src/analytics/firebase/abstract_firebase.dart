import 'package:firebase_auth/firebase_auth.dart' as fire_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

/// Toggle this for testing Crashlytics in your app locally.
const kTestingCrashlytics = false;

/// Toggle this for testing Analytics in your app locally.
const kTestingAnalytics = false;

abstract class AbstractFirebaseInitializer {
  List<AuthProvider<AuthListener, fire_auth.AuthCredential>> get providers;
  Future<void> onLoad(final FirebaseOptions options);
  Future<void> onDelayedLoad(final FirebaseOptions options);
}
