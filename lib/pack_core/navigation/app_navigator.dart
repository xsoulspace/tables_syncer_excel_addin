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
  final home = const ValueKey('home');
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

  Page home() {
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
            routerController.toRoot();
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

  Page profile() {
    final firebaseIntializer = GlobalStateNotifiers.getFirebaseIntializer();
    return NavigatorPage(
      child: ProfileScreen(
        actions: [
          SignedOutAction((final context) {
            routerController.toSignIn();
          }),
        ],
        providers: firebaseIntializer.providers,
      ),
      key: keys.profile,
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
    final pages = <Page>[];
    if (pathTemplate == NavigationRoutes.signIn) {
      pages.add(pageBuilder.signIn());
    } else if (pathTemplate == NavigationRoutes.profile) {
      pages.add(pageBuilder.profile());
    } else if (pathTemplate.startsWith(NavigationRoutes.forgotPassword)) {
      pages.add(pageBuilder.forgotPassword());
    } else if (pathTemplate == NavigationRoutes.root) {
      pages.add(pageBuilder.home());
    }
    return pages;
  }
}
