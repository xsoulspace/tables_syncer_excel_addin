import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_app/widgets/widgets.dart';
import 'package:tables_syncer_excel_addin/pack_core/global_states/global_states.dart';
import 'package:tables_syncer_excel_addin/pack_core/pack_core.dart';
import 'package:ts_design_core/ts_design_core.dart';

part 'navigation_screen_state.dart';

class NavigationScreen extends HookWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = useNavigationScreenState(read: context.read);
    final uiTheme = UiTheme.of(context);
    final themeData = Theme.of(context);
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
                pane: Provider(
                  create: (final context) => state,
                  builder: (final context, final child) {
                    return AppNavigationRail(
                      panePaddingRequired: !isHomeScreen,
                    );
                  },
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

class AppNavigationRail extends StatelessWidget {
  const AppNavigationRail({
    required this.panePaddingRequired,
    super.key,
  });
  final bool panePaddingRequired;

  @override
  Widget build(final BuildContext context) {
    final NavigationScreenState state = context.read();
    return ValueListenableBuilder(
      valueListenable: state.currentScreen,
      builder: (final context, final currentScreen, final child) {
        return NavigationRail(
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('Home'),
              // body: HomeScreen(),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.add),
              label: Text('Create sync'),
              // body: TablesSyncScreen(),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.sync),
              label: Text('Syncs'),
              // body: TablesSyncsListScreen(),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.table_view_rounded),
              label: Text('Tables'),
              // body: TablesListScreen(),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              // body: SettingsScreen(),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings),
              label: Text('Profile'),
              // body: ProfileScreen(
              //   actions: [
              //     SignedOutAction((final context) {
              //       state.diDto.routerController.toSignIn();
              //     }),
              //   ],
              //   providers:
              //       GlobalStateNotifiers.getFirebaseIntializer().providers,
              // ),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.info),
              label: Text('Info'),
              // body: InfoScreen(),
            ),
          ],
          onDestinationSelected: (final index) => state.onNavigationChanged(
            NavigationScreens.values
                .firstWhere((final value) => value.index == index),
          ),
          selectedIndex: currentScreen.index,
        );
      },
    );
  }
}
