import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_app/screens/create_sync/bloc/tables_sync_bloc.dart';
import 'package:ts_core/ts_core.dart';
import 'package:ts_design_core/ts_design_core.dart';

part 'tables_sync_state.dart';

class TablesSyncScreen extends StatelessWidget {
  const TablesSyncScreen({
    this.syncId,
    super.key,
  });
  final TablesSyncParamsModelId? syncId;
  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => TablesSyncBloc(
        diDto: TablesSyncBlocDiDto.use(context.read),
      ),
      child: Builder(
        builder: (final context) {
          return _TablesSyncWidgetStateProvider(syncId: syncId);
        },
      ),
    );
  }
}

class _TablesSyncWidgetStateProvider extends HookWidget {
  const _TablesSyncWidgetStateProvider({
    required this.syncId,
  });
  final TablesSyncParamsModelId? syncId;

  @override
  Widget build(final BuildContext context) {
    final widgetState = useTablesSyncWidgetState(syncId: syncId);
    return Provider(
      create: (final context) => widgetState,
      builder: (final context, final child) {
        return BlocBuilder<TablesSyncBloc, TablesSyncState>(
          builder: (final context, final state) {
            if (state is EmptyTablesSyncState) {
              return const Center(
                child: SizedBox.square(
                  dimension: 24,
                  child: ProgressRing(),
                ),
              );
            } else if (state is LiveTablesSyncParamsState) {
              return const _TablesSyncBody();
            }
            throw ArgumentError.value(state);
          },
        );
      },
    );
  }
}

class _TablesSyncBody extends StatelessWidget {
  const _TablesSyncBody();

  @override
  Widget build(final BuildContext context) {
    final uiTheme = UiTheme.of(context);
    final theme = FluentTheme.of(context);
    final widgetState = context.read<TablesSyncWidgetState>();
    final controllers = context.read<TablesSyncBloc>().controllers;

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
              style: theme.typography.bodyLarge,
            ),
            uiTheme.verticalBoxes.small,
            const SelectSourceTableButton(),
            uiTheme.verticalBoxes.large,
            Text(
              'Source Columns',
              style: theme.typography.bodyLarge,
            ),
            uiTheme.verticalBoxes.small,
            const SyncColumnsSelector(),
            uiTheme.verticalBoxes.large,
            Text(
              'Destination Tables',
              style: theme.typography.bodyLarge,
            ),
            uiTheme.verticalBoxes.small,
            const DestinationTablesSelector(),
            uiTheme.verticalBoxes.extraLarge,
            BlocSelector<TablesSyncBloc, TablesSyncState, bool>(
              selector: (final state) {
                if (state is LiveTablesSyncParamsState) {
                  return state.shouldAddNewValues;
                }
                return false;
              },
              builder: (final context, final shouldAddNewValues) {
                return ListTile.selectable(
                  title: const Text('Should add new values'),
                  selectionMode: ListTileSelectionMode.multiple,
                  onSelectionChange: widgetState.onChangeShouldAddNewValues,
                  selected: shouldAddNewValues,
                );
              },
            ),
            BlocSelector<TablesSyncBloc, TablesSyncState, bool>(
              selector: (final state) {
                if (state is LiveTablesSyncParamsState) {
                  return state.shouldUpdateValues;
                }
                return false;
              },
              builder: (final context, final shouldUpdateValues) {
                return ListTile.selectable(
                  title: const Text('Should update values'),
                  selectionMode: ListTileSelectionMode.multiple,
                  onSelectionChange: widgetState.onChangeShouldUpdateValues,
                  selected: shouldUpdateValues,
                );
              },
            ),
            uiTheme.verticalBoxes.extraLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocSelector<TablesSyncBloc, TablesSyncState, bool>(
                  selector: (final state) {
                    if (state is LiveTablesSyncParamsState) {
                      return state.validate();
                    }
                    return false;
                  },
                  builder: (final context, final isValide) {
                    return FilledButton(
                      onPressed: isValide ? widgetState.onSubmit : null,
                      child: ValueListenableBuilder(
                        valueListenable: controllers.isSaving,
                        child:
                            Text(widgetState.isCreateSync ? 'Create' : 'Save'),
                        builder: (final context, final isSaving, final child) {
                          if (isSaving) {
                            return const SizedBox.square(
                              dimension: 24,
                              child: ProgressRing(),
                            );
                          }
                          return child!;
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SelectSourceTableButton extends StatelessWidget {
  const SelectSourceTableButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final widgetState = context.read<TablesSyncWidgetState>();
    final uiTheme = UiTheme.of(context);

    return Row(
      children: [
        Expanded(
          child: BlocSelector<TablesSyncBloc, TablesSyncState,
              Set<TableParamsModel>>(
            selector: (final state) {
              if (state is LiveTablesSyncParamsState) {
                return state.getAllTables();
              }
              return {};
            },
            builder: (final context, final selectedTables) {
              return AutoSuggestBox<TableParamsModel>(
                sorter: (final text, final items) {
                  return items
                      .where((final item) => item.label.contains(text))
                      .toList();
                },
                items: selectedTables.map((final item) {
                  return AutoSuggestBoxItem<TableParamsModel>(
                    value: item,
                    label: item.name,
                  );
                }).toList(),
                onSelected: widgetState.onSelectSourceTable,
              );
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
    final uiTheme = UiTheme.of(context);
    final widgetState = context.read<TablesSyncWidgetState>();
    final controllers = context.read<TablesSyncBloc>().controllers;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: TextBox(
                onEditingComplete: widgetState.onAddColumn,
                controller: controllers.newColumn,
                onSubmitted: widgetState.onAddColumn,
              ),
            ),
            uiTheme.horizontalBoxes.medium,
            IconButton(
              icon: const Icon(FluentIcons.add),
              onPressed: widgetState.onAddColumn,
            ),
          ],
        ),
        uiTheme.verticalBoxes.medium,
        material.Material(
          color: Colors.transparent,
          child: BlocSelector<TablesSyncBloc, TablesSyncState, Set<String>>(
            selector: (final state) {
              if (state is LiveTablesSyncParamsState) {
                return state.columnNames;
              }
              return {};
            },
            builder: (final context, final syncColumnsSet) {
              return Wrap(
                spacing: 12,
                runSpacing: 6,
                children: syncColumnsSet
                    .map(
                      (final columnName) => material.InputChip(
                        key: ValueKey(columnName),
                        label: Text(columnName),
                        onDeleted: () => widgetState.onDeleteColumn(columnName),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class DestinationTablesSelector extends StatelessWidget {
  const DestinationTablesSelector({super.key});

  @override
  Widget build(final BuildContext context) {
    final widgetState = context.read<TablesSyncWidgetState>();
    final blocState = context.select<TablesSyncBloc, LiveTablesSyncParamsState>(
      (final state) => state.getLiveState(),
    );
    final uiTheme = UiTheme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: AutoSuggestBox<TableParamsModel>(
                sorter: (final text, final items) {
                  return items
                      .where((final item) => item.label.contains(text))
                      .toList();
                },
                items: blocState.unselectedDestinationTables.map((final item) {
                  return AutoSuggestBoxItem<TableParamsModel>(
                    value: item,
                    label: item.name,
                  );
                }).toList(),
                onSelected: (final tableCheckox) {
                  final table = tableCheckox.value;
                  if (table == null) return;
                  widgetState.onAddDestinationTable(table);
                },
              ),
            ),
            uiTheme.horizontalBoxes.medium,
            const AddNewTableIconButton()
          ],
        ),
        uiTheme.verticalBoxes.medium,
        material.Material(
          color: Colors.transparent,
          child: Wrap(
            spacing: 12,
            runSpacing: 6,
            children: blocState.selectedDestinationTables
                .map(
                  (final table) => material.InputChip(
                    key: ValueKey(table),
                    label: Text(table.name),
                    onDeleted: () =>
                        widgetState.onDeleteDestinationTable(table),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class AddNewTableIconButton extends StatelessWidget {
  const AddNewTableIconButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = context.read<TablesSyncWidgetState>();
    return IconButton(
      icon: const Icon(FluentIcons.add),
      onPressed: state.onAddNewTable,
    );
  }
}
