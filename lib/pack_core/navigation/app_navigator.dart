import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_core/navigation/app_router.dart';
import 'package:tables_syncer_excel_addin/pack_settings/pack_settings.dart';
import 'package:ts_core/ts_core.dart';
import 'package:ts_design_core/ts_design_core.dart';

class AppNavigator extends HookWidget {
  const AppNavigator({
    required this.navigatorKey,
    final Key? key,
  }) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(final BuildContext context) {
    context.watch<RouteState>();

    final keys = useState(AppPageBuilderKeys());
    final pageBuilder =
        AppPageBuilder.use(keys: keys.value, read: context.read);
    final layoutBuilder = AppLayoutBuilder(pageBuilder: pageBuilder);

    return Navigator(
      key: navigatorKey,
      onPopPage: const RouterPopper().onPopPage,
      pages: layoutBuilder.buildPages(),
    );
  }
}

class AppPageBuilderKeys {
  final pause = const ValueKey('mainMenu');
  final game = const ValueKey('game');
  final highscore = const ValueKey('highscore');
  final settings = const ValueKey('settings');
  final levelOptions = const ValueKey('levelOptions');
}

class AppPageBuilder extends RouterPageBuilder<AppRouterController> {
  AppPageBuilder.use({
    required this.keys,
    required super.read,
  }) : super.use();

  static final emptyPage = NavigatorPage(
    child: const EmptyScreen(),
    key: const ValueKey('empty-screen'),
  );

  final AppPageBuilderKeys keys;

  Page settings() {
    return NavigatorPage(
      child: const SettingsScreen(),
      key: keys.settings,
    );
  }
}

class AppLayoutBuilder
    extends RouterLayoutBuilder<AppRouterController, AppPageBuilder> {
  AppLayoutBuilder({required super.pageBuilder});
  @override
  List<Page> buildPages() {
    final pages = <Page>[];

    /// should be at the end of the layout layers
    if (pathTemplate == NavigationRoutes.root) {
      pages.add(pageBuilder.settings());
    }
    return pages;
  }
}
