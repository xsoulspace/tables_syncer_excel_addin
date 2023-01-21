import 'package:ts_core/ts_core.dart';

/// !If you want to add new route, please add the route to the [routes]
class NavigationRoutes {
  NavigationRoutes._();
  static const root = '/';
  static const signIn = '/auth/signIn';
  static const profile = '/profile';
  static const forgotPasswordWithEmail = '/auth/forgotPassword/:email';
  static const forgotPassword = '/auth/forgotPassword';
  static const routes = [
    root,
    signIn,
    profile,
    forgotPasswordWithEmail,
    forgotPassword
  ];
}

class AppRouterController extends RouterController {
  AppRouterController.use(super.read) : super.use();

  void toRoot() => to(NavigationRoutes.root);
  void toSignIn() => to(NavigationRoutes.signIn);
  void toForgotPassword(final String? email) => email != null
      ? to('${NavigationRoutes.forgotPassword}/$email')
      : to(NavigationRoutes.forgotPassword);
  void toProfile() => to(NavigationRoutes.profile);
}
