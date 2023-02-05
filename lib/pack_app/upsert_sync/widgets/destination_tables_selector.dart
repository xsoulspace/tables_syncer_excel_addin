import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tables_syncer_excel_addin/pack_app/upsert_sync/bloc/tables_sync_bloc.dart';
import 'package:tables_syncer_excel_addin/pack_app/upsert_sync/upsert_sync.dart';
import 'package:ts_design_core/ts_design_core.dart';

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
