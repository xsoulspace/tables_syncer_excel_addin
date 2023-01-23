import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ts_core/ts_core.dart';
import 'package:ts_design_core/ts_design_core.dart';

part 'create_table_state.dart';

Future<TableParamsModel?> showCreateTableDialog(final BuildContext context) {
  return showDialog<TableParamsModel>(
    context: context,
    builder: (final context) {
      return const _DialogWindow();
    },
  );
}

class _DialogWindow extends HookWidget {
  const _DialogWindow({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final state = useTableParamsState(read: context.read);
    final uiTheme = UiTheme.of(context);
    return Form(
      key: state.formHelper.formKey,
      child: ContentDialog(
        title: const Text('Create Table'),
        content: ListView(
          shrinkWrap: true,
          children: [
            uiTheme.verticalBoxes.extraLarge,
            const Text('Top Left Cell Index for Headers'),
            uiTheme.verticalBoxes.large,
            Row(
              children: [
                const Text('Row'),
                uiTheme.horizontalBoxes.medium,
                Expanded(
                  child: TextBox(
                    controller: state.headerTopLeftRowIndexController,
                  ),
                ),
                const Spacer(),
                const Text('Column'),
                uiTheme.horizontalBoxes.medium,
                Expanded(
                  child: TextBox(
                    controller: state.headerTopLeftColumnIndexController,
                  ),
                ),
              ],
            ),
            uiTheme.verticalBoxes.extraLarge,
            const Text('Top Left Cell Index for Data'),
            uiTheme.verticalBoxes.medium,
            Row(
              children: [
                const Text('Row'),
                uiTheme.horizontalBoxes.medium,
                Expanded(
                  child: TextBox(
                    controller: state.dataTopLeftRowIndexController,
                  ),
                ),
                const Spacer(),
                const Text('Column'),
                uiTheme.horizontalBoxes.medium,
                Expanded(
                  child: TextBox(
                    controller: state.dataTopLeftColumnIndexController,
                  ),
                ),
              ],
            ),
            uiTheme.verticalBoxes.extraLarge,
            TextBox(
              header: 'Keys Column Index',
              controller: state.keysColumnIndexController,
            ),
            uiTheme.verticalBoxes.large,
            TextBox(
              header: 'Name (optional)',
              controller: state.nameController,
            ),
            uiTheme.verticalBoxes.extraLarge,
          ],
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: state.formHelper.loading,
            builder: (final context, final loading, final child) {
              return Button(
                onPressed: loading
                    ? null
                    : () {
                        Navigator.pop(context);
                      },
                child: const Text('Cancel'),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: state.formHelper.loading,
            builder: (final context, final loading, final child) {
              return FilledButton(
                onPressed: loading ? null : state.onCreate,
                child: loading
                    ? const SizedBox.square(
                        dimension: 24,
                        child: ProgressRing(),
                      )
                    : const Text('Create'),
              );
            },
          ),
        ],
      ),
    );
  }
}
