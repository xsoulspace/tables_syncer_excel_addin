import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_core/app/navigation_screen.dart';
import 'package:tables_syncer_excel_addin/pack_core/global_states/global_states.dart';
import 'package:tables_syncer_excel_addin/pack_core/navigation/app_router.dart';
import 'package:ts_core/ts_core.dart';
import 'package:ts_design_core/ts_design_core.dart';

class AppNavigator extends HookWidget {
  const AppNavigator({
    required this.navigatorKey,
    super.key,
  });
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(final BuildContext context) {
    context.watch<RouteState>();

    final keys = useState(AppPageBuilderKeys());
    final routerController = AppRouterController.use(context.read);
    final popper = useState(
      AppRouterPopper(
        routerController: routerController,
        keys: keys.value,
      ),
    );
    final pageBuilder =
        AppPageBuilder.use(keys: keys.value, read: context.read);
    final layoutBuilder = AppLayoutBuilder(pageBuilder: pageBuilder);
    return Navigator(
      key: navigatorKey,
      onPopPage: popper.value.onPopPage,
      pages: layoutBuilder.buildPages(),
    );
  }
}

class AppRouterPopper extends RouterPopper {
  const AppRouterPopper({
    required this.routerController,
    required this.keys,
  });
  final AppRouterController routerController;
  final AppPageBuilderKeys keys;
  @override
  bool onPopPage(final Route route, final dynamic result) {
    final settings = route.settings;
    if (settings is NavigatorPage) {
      final key = settings.key;
      if (key == keys.forgotPassword) {
        routerController.toSignIn();
        return false;
      }
    }

    return super.onPopPage(route, result);
  }
}

class AppPageBuilderKeys {
  final home = const ValueKey('home');
  final loading = const ValueKey('loading');
  final signIn = const ValueKey('signIn');
  final profile = const ValueKey('profile');
  final forgotPassword = const ValueKey('forgotPassword');
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

  Page loader() {
    return NavigatorPage(
      child: const LoadingScreen(),
      key: keys.loading,
    );
  }

  Page appNavigator() {
    return NavigatorPage(
      child: const NavigationScreen(),
      key: keys.home,
    );
  }

  Page signIn() {
    final firebaseIntializer = GlobalStateNotifiers.getFirebaseIntializer();
    return NavigatorPage(
      child: SignInScreen(
        actions: [
          AuthStateChangeAction<SignedIn>((final context, final _) {
            routerController.toHome();
          }),
          ForgotPasswordAction((final context, final email) {
            routerController.toForgotPassword(email);
          }),
        ],
        providers: firebaseIntializer.providers,
      ),
      key: keys.signIn,
    );
  }

  Page forgotPassword() {
    return NavigatorPage(
      child: const ForgotPasswordScreen(),
      key: keys.forgotPassword,
    );
  }
}

class AppLayoutBuilder
    extends RouterLayoutBuilder<AppRouterController, AppPageBuilder> {
  AppLayoutBuilder({required super.pageBuilder});
  @override
  List<Page> buildPages() {
    final pages = <Page>[
      pageBuilder.loader(),
    ];
    if (pathTemplate == NavigationRoutes.signIn) {
      pages.add(pageBuilder.signIn());
    } else if (pathTemplate.startsWith(NavigationRoutes.forgotPassword)) {
      pages.add(pageBuilder.forgotPassword());
    } else if (pathTemplate.startsWith('/app')) {
      pages.add(pageBuilder.appNavigator());
    }
    return pages;
  }
}
