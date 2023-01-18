import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../api_services/api_services.dart';
import '../localization/localization.dart';
import '../models/models.dart';

class UserNotifier extends ChangeNotifier implements Loadable {
  UserNotifier.use(final Locator read)
      : userLocalService = read<ApiServices>().localUser;
  final LocalUserService userLocalService;
  UserModel _user = UserModel.empty;

  UserModel get user => _user;
  set user(final UserModel value) {
    _user = value;
    notify();
    userLocalService.saveUser(user: value);
  }

  ThemeMode _theme = ThemeMode.system;
  ThemeMode get theme => _theme;
  set theme(final ThemeMode value) {
    _theme = value;
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
    notify();
  }

  void notify() => notifyListeners();

  Future<bool> checkIsAuthorized() async {
    // TODO(arenukvern): description
    throw UnimplementedError();
  }
}
