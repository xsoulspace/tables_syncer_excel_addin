import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_app/tables_syncs/widgets/widgets.dart';
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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Syncs'),
      ),
      body: Provider(
        create: (final context) => state,
        builder: (final context, final child) {
          return FirestoreListView(
            query: apiServices.tablesSync.tableSyncQuery,
            itemBuilder: (final context, final doc) {
              final tablesSync = doc.data();
              return TablesSyncListTile(
                key: ValueKey(tablesSync.id),
                tablesSync: tablesSync,
              );
            },
          );
        },
      ),
    );
  }
}
