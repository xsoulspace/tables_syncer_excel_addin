import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tables_syncer_excel_addin/pack_app/screens/debug_pane.dart';
import 'package:tables_syncer_excel_addin/pack_app/screens/tables_syncs.dart';
import 'package:tables_syncer_excel_addin/pack_app/widgets/widgets.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return ScaffoldPage(
      content: Column(
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
