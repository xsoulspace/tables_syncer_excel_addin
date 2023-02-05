import 'dart:math' as math;

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_app/screens/screens.dart';
import 'package:tables_syncer_excel_addin/pack_app/widgets/widgets.dart';
import 'package:tables_syncer_excel_addin/pack_core/app/info_screen.dart';
import 'package:tables_syncer_excel_addin/pack_core/global_states/global_states.dart';
import 'package:tables_syncer_excel_addin/pack_core/pack_core.dart';
import 'package:tables_syncer_excel_addin/pack_settings/pack_settings.dart';
import 'package:ts_design_core/ts_design_core.dart';

part 'navigation_screen_state.dart';

class NavigationScreen extends HookWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = useNavigationScreenState(read: context.read);
    final uiTheme = UiTheme.of(context);
    final themeData = FluentTheme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return AppStateLoader(
      initializer: AuthStateInitializer(),
      loader: const LoadingScreen(),
      child: ValueListenableBuilder<NavigationScreens>(
        valueListenable: state.currentScreen,
        builder: (final context, final currentScreen, final child) {
          final isHomeScreen = currentScreen == NavigationScreens.home;
          return Stack(
            children: [
              NavigationView(
                pane: AppNavigationPane(
                  state: state,
                  panePaddingRequired: !isHomeScreen,
                  themeData: themeData,
                  selected: currentScreen.index,
                ),
                appBar: isHomeScreen
                    ? const NavigationAppBar(
                        automaticallyImplyLeading: false,
                      )
                    : null,
              ),
              if (isHomeScreen)
                Positioned(
                  top: 10,
                  left: 0,
                  child: Row(
                    children: [
                      uiTheme.horizontalBoxes.small,
                      Builder(
                        builder: (final context) {
                          final screenWidth = screenSize.width;

                          final width = math.min(screenWidth - 58, 328 + 58.0);
                          return ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: width),
                            child: const AppTopBar(),
                          );
                        },
                      ),
                      const SizedBox(width: 58),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class AppNavigationPane extends NavigationPane {
  AppNavigationPane({
    required super.selected,
    required final NavigationScreenState state,
    required final bool panePaddingRequired,
    required final ThemeData themeData,
  }) : super(
          onChanged: (final index) => state.onNavigationChanged(
            NavigationScreens.values
                .firstWhere((final value) => value.index == index),
          ),
          menuButton: AnimatedSwitcher(
            duration: themeData.fastAnimationDuration,
            child: panePaddingRequired
                ? const SizedBox(height: 50)
                : const SizedBox(),
          ),
          displayMode: PaneDisplayMode.compact,
          items: [
            PaneItem(
              icon: const Icon(FluentIcons.home),
              title: const Text('Home'),
              body: const HomeScreen(),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.add),
              title: const Text('Create sync'),
              body: const TablesSyncScreen(),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.sync),
              title: const Text('Syncs'),
              body: const TablesSyncsListScreen(),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.table),
              title: const Text('Tables'),
              body: const TablesListScreen(),
            ),
          ],
          position: PanePosition.right,
          footerItems: [
            PaneItemSeparator(),
            PaneItem(
              icon: const Icon(FluentIcons.settings),
              title: const Text('Settings'),
              body: const SettingsScreen(),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.signin),
              title: const Text('Profile'),
              body: ProfileScreen(
                actions: [
                  SignedOutAction((final context) {
                    state.diDto.routerController.toSignIn();
                  }),
                ],
                providers:
                    GlobalStateNotifiers.getFirebaseIntializer().providers,
              ),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.info),
              title: const Text('Info'),
              body: const InfoScreen(),
            ),
          ],
        );
}
