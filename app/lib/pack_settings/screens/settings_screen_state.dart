part of 'settings_screen.dart';

SettingsScreenState useSettingsScreenState() => use(
      LifeHook(
        debugLabel: 'SettingsScreenState',
        state: SettingsScreenState(),
      ),
    );

class SettingsScreenState extends LifeState {
  SettingsScreenState();
}
