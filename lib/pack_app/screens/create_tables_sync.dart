import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ts_design_core/ts_design_core.dart';

part 'create_tables_sync_state.dart';

class CreateTablesSyncScreen extends HookWidget {
  const CreateTablesSyncScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final state = useCreateTablesSyncState();
    final uiTheme = UiTheme.of(context);
    final theme = FluentTheme.of(context);
    return Provider(
      create: (final context) => state,
      builder: (final context, final child) {
        return ScaffoldPage(
          content: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Create Sync',
                  textAlign: TextAlign.center,
                  style: theme.typography.title,
                ),
                uiTheme.verticalBoxes.large,
                Text(
                  'Select Source Sheet',
                  textAlign: TextAlign.center,
                  style: theme.typography.bodyLarge,
                ),
                uiTheme.verticalBoxes.large,
                Text(
                  'Select Source Columns',
                  textAlign: TextAlign.center,
                  style: theme.typography.bodyLarge,
                ),
                uiTheme.verticalBoxes.large,
                Text(
                  'Select Destination Sheets',
                  textAlign: TextAlign.center,
                  style: theme.typography.bodyLarge,
                ),
                uiTheme.verticalBoxes.large,
                ValueListenableBuilder(
                  valueListenable: state.isFilledNotifier,
                  builder: (final context, final isFilled, final child) {
                    return FilledButton(
                      onPressed: isFilled ? state.onSubmit : null,
                      child: const Text('Create'),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
