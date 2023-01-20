part of 'navigation_screen.dart';

enum NavigationScreens {
  home,
  createSync,
  settings,
  info,
}

NavigationScreenState useNavigationScreenState() => use(
      LifeHook(
        debugLabel: 'NavigationScreenState',
        state: NavigationScreenState(),
      ),
    );

class NavigationScreenState extends LifeState {
  NavigationScreenState();
  final currentScreen =
      ValueNotifier<NavigationScreens>(NavigationScreens.home);

  // ignore: use_setters_to_change_properties
  void onNavigationChanged(final NavigationScreens screen) {
    currentScreen.value = screen;
  }
}
