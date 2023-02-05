import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_app/screens/upsert_sync/bloc/tables_sync_bloc.dart';
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
                  child: CircularProgress(),
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
    final theme = Theme.of(context);
    final widgetState = context.read<TablesSyncWidgetState>();
    final controllers = context.read<TablesSyncBloc>().controllers;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Create Sync'),
      ),
      body: Container(
        constraints: BoxConstraints(
          maxWidth: WidthFormFactor.mobile.max * 0.8,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  uiTheme.verticalBoxes.extraLarge,
                  Text(
                    'Source Table',
                    style: theme.textTheme.bodyLarge,
                  ),
                  uiTheme.verticalBoxes.small,
                  const SelectSourceTableButton(),
                  uiTheme.verticalBoxes.large,
                  Text(
                    'Source Columns',
                    style: theme.textTheme.bodyLarge,
                  ),
                  uiTheme.verticalBoxes.small,
                  const SyncColumnsSelector(),
                  uiTheme.verticalBoxes.large,
                  Text(
                    'Destination Tables',
                    style: theme.textTheme.bodyLarge,
                  ),
                  uiTheme.verticalBoxes.small,
                  const DestinationTablesSelector(),
                  uiTheme.verticalBoxes.extraLarge,
                ],
              ),
            ),
            BlocSelector<TablesSyncBloc, TablesSyncState, bool>(
              selector: (final state) {
                if (state is LiveTablesSyncParamsState) {
                  return state.shouldAddNewValues;
                }
                return false;
              },
              builder: (final context, final shouldAddNewValues) {
                return CheckboxListTile(
                  title: const Text('Should add new values'),
                  value: shouldAddNewValues,
                  onChanged: widgetState.onChangeShouldAddNewValues,
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
                return CheckboxListTile(
                  title: const Text('Should update values'),
                  onChanged: widgetState.onChangeShouldUpdateValues,
                  value: shouldUpdateValues,
                );
              },
            ),
            uiTheme.verticalBoxes.extraLarge,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
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
                          child: Text(
                            widgetState.isCreateSync ? 'Create' : 'Save',
                          ),
                          builder:
                              (final context, final isSaving, final child) {
                            if (isSaving) {
                              return const SizedBox.square(
                                dimension: 24,
                                child: CircularProgress(),
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
            ),
            uiTheme.verticalBoxes.extraLarge,
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
    final blocState = context.watch<TablesSyncBloc>().getLiveState();
    final allTables = blocState.getAllTables();

    return Row(
      children: [
        Expanded(
          child: BlocBuilder<TablesSyncBloc, TablesSyncState>(
            builder: (final context, final state) {
              return Autocomplete(
                optionsBuilder: (final textEditingValue) {
                  if (textEditingValue.text.isEmpty) return allTables;
                  return allTables.where(
                    (final e) => e.name.contains(textEditingValue.text),
                  );
                },
                onSelected: widgetState.onSelectSourceTable,
                displayStringForOption: (final option) => option.name,
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
              child: TextField(
                onEditingComplete: widgetState.onAddColumn,
                controller: controllers.newColumn,
                onSubmitted: widgetState.onAddColumn,
              ),
            ),
            uiTheme.horizontalBoxes.medium,
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: widgetState.onAddColumn,
            ),
          ],
        ),
        uiTheme.verticalBoxes.medium,
        BlocSelector<TablesSyncBloc, TablesSyncState, Set<String>>(
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
                    (final columnName) => InputChip(
                      key: ValueKey(columnName),
                      label: Text(columnName),
                      onDeleted: () => widgetState.onDeleteColumn(columnName),
                    ),
                  )
                  .toList(),
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
              child: Autocomplete(
                optionsBuilder: (final textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return blocState.unselectedDestinationTables;
                  }
                  return blocState.unselectedDestinationTables.where(
                    (final e) => e.name.contains(textEditingValue.text),
                  );
                },
                onSelected: widgetState.onAddDestinationTable,
                displayStringForOption: (final option) => option.name,
              ),
            ),
            uiTheme.horizontalBoxes.medium,
            const AddNewTableIconButton()
          ],
        ),
        uiTheme.verticalBoxes.medium,
        Wrap(
          spacing: 12,
          runSpacing: 6,
          children: blocState.selectedDestinationTables
              .map(
                (final table) => InputChip(
                  key: ValueKey(table),
                  label: Text(table.name),
                  onDeleted: () => widgetState.onDeleteDestinationTable(table),
                ),
              )
              .toList(),
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
      icon: const Icon(Icons.add),
      onPressed: state.onAddNewTable,
    );
  }
}
