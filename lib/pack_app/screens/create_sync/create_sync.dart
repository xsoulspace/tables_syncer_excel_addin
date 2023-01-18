import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ts_core/ts_core.dart';
import 'package:ts_design_core/ts_design_core.dart';

part 'create_sync_state.dart';

class CreateTablesSyncScreen extends HookWidget {
  const CreateTablesSyncScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final state = useCreateTablesSyncState(read: context.read);
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
                uiTheme.verticalBoxes.small,
                const SelectSourceTableButton(),
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

class SelectSourceTableButton extends StatelessWidget {
  const SelectSourceTableButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = context.read<CreateTablesSyncState>();

    return AutoSuggestBox<TableParamsModel>(
      sorter: (final text, final items) {
        return items.where((final item) => item.label.contains(text)).toList();
      },
      items: state.diDto.syncParamsNotifier.tableParams.map((final item) {
        return AutoSuggestBoxItem<TableParamsModel>(
          value: item,
          label: item.name,
        );
      }).toList(),
      onSelected: (final item) {
        state.sourceTable = item.value;
      },
      trailingIcon: const AddNewTableIconButton(),
    );
  }
}

class SelectDestinationTablesButton extends StatelessWidget {
  const SelectDestinationTablesButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = context.read<CreateTablesSyncState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          children: state.destinationSheets
              .mapIndexed(
                (final index, final table) => material.InputChip(
                  key: ValueKey(table),
                  label: Text(table.name),
                  onDeleted: () => state.onDeleteDestination(index),
                ),
              )
              .toList(),
        ),
        AutoSuggestBox<TableParamsModel>(
          sorter: (final text, final items) {
            return items
                .where((final item) => item.label.contains(text))
                .toList();
          },
          items: state.diDto.syncParamsNotifier.tableParams.map((final item) {
            return AutoSuggestBoxItem<TableParamsModel>(
              value: item,
              label: item.name,
            );
          }).toList(),
          onSelected: (final tableCheckox) {
            final table = tableCheckox.value;
            if (table == null) return;
            state.onAddDestination(table);
          },
          trailingIcon: const AddNewTableIconButton(),
        ),
      ],
    );
  }
}

class AddNewTableIconButton extends StatelessWidget {
  const AddNewTableIconButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = context.read<CreateTablesSyncState>();
    return IconButton(
      icon: const Icon(FluentIcons.add),
      onPressed: state.onAddNewTable,
    );
  }
}
