import 'package:ts_core/ts_core.dart';

class GlobalStateNotifiers {
  GlobalStateNotifiers._();
  static UserNotifier? _userNotifierInstance;
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  static UserNotifier getUser() => _userNotifierInstance ??= UserNotifier.use(
        LocalUserService(localDataService: SharedPreferencesDataService()),
      );
  static AnalyticsNotifier getAnalytics() => AnalyticsNotifier();
}
