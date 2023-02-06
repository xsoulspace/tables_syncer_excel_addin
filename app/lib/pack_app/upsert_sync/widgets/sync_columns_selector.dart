import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tables_syncer_excel_addin/pack_app/upsert_sync/bloc/tables_sync_bloc.dart';
import 'package:tables_syncer_excel_addin/pack_app/upsert_sync/upsert_sync.dart';
import 'package:ts_design_core/ts_design_core.dart';

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
