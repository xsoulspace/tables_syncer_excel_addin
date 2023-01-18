import 'package:ts_core/ts_core.dart';

/// !If you want to add new route, please add the route to the [routes]
class NavigationRoutes {
  NavigationRoutes._();
  static const root = '/';
  static const settings = '/settings';
  static const routes = [root, settings];
}

class AppRouterController extends RouterController {
  AppRouterController.use(super.read) : super.use();

  void toRoot() => to(NavigationRoutes.root);
  void toSettings() => to(NavigationRoutes.settings);
}
