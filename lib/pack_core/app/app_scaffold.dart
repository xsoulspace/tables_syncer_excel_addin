import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/firebase_options.dart';
import 'package:tables_syncer_excel_addin/pack_core/app/app_services_provider.dart';
import 'package:tables_syncer_excel_addin/pack_core/global_states/global_states.dart';
import 'package:tables_syncer_excel_addin/pack_core/pack_core.dart';
import 'package:ts_core/ts_core.dart';
import 'package:ts_design_core/ts_design_core.dart';

part 'app_scaffold_state.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({required this.servicesDiDto, final Key? key})
      : super(key: key);
  final AppServicesProviderDiDto servicesDiDto;
  @override
  Widget build(final BuildContext context) {
    return AppServicesProvider(
      diDto: servicesDiDto,
      builder: (final context) {
        return StateLoader(
          initializer: GlobalSettingsInitializer(),
          loader: const LoadingScreen(),
          child: RouterScaffold(
            builder: (final context, final parser) => AppScaffoldBuilder(
              routeParser: parser,
            ),
          ),
        );
      },
    );
  }
}

class RouterScaffold extends HookWidget {
  const RouterScaffold({
    required this.builder,
    final Key? key,
  }) : super(key: key);
  final Widget Function(BuildContext context, TemplateRouteParser parser)
      builder;
  @override
  Widget build(final BuildContext context) {
    final state = useAppScaffoldState();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RouteState>(
          create: (final context) => state.routeState,
        ),
        Provider<AppRouterController>(
          create: (final context) => AppRouterController.use(context.read),
        ),
      ],
      builder: (final context, final child) =>
          builder(context, state.routeParser),
    );
  }
}

class AppScaffoldBuilder extends HookWidget {
  const AppScaffoldBuilder({required this.routeParser, final Key? key})
      : super(key: key);
  final TemplateRouteParser routeParser;
  @override
  Widget build(final BuildContext context) {
    final state = useAppScaffoldBodyState(context.read);
    final settingsNotifier = context.watch<UserNotifier>();

    return AnimatedBuilder(
      animation: settingsNotifier,
      builder: (final context, final child) {
        return FluentApp.router(
          color: Colors.blue,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            FluentLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          routeInformationParser: routeParser,
          routerDelegate: state.routerDelegate,
          supportedLocales: Locales.values,
          localeListResolutionCallback:
              (final locales, final supportedLocales) {
            final defaultLocale = () {
              if (locales == null || locales.isEmpty) return null;
              for (final locale in locales) {
                if (S.delegate.isSupported(locale)) {
                  return locale;
                }
              }
            }();

            /// in case if we will needed preferrable system locale
            settingsNotifier.systemLocale = defaultLocale;

            /// if language is set by user, then use it
            if (settingsNotifier.locale != null) return settingsNotifier.locale;

            return defaultLocale;
          },
          locale: settingsNotifier.locale,
          theme: ThemeData.light().copyWith(
            visualDensity: VisualDensity.standard,
            focusTheme: FocusThemeData(
              glowFactor: is10footScreen() ? 2.0 : 0.0,
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            resources: const ResourceDictionary.dark(
              cardStrokeColorDefault: Color(0x15ffffff),
            ),
            visualDensity: VisualDensity.standard,
            focusTheme: FocusThemeData(
              glowFactor: is10footScreen() ? 2.0 : 0.0,
            ),
          ),
          themeMode: settingsNotifier.theme,
          builder: (final context, final child) {
            return UiTheme(
              scheme: UiThemeScheme.m3(context),
              child: AppStateLoader(
                initializer: GlobalStateInitializer(
                  firebaseOptions: DefaultFirebaseOptions.currentPlatform,
                ),
                loader: const LoadingScreen(),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: NavigationPaneTheme(
                    data: const NavigationPaneThemeData(),
                    child: child!,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
