import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/generated/l10n.dart';
import 'package:tables_syncer_excel_addin/pack_core/global_states/global_states.dart';
import 'package:ts_core/ts_core.dart';
import 'package:ts_design_core/ts_design_core.dart';

part 'settings_screen_state.dart';

class SettingsScreen extends HookWidget {
  const SettingsScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final settingsNotifier = context.watch<AppSettingsNotifier>();
    final state = useSettingsScreenState();
    final appThemeData = UiTheme.of(context);
    return ScaffoldPage.scrollable(
      header: PageHeader(
        title: Text(
          S.of(context).settings,
        ),
      ),
      children: [
        SettingsTile(
          icon: FluentIcons.locale_language,
          title: S.of(context).language,
          trailing: ComboBox<Locale>(
            items: namedLocalesMap.values
                .map(
                  (final locale) => ComboBoxItem<Locale>(
                    value: locale.locale,
                    child: SizedBox(
                      width: 100,
                      child: Text(locale.name),
                    ),
                  ),
                )
                .toList(),
            value: settingsNotifier.locale,
            onChanged: (final value) => settingsNotifier.locale = value,
          ),
        ),
        appThemeData.verticalBoxes.medium,
        SettingsTile(
          title: S.of(context).appearance,
          icon: FluentIcons.brightness,
          trailing: ComboBox<ThemeMode>(
            items: [
              ComboBoxItem(
                key: const ValueKey(ThemeMode.system),
                value: ThemeMode.system,
                child: SizedBox(
                  width: 100,
                  child: Text(S.current.appearanceSystem),
                ),
              ),
              ComboBoxItem(
                key: const ValueKey(ThemeMode.light),
                value: ThemeMode.light,
                child: Text(S.current.appearanceLight),
              ),
              ComboBoxItem(
                key: const ValueKey(ThemeMode.dark),
                value: ThemeMode.dark,
                child: Text(S.current.appearanceDark),
              ),
            ],
            value: settingsNotifier.theme,
            onChanged: (final value) =>
                settingsNotifier.theme = value ?? ThemeMode.system,
          ),
        ),
      ],
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    required this.icon,
    required this.title,
    required this.trailing,
    this.subtitle,
    final Key? key,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget trailing;
  @override
  Widget build(final BuildContext context) {
    return Card(
      padding: const EdgeInsets.symmetric(vertical: 4).copyWith(
        right: 4,
      ),
      child: UiListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        trailing: trailing,
      ),
    );
  }
}
