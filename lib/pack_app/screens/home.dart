import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tables_syncer_excel_addin/pack_app/screens/debug_pane.dart';
import 'package:tables_syncer_excel_addin/pack_app/screens/tables_syncs.dart';
import 'package:tables_syncer_excel_addin/pack_app/widgets/widgets.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          DebugPane(),
          Expanded(child: TablesSyncsListView()),
          AdsBanner(),
        ],
      ),
    );
  }
}
