import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_app/upsert_sync/upsert_sync.dart';
import 'package:ts_core/ts_core.dart';
import 'package:ts_design_core/ts_design_core.dart';

part 'sync_list_tile_state.dart';

class TablesSyncListTile extends HookWidget {
  const TablesSyncListTile({
    required this.tablesSync,
    super.key,
  });
  final TablesSyncParamsModel tablesSync;
  @override
  Widget build(final BuildContext context) {
    final uiTheme = UiTheme.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final state =
        useTableSyncListTileState(read: context.read, tablesSync: tablesSync);
    final runtimeSync = SyncParamsNormalizer.normalize(
      syncParams: tablesSync,
      tablesMap: state.diDto.syncParamsNotifier.tablesParamsMap,
    );
    if (runtimeSync == null) return const SizedBox();
    return FocusableActionDetector(
      onShowHoverHighlight: (final value) {
        state.isHovering = value;
      },
      child: Card(
        margin: const EdgeInsets.only(top: 12, left: 4),
        child: ListTile(
          onTap: () => state.onEditSync(tablesSync),
          contentPadding: const EdgeInsets.only(
            right: 8,
          ),
          horizontalTitleGap: 2,
          leading: IconButton(
            padding: EdgeInsets.zero,
            icon: () {
              if (state.syncing) return const CircularProgress();
              return const Icon(Icons.sync);
            }(),
            color: () {
              if (state.isSyncingFailed) return colorScheme.error;
              if (state.isSyncingCompleted) return colorScheme.secondary;
              return null;
            }(),
            onPressed: state.syncing ? null : () => state.onSync(tablesSync),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '${runtimeSync.name} | ${runtimeSync.sourceTable.name}'
              ' -> ${runtimeSync.destinationTables.map((final e) => e.name).join(' & ')}',
              style: textTheme.bodyMedium,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(tablesSync.workbookName),
              Text('Columns: ${runtimeSync.columnNames.join(',')}'),
              uiTheme.horizontalBoxes.medium,
              Text(
                'Last Synced: '
                '${tablesSync.lastSyncAt?.toLocal().toIso8601String()}',
              ),
              if (state.isHovering)
                FadeIn(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                )
            ],
          ),
        ),
      ),
    );
  }
}
