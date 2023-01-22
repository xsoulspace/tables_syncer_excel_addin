part of 'navigation_screen.dart';

enum NavigationScreens {
  home,
  createSync,
  settings,
  profile,
  info,
}

class NavigationScreenDiDto {
  NavigationScreenDiDto.use(final Locator read) : routerController = read();
  final AppRouterController routerController;
}

NavigationScreenState useNavigationScreenState({
  required final Locator read,
}) =>
    use(
      LifeHook(
        debugLabel: 'NavigationScreenState',
        state: NavigationScreenState(
          diDto: NavigationScreenDiDto.use(read),
        ),
      ),
    );

class NavigationScreenState extends LifeState {
  NavigationScreenState({
    required this.diDto,
  });
  final currentScreen =
      ValueNotifier<NavigationScreens>(NavigationScreens.home);
  final NavigationScreenDiDto diDto;
  // ignore: use_setters_to_change_properties
  void onNavigationChanged(final NavigationScreens screen) {
    currentScreen.value = screen;
  }
}
