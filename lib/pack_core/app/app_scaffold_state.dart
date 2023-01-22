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
  late final AppRouterController routerController;

  @override
  void initState() {
    routeParser = TemplateRouteParser(
      allowedPaths: NavigationRoutes.routes,
      guards: [],
    );
    routeState = RouteState(routeParser);
    routerController = AppRouterController.local(routeState);
    guard.onLoad();
    routeParser.guards?.add(guard);
    super.initState();
  }

  late final guard = AuthRouteGuard(routerController: routerController);
  @override
  void dispose() {
    guard.dispose();
    super.dispose();
  }
}

class AuthRouteGuard implements RouteGuard<ParsedRoute>, Disposable {
  AuthRouteGuard({
    required this.routerController,
  });
  StreamSubscription<User?>? _authSubscription;
  final AppRouterController routerController;
  void onLoad() {
    _authSubscription =
        FirebaseAuth.instance.authStateChanges().listen(_onAuthChange);
  }

  void _onAuthChange(final User? user) {
    if (user != null) {
      if (routerController.routeState.route.pathTemplate.startsWith('/auth')) {
        routerController.toHome();
      }
    }
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
  }

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
