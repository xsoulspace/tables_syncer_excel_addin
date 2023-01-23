import 'package:animate_do/animate_do.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ts_core/ts_core.dart';
import 'package:ts_design_core/ts_design_core.dart';

part 'tables_syncs_state.dart';

class TablesSyncsListScreen extends StatelessWidget {
  const TablesSyncsListScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return const ScaffoldPage(
      content: TablesSyncsListView(),
    );
  }
}

class TablesSyncsListView extends HookWidget {
  const TablesSyncsListView({super.key});

  @override
  Widget build(final BuildContext context) {
    final apiServices = context.watch<ApiServices>();
    final state = useTablesSyncsListState(read: context.read);
    final uiTheme = UiTheme.of(context);
    final theme = FluentTheme.of(context);
    final textTheme = theme.typography;

    return FirestoreListView(
      query: apiServices.tablesSync.tableSyncQuery,
      itemBuilder: (final context, final doc) {
        final tablesSync = doc.data();
        return HoverButton(
          forceEnabled: true,
          builder: (final context, final states) {
            return Card(
              margin: const EdgeInsets.only(top: 12, left: 4, right: 4),
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              child: ListTile(
                key: ValueKey(tablesSync.id),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    tablesSync.id,
                    style: textTheme.bodyStrong,
                  ),
                ),
                subtitle: Row(
                  children: [
                    Text(tablesSync.workbookName),
                    uiTheme.horizontalBoxes.medium,
                    Text(
                      'Last Synced: '
                      '${tablesSync.lastSyncAt?.toLocal().toIso8601String()}',
                    ),
                  ],
                ),
                trailing: Visibility(
                  visible: states.isHovering,
                  child: FadeIn(
                    child: Card(
                      padding: EdgeInsets.zero,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(FluentIcons.sync),
                            onPressed: () => state.onEditSync(tablesSync),
                          ),
                          uiTheme.horizontalBoxes.small,
                          IconButton(
                            icon: const Icon(FluentIcons.edit),
                            onPressed: () => state.onEditSync(tablesSync),
                          ),
                          uiTheme.horizontalBoxes.small,
                          IconButton(
                            icon: const Icon(FluentIcons.delete),
                            onPressed: () => state.onEditSync(tablesSync),
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
