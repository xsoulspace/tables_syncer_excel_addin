import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_app/upsert_sync/bloc/tables_sync_bloc.dart';
import 'package:tables_syncer_excel_addin/pack_app/upsert_sync/widgets/widgets.dart';
import 'package:ts_core/ts_core.dart';
import 'package:ts_design_core/ts_design_core.dart';

export 'delete_sync.dart';
export 'delete_table.dart';
export 'upsert_table.dart';

part 'upsert_sync_state.dart';

Future<void> showUpsertTableSyncDialog(
  final BuildContext context, {
  final TablesSyncParamsModelId? syncId,
}) {
  return showDialog<TablesSyncParamsModelId>(
    context: context,
    builder: (final context) {
      return SimpleDialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 24,
        ),
        title: Text(
          syncId == null || syncId.isEmpty ? 'Create Sync' : 'Update Sync',
        ),
        children: [
          TablesSyncView(
            builder: (final context) {
              return const _TablesSyncBody(
                isCancelButtonEnabled: true,
              );
            },
            syncId: syncId,
            shouldPopAfterSubmit: true,
          ),
        ],
      );
    },
  );
}

class TablesSyncScreen extends StatelessWidget {
  const TablesSyncScreen({
    this.syncId,
    super.key,
  });
  final TablesSyncParamsModelId? syncId;
  @override
  Widget build(final BuildContext context) {
    return TablesSyncView(
      builder: (final context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Create Sync'),
          ),
          body: Container(
            constraints: BoxConstraints(
              maxWidth: WidthFormFactor.mobile.max * 0.8,
            ),
            child: const SingleChildScrollView(child: _TablesSyncBody()),
          ),
        );
      },
    );
  }
}

class TablesSyncView extends StatelessWidget {
  const TablesSyncView({
    required this.builder,
    this.shouldPopAfterSubmit = false,
    this.syncId,
    super.key,
  });
  final TablesSyncParamsModelId? syncId;
  final WidgetBuilder builder;
  final bool shouldPopAfterSubmit;
  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => TablesSyncBloc(
        diDto: TablesSyncBlocDiDto.use(context.read),
        shouldPopAfterSubmit: shouldPopAfterSubmit,
        onPopContext: () => Navigator.pop(context),
      ),
      child: Builder(
        builder: (final context) {
          return _TablesSyncWidgetStateProvider(
            syncId: syncId,
            builder: builder,
          );
        },
      ),
    );
  }
}

class _TablesSyncWidgetStateProvider extends HookWidget {
  const _TablesSyncWidgetStateProvider({
    required this.syncId,
    required this.builder,
  });
  final TablesSyncParamsModelId? syncId;
  final WidgetBuilder builder;

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
              return builder(context);
            }
            throw ArgumentError.value(state);
          },
        );
      },
    );
  }
}

class _TablesSyncBody extends StatelessWidget {
  const _TablesSyncBody({
    this.isCancelButtonEnabled = false,
  });
  final bool isCancelButtonEnabled;
  @override
  Widget build(final BuildContext context) {
    final uiTheme = UiTheme.of(context);
    final theme = Theme.of(context);
    final widgetState = context.read<TablesSyncWidgetState>();
    final controllers = context.read<TablesSyncBloc>().controllers;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: WidthFormFactor.mobile.max * 0.8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          BlocSelector<TablesSyncBloc, TablesSyncState, bool>(
            selector: (final state) {
              if (state is LiveTablesSyncParamsState) {
                return state.shouldClearValuesBeforeUpdate;
              }
              return false;
            },
            builder: (final context, final shouldUpdateValues) {
              return CheckboxListTile(
                title: const Text('Should clear values before update'),
                onChanged: widgetState.onChangeShouldClearValuesBeforeUpdate,
                value: shouldUpdateValues,
              );
            },
          ),
          uiTheme.verticalBoxes.extraLarge,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: isCancelButtonEnabled
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                if (isCancelButtonEnabled)
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
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
                        builder: (final context, final isSaving, final child) {
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
