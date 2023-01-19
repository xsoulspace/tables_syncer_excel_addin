import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ts_core/ts_core.dart';

part 'create_table_state.dart';

Future<void> showCreateTableDialog(final BuildContext context) {
  return showDialog<String>(
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
    final state = useCreateTableState(read: context.read);
    return Form(
      key: state.formHelper.formKey,
      child: ContentDialog(
        title: const Text('Create Table'),
        content: ListView(
          shrinkWrap: true,
          children: [
            const Text('Top Left cell indexes for Headers'),
            Row(
              children: [
                const Text('Row'),
                TextBox(
                  header: 'Row',
                  controller: state.headerTopLeftRowIndexController,
                ),
                const Text('Column'),
                TextBox(
                  header: 'Column',
                  controller: state.headerTopLeftColumnIndexController,
                ),
              ],
            ),
            const Text('Top Left cell indexes for Headers'),
            Row(
              children: [
                const Text('Row'),
                TextBox(
                  header: 'Row',
                  controller: state.dataTopLeftRowIndexController,
                ),
                const Text('Column'),
                TextBox(
                  header: 'Column',
                  controller: state.dataTopLeftColumnIndexController,
                ),
              ],
            ),
            TextBox(
              header: 'Keys Column Index',
              controller: state.keysColumnIndexController,
            ),
            TextBox(
              header: 'Name (optional)',
              controller: state.nameController,
            ),
          ],
        ),
        actions: [
          Button(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FilledButton(
            child: const Text('Create'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
