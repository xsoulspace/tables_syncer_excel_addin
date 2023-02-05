import 'package:ts_core/ts_core.dart';

/// !If you want to add new route, please add the route to the [routes]
class NavigationRoutes {
  NavigationRoutes._();
  static const loader = '/';
  static const signIn = '/auth/signIn';
  static const home = '/app';
  static const tablesSyncs = '/app/syncs';
  static const tables = '/app/tables';
  static const createSync = '/app/syncs/create';
  static const profile = '/app/profile';
  static const forgotPasswordWithEmail = '/auth/forgotPassword/:email';
  static const forgotPassword = '/auth/forgotPassword';
  static const routes = [
    loader,
    signIn,
    tablesSyncs,
    tables,
    createSync,
    forgotPasswordWithEmail,
    forgotPassword,
    home,
    profile,
  ];
}

class AppRouterController extends RouterController {
  AppRouterController.use(super.read) : super.use();
  AppRouterController.local(super.routeState) : super.local();

  void toLoader() => to(NavigationRoutes.loader);
  void toHome() => to(NavigationRoutes.home);
  void toTablesSyncs() => to(NavigationRoutes.tablesSyncs);
  void toSignIn() => to(NavigationRoutes.signIn);
  void toForgotPassword(final String? email) =>
      email != null && email.isNotEmpty
          ? to('${NavigationRoutes.forgotPassword}/$email')
          : to(NavigationRoutes.forgotPassword);
  void toProfile() => to(NavigationRoutes.profile);
  void toTables() => to(NavigationRoutes.tables);
  void toCreateSync() => to(NavigationRoutes.createSync);
}
