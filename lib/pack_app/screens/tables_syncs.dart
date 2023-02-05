import 'package:animate_do/animate_do.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
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
    return const Scaffold(
      body: TablesSyncsListView(),
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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Provider(
      create: (final context) => state,
      builder: (final context, final child) {
        return FirestoreListView(
          query: apiServices.tablesSync.tableSyncQuery,
          itemBuilder: (final context, final doc) {
            final tablesSync = doc.data();
            return TablesSyncListTile(
              key: ValueKey(tablesSync),
              tablesSync: tablesSync,
            );
          },
        );
      },
    );
  }
}

class TablesSyncListTile extends HookWidget {
  const TablesSyncListTile({
    required this.tablesSync,
    super.key,
  });
  final TablesSyncParamsModel tablesSync;
  @override
  Widget build(final BuildContext context) {
    final isHovering = useIsBool();
    final uiTheme = UiTheme.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final state = context.read<TablesSyncsListState>();
    final syncParamsNotifier = context.read<SyncParamsNotifier>();
    final runtimeSync = SyncParamsNormalizer.normalize(
      syncParams: tablesSync,
      tablesMap: syncParamsNotifier.tablesParamsMap,
    );
    return FocusableActionDetector(
      onShowHoverHighlight: (final value) {
        isHovering.value = value;
      },
      child: Card(
        margin: const EdgeInsets.only(top: 12, left: 4, right: 4),
        child: ListTile(
          key: ValueKey(tablesSync.id),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '${runtimeSync.sourceTable.name}'
              ' -> ${runtimeSync.destinationTables.map((final e) => e.name).join(',')}',
              style: textTheme.bodyMedium,
            ),
          ),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(tablesSync.workbookName),
                  Text(runtimeSync.columnNames.join(',')),
                ],
              ),
              uiTheme.horizontalBoxes.medium,
              Text(
                'Last Synced: '
                '${tablesSync.lastSyncAt?.toLocal().toIso8601String()}',
              ),
            ],
          ),
          trailing: Visibility(
            visible: isHovering.value,
            child: FadeIn(
              child: Card(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.sync),
                      onPressed: () => state.onSync(tablesSync),
                    ),
                    uiTheme.horizontalBoxes.small,
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => state.onEditSync(tablesSync),
                    ),
                    uiTheme.horizontalBoxes.small,
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => state.onDeleteSync(tablesSync),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
