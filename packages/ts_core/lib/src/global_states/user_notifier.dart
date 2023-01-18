import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life_hooks/life_hooks.dart';

import '../../generated/l10n.dart';
import '../api_services/api_services.dart';
import '../localization/localization.dart';
import '../models/models.dart';

class UserNotifier extends ChangeNotifier implements Loadable, Disposable {
  UserNotifier.use(this.userLocalService);
  final LocalUserService userLocalService;
  final excelAvailable = ValueNotifier<bool>(false);
  final devinfo = ValueNotifier<String>('');
  final debugPaneEnabled = ValueNotifier(false);
  final useMockData = ValueNotifier<bool>(true);

  UserModel _user = UserModel.empty;

  UserModel get user => _user;
  set user(final UserModel value) {
    _user = value;
    notify();
    userLocalService.saveUser(user: value);
  }

  ThemeMode get theme => user.themeMode;
  set theme(final ThemeMode value) {
    user = user.copyWith(
      themeMode: value,
    );
  }

  Locale? systemLocale;
  Locale? get locale => _user.locale;
  set locale(final Locale? value) {
    if (value?.languageCode == locale?.languageCode) return;
    if (value == null) {
      user = user.copyWith(locale: null);
      final defaultLocale = systemLocale ?? Locales.en;
      S.load(defaultLocale);
    } else {
      final language = Languages.byLanguageCode(value.languageCode);
      final newLocale = Locales.byLanguage(language);
      S.load(newLocale);
      user = user.copyWith(locale: newLocale);
    }
  }

  @override
  Future<void> onLoad() async {
    _user = await userLocalService.loadUser();
    excelAvailable.addListener(_onExcelAvailableChanged);
    notify();
  }

  void notify() => notifyListeners();

  Future<bool> checkIsAuthorized() async {
    // TODO(arenukvern): description
    throw UnimplementedError();
  }

  void _onExcelAvailableChanged() {
    if (excelAvailable.value) {
      useMockData.value = false;
    } else {
      useMockData.value = true;
    }
  }

  @override
  void dispose() {
    excelAvailable
      ..removeListener(_onExcelAvailableChanged)
      ..dispose();
    devinfo.dispose();
    debugPaneEnabled.dispose();
    useMockData.dispose();
    super.dispose();
  }
}
