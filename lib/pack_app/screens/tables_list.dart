import 'package:animate_do/animate_do.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
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
    final theme = FluentTheme.of(context);
    final textTheme = theme.typography;

    return FirestoreListView(
      query: apiServices.tables.tableQuery,
      itemBuilder: (final context, final doc) {
        final table = doc.data();
        return HoverButton(
          forceEnabled: true,
          builder: (final context, final states) {
            return Card(
              margin: const EdgeInsets.only(top: 12, left: 4, right: 4),
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              child: ListTile(
                key: ValueKey(table.id),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    table.id,
                    style: textTheme.bodyStrong,
                  ),
                ),
                subtitle: Text(table.workbookOriginName),
                trailing: Visibility(
                  visible: states.isHovering,
                  child: FadeIn(
                    child: Card(
                      padding: EdgeInsets.zero,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(FluentIcons.edit),
                            onPressed: () => state.onEditTable(table),
                          ),
                          uiTheme.horizontalBoxes.small,
                          IconButton(
                            icon: const Icon(FluentIcons.delete),
                            onPressed: () => state.onDeleteTable(table),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
