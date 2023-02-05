import 'dart:math' as math;

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_app/pack_app.dart';
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
    final themeData = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return AppStateLoader(
      initializer: AuthStateInitializer(),
      loader: const LoadingScreen(),
      child: ValueListenableBuilder<NavigationScreens>(
        valueListenable: state.currentScreen,
        builder: (final context, final currentScreen, final child) {
          final isHomeScreen = currentScreen == NavigationScreens.home;
          return Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ValueListenableBuilder(
                            valueListenable: state.currentScreen,
                            builder: (
                              final context,
                              final currentScreen,
                              final child,
                            ) {
                              return LazyIndexedStack(
                                index: currentScreen.index,
                                children: NavigationScreens.values.map(
                                  (final screen) {
                                    switch (screen) {
                                      case NavigationScreens.home:
                                        return const HomeScreen();
                                      case NavigationScreens.createSync:
                                        return const TablesSyncScreen();
                                      case NavigationScreens.info:
                                        return const InfoScreen();
                                      case NavigationScreens.profile:
                                        return ProfileScreen(
                                          actions: [
                                            SignedOutAction((final context) {
                                              state.diDto.routerController
                                                  .toSignIn();
                                            }),
                                          ],
                                          providers: GlobalStateNotifiers
                                                  .getFirebaseIntializer()
                                              .providers,
                                        );
                                      case NavigationScreens.settings:
                                        return const SettingsScreen();
                                      case NavigationScreens.syncs:
                                        return const TablesSyncsListScreen();
                                      case NavigationScreens.tables:
                                        return const TablesListScreen();
                                    }
                                  },
                                ).toList(),
                              );
                            },
                          ),
                        ),
                        Provider(
                          create: (final context) => state,
                          builder: (final context, final child) {
                            return AppNavigationRail(
                              panePaddingRequired: !isHomeScreen,
                            );
                          },
                        ),
                      ],
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

                                final width =
                                    math.min(screenWidth - 58, 328 + 58.0);
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
                ),
              ),
              if (kDebugMode) const DebugPane(),
              // const AdsBanner(),
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
          destinations: NavigationScreens.values.map((final screen) {
            switch (screen) {
              case NavigationScreens.home:
                return const NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                );
              case NavigationScreens.createSync:
                return const NavigationRailDestination(
                  icon: Icon(Icons.add),
                  label: Text('Create sync'),
                );
              case NavigationScreens.info:
                return const NavigationRailDestination(
                  icon: Icon(Icons.info),
                  label: Text('Info'),
                );
              case NavigationScreens.profile:
                return const NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text('Profile'),
                );
              case NavigationScreens.settings:
                return const NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text('Settings'),
                );
              case NavigationScreens.syncs:
                return const NavigationRailDestination(
                  icon: Icon(Icons.sync),
                  label: Text('Syncs'),
                );
              case NavigationScreens.tables:
                return const NavigationRailDestination(
                  icon: Icon(Icons.table_view_rounded),
                  label: Text('Tables'),
                );
            }
          }).toList(),
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

/// A lazy-loading [IndexedStack] that loads [children] accordingly.
class LazyIndexedStack extends StatefulWidget {
  const LazyIndexedStack({
    super.key,
    this.alignment = AlignmentDirectional.topStart,
    this.textDirection,
    this.sizing = StackFit.loose,
    this.index = 0,
    this.children = const [],
  });

  final AlignmentGeometry alignment;
  final TextDirection? textDirection;
  final StackFit sizing;
  final int index;
  final List<Widget> children;

  @override
  LazyIndexedStackState createState() => LazyIndexedStackState();
}

class LazyIndexedStackState extends State<LazyIndexedStack> {
  late List<bool> _activated = _initializeActivatedList();

  List<bool> _initializeActivatedList() => List<bool>.generate(
        widget.children.length,
        (final i) => i == widget.index,
      );

  @override
  void didUpdateWidget(covariant final LazyIndexedStack oldWidget) {
    if (oldWidget.children.length != widget.children.length) {
      _activated = _initializeActivatedList();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(final BuildContext context) {
    // Mark current index as active
    _activated[widget.index] = true;
    final children = List.generate(_activated.length, (final i) {
      return _activated[i] ? widget.children[i] : const SizedBox.shrink();
    });
    return IndexedStack(
      alignment: widget.alignment,
      sizing: widget.sizing,
      textDirection: widget.textDirection,
      index: widget.index,
      children: children,
    );
  }
}
