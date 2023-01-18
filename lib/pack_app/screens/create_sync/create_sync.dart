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
          content: Container(
            constraints: BoxConstraints(
              maxWidth: WidthFormFactor.mobile.max * 0.8,
            ),
            padding: const EdgeInsets.all(24),
            child: ListView(
              children: [
                Text(
                  'Create Sync',
                  textAlign: TextAlign.center,
                  style: theme.typography.title,
                ),
                uiTheme.verticalBoxes.extraLarge,
                Text(
                  'Source Table',
                  textAlign: TextAlign.center,
                  style: theme.typography.bodyLarge,
                ),
                uiTheme.verticalBoxes.small,
                const SelectSourceTableButton(),
                uiTheme.verticalBoxes.large,
                Text(
                  'Source Columns',
                  textAlign: TextAlign.center,
                  style: theme.typography.bodyLarge,
                ),
                uiTheme.verticalBoxes.small,
                const SyncColumnsSelector(),
                uiTheme.verticalBoxes.large,
                Text(
                  'Destination Tables',
                  textAlign: TextAlign.center,
                  style: theme.typography.bodyLarge,
                ),
                uiTheme.verticalBoxes.small,
                const DestinationTablesSelector(),
                uiTheme.verticalBoxes.extraLarge,
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
    final uiTheme = UiTheme.of(context);

    return Row(
      children: [
        Expanded(
          child: AutoSuggestBox<TableParamsModel>(
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
            onSelected: (final item) {
              state.sourceTableNotifier.value = item.value;
            },
          ),
        ),
        uiTheme.horizontalBoxes.medium,
        const AddNewTableIconButton(),
      ],
    );
  }
}

class SyncColumnsSelector extends StatelessWidget {
  const SyncColumnsSelector({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = context.read<CreateTablesSyncState>();
    final uiTheme = UiTheme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: TextBox(
                onEditingComplete: state.onAddSyncColumn,
                controller: state.newColumnController,
                onSubmitted: state.onAddSyncColumn,
              ),
            ),
            uiTheme.horizontalBoxes.medium,
            IconButton(
              icon: const Icon(FluentIcons.add),
              onPressed: state.onAddSyncColumn,
            ),
          ],
        ),
        ValueListenableBuilder(
          valueListenable: state.syncColumnsSetNotifier,
          builder: (final context, final syncColumnsSet, final child) {
            return material.Material(
              child: Wrap(
                children: syncColumnsSet
                    .map(
                      (final columnName) => material.InputChip(
                        key: ValueKey(columnName),
                        label: Text(columnName),
                        onDeleted: () => state.onDeleteSyncColumn(columnName),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class DestinationTablesSelector extends StatelessWidget {
  const DestinationTablesSelector({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = context.read<CreateTablesSyncState>();
    final uiTheme = UiTheme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ValueListenableBuilder(
          valueListenable: state.destinationTablesNotifier,
          builder: (final context, final destinationTables, final child) {
            return Wrap(
              children: destinationTables
                  .mapIndexed(
                    (final index, final table) => material.InputChip(
                      key: ValueKey(table),
                      label: Text(table.name),
                      onDeleted: () => state.onDeleteDestination(index),
                    ),
                  )
                  .toList(),
            );
          },
        ),
        Row(
          children: [
            Expanded(
              child: AutoSuggestBox<TableParamsModel>(
                sorter: (final text, final items) {
                  return items
                      .where((final item) => item.label.contains(text))
                      .toList();
                },
                items: state.diDto.syncParamsNotifier.tableParams
                    .map((final item) {
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
              ),
            ),
            uiTheme.horizontalBoxes.medium,
            const AddNewTableIconButton()
          ],
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
