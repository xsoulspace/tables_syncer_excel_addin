import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tables_syncer_excel_addin/pack_app/upsert_sync/bloc/tables_sync_bloc.dart';
import 'package:tables_syncer_excel_addin/pack_app/upsert_sync/upsert_sync.dart';
import 'package:ts_design_core/ts_design_core.dart';

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
                initialValue: TextEditingValue(
                  text: blocState.selectedSourceTable?.name ?? '',
                ),
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
