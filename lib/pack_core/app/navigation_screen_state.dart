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

  @override
  void initState() {
    super.initState();
    diDto.routerController.routeState.addListener(onRouteChanged);
  }

  @override
  void dispose() {
    diDto.routerController.routeState.removeListener(onRouteChanged);
    super.dispose();
  }

  void onRouteChanged() {
    final pathTemplate = diDto.routerController.routeState.route.pathTemplate;
    if (pathTemplate.startsWith(NavigationRoutes.home)) {
      if (pathTemplate == NavigationRoutes.home) {
        currentScreen.value = NavigationScreens.home;
      } else if (pathTemplate == NavigationRoutes.createSync) {
        currentScreen.value = NavigationScreens.createSync;
      } else if (pathTemplate == NavigationRoutes.tablesSyncs) {
        // TODO(arenukvern): change to syncs screen
        currentScreen.value = NavigationScreens.home;
      }
    }
  }

  // ignore: use_setters_to_change_properties
  void onNavigationChanged(final NavigationScreens screen) {
    currentScreen.value = screen;
  }
}
