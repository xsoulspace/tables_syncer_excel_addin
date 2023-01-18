import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/generated/l10n.dart';
import 'package:ts_core/ts_core.dart';

class AppSettingsNotifier extends ChangeNotifier implements Loadable {
  AppSettingsNotifier.use(final Locator read)
      : persistenceService = read<ServicesCollection>().appSettingsPersistence;
  final AppSettingsPersistenceService persistenceService;
  AppSettingsModel _settings = AppSettingsModel.empty;

  AppSettingsModel get settings => _settings;
  set settings(final AppSettingsModel value) {
    _settings = value;
    notify();
    persistenceService.saveSettings(settings: value);
  }

  ThemeMode _theme = ThemeMode.system;
  ThemeMode get theme => _theme;
  set theme(final ThemeMode value) {
    _theme = value;
    settings = settings.copyWith(
      themeMode: value,
    );
  }

  Locale? systemLocale;
  Locale? get locale => _settings.locale;
  set locale(final Locale? value) {
    if (value?.languageCode == locale?.languageCode) return;
    if (value == null) {
      settings = settings.copyWith(locale: null);
      final defaultLocale = systemLocale ?? Locales.en;
      S.load(defaultLocale);
    } else {
      final language = Languages.byLanguageCode(value.languageCode);
      final newLocale = Locales.byLanguage(language);
      S.load(newLocale);
      settings = settings.copyWith(locale: newLocale);
    }
  }

  @override
  Future<void> onLoad() async {
    _settings = await persistenceService.loadSettings();
    notify();
  }

  void notify() => notifyListeners();
}
