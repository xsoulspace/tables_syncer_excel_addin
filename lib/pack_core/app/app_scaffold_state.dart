part of 'app_scaffold.dart';

AppScaffoldState useAppScaffoldState() => use(
      ContextfulLifeHook(
        debugLabel: 'AppScaffoldState',
        state: AppScaffoldState(),
      ),
    );

class AppScaffoldState extends ContextfulLifeState {
  AppScaffoldState();
  late final RouteState routeState;
  late final TemplateRouteParser routeParser;
  @override
  void initState() {
    routeParser = TemplateRouteParser(
      allowedPaths: NavigationRoutes.routes,
      guards: guards,
    );
    routeState = RouteState(routeParser);
    super.initState();
  }

  List<RouteGuard<ParsedRoute>> get guards => [AuthRouteGuard()];
}

class AuthRouteGuard implements RouteGuard<ParsedRoute> {
  AuthRouteGuard();

  @override
  Future<ParsedRoute> redirect(final ParsedRoute from) async {
    final pathTemplate = from.pathTemplate;
    if (FirebaseAuth.instance.currentUser == null) {
      if (pathTemplate.startsWith('/auth')) {
        return from;
      } else {
        return ParsedRoute.fromPathTemplate(NavigationRoutes.signIn);
      }
    } else {
      if (pathTemplate == NavigationRoutes.loader) {
        return ParsedRoute.fromPathTemplate(NavigationRoutes.home);
      }
      return from;
    }
  }
}

AppScaffoldBodyState useAppScaffoldBodyState(final Locator read) => use(
      ContextfulLifeHook(
        debugLabel: 'AppScaffoldBodyState',
        state: AppScaffoldBodyState(
          routeState: read<RouteState>(),
        ),
      ),
    );

class AppScaffoldBodyState extends ContextfulLifeState {
  AppScaffoldBodyState({
    required this.routeState,
  });
  final RouteState routeState;
  late final SimpleRouterDelegate routerDelegate;
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    routerDelegate = SimpleRouterDelegate(
      routeState: routeState,
      builder: (final context) => AppNavigator(
        navigatorKey: navigatorKey,
      ),
      navigatorKey: navigatorKey,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    routerDelegate.dispose();
  }
}
