import 'package:animate_do/animate_do.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_app/pack_app.dart';
import 'package:ts_core/ts_core.dart';
import 'package:ts_design_core/ts_design_core.dart';

part 'tables_list_state.dart';

class TablesListScreen extends HookWidget {
  const TablesListScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final apiServices = context.watch<ApiServices>();
    final state = useTablesListState(read: context.read);
    final uiTheme = UiTheme.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Tables'),
      ),
      body: Provider(
        create: (final context) => state,
        builder: (final context, final child) {
          return FirestoreListView(
            query: apiServices.tables.tableQuery,
            itemBuilder: (final context, final doc) {
              final table = doc.data();
              return TableListTile(
                key: ValueKey(table.id),
                table: table,
              );
            },
          );
        },
      ),
    );
  }
}

class TableListTile extends HookWidget {
  const TableListTile({
    required this.table,
    super.key,
  });
  final TableParamsModel table;

  @override
  Widget build(final BuildContext context) {
    final uiTheme = UiTheme.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final state = context.read<TablesListState>();
    final isHovering = useIsBool();

    return FocusableActionDetector(
      onShowHoverHighlight: (final value) {
        isHovering.value = value;
      },
      child: Card(
        margin: const EdgeInsets.only(top: 12, left: 4, right: 4),
        child: ListTile(
          onTap: () => state.onEditTable(table),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              '${table.name} | Worksheet: ${table.worksheetName} '
              '\n| Key Column: ${table.keyColumnName} '
              '\n| Header: Row ${table.headerTopLeftCell.relativeRowIndex} & '
              'Column ${table.headerTopLeftCell.relativeColumnIndex}'
              '\n| Data: Row ${table.dataTopLeftCell.relativeRowIndex} & '
              'Column ${table.dataTopLeftCell.relativeColumnIndex}',
              style: textTheme.bodyMedium,
            ),
          ),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(table.workbookOriginName),
              if (isHovering.value)
                FadeIn(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => state.onEditTable(table),
                      ),
                      uiTheme.horizontalBoxes.small,
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => state.onDeleteTable(table),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}