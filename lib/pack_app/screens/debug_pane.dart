import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ts_core/ts_core.dart';

class DebugPane extends HookWidget {
  const DebugPane({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final scrollController = useScrollController();
    final analytics = context.watch<AnalyticsNotifier>();
    final settingsNotifier = context.watch<UserNotifier>();

    return ValueListenableBuilder<bool>(
      valueListenable: settingsNotifier.debugPaneEnabled,
      builder: (final context, final visible, final child) {
        return Visibility(
          visible: visible,
          child: SizedBox(
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  title: const Text('Use mock data'),
                  trailing: material.Switch.adaptive(
                    value: settingsNotifier.useMockData.value,
                    onChanged: (final newValue) {
                      settingsNotifier.useMockData.value = newValue;
                    },
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 100),
                  child: CommandBar(
                    overflowBehavior: CommandBarOverflowBehavior.clip,
                    isCompact: true,
                    primaryItems: [
                      CommandBarBuilderItem(
                        builder: (final context, final mode, final child) {
                          return Tooltip(
                            message: 'Clear log messages',
                            child: child,
                          );
                        },
                        wrappedItem: CommandBarButton(
                          icon: const Icon(FluentIcons.clear, size: 10),
                          label: const Text('Clear'),
                          onPressed: analytics.clearLogs,
                        ),
                      ),
                      // const CommandBarSeparator(),
                    ],
                  ),
                ),
                Expanded(
                  child: Card(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: analytics.logs.length,
                      itemBuilder: (final context, final index) {
                        final log = analytics.logs[index];
                        return Card(
                          child: SelectableText(
                            log,
                            key: ValueKey(index),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
