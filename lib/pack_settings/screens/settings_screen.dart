import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ts_core/ts_core.dart';
import 'package:ts_design_core/ts_design_core.dart';

part 'settings_screen_state.dart';

class SettingsScreen extends HookWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final settingsNotifier = context.watch<UserNotifier>();
    final state = useSettingsScreenState();
    final appThemeData = UiTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          S.of(context).settings,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SettingsTile(
            icon: Icons.language_rounded,
            title: S.of(context).language,
            trailing: DropdownButton<Locale>(
              items: namedLocalesMap.values
                  .map(
                    (final locale) => DropdownMenuItem<Locale>(
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
            icon: Icons.brightness_4_rounded,
            trailing: SegmentedButton<ThemeMode>(
              segments: [
                ButtonSegment(
                  value: ThemeMode.system,
                  label: Text(S.current.appearanceSystem),
                ),
                ButtonSegment(
                  value: ThemeMode.light,
                  label: Text(S.current.appearanceLight),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  label: Text(S.current.appearanceDark),
                ),
              ],
              selected: {settingsNotifier.theme},
              onSelectionChanged: (final value) => settingsNotifier.theme =
                  value.firstOrNull ?? ThemeMode.system,
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    required this.icon,
    required this.title,
    required this.trailing,
    this.subtitle,
    super.key,
  });
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget trailing;
  @override
  Widget build(final BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4).copyWith(
          right: 4,
        ),
        child: UiListTile(
          leading: Icon(icon),
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle!) : null,
          trailing: trailing,
        ),
      ),
    );
  }
}
