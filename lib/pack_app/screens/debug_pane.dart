import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ts_core/ts_core.dart';

class DebugPane extends HookWidget {
  const DebugPane({super.key});

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
                  trailing: Switch.adaptive(
                    value: settingsNotifier.useMockData.value,
                    onChanged: (final newValue) {
                      settingsNotifier.useMockData.value = newValue;
                    },
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 100),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: analytics.clearLogs,
                        child: const Text('Clear log messages'),
                      ),
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
