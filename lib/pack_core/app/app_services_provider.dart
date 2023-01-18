import 'package:flutter/widgets.dart';
// ignore: implementation_imports
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_core/ads/ads.dart';
import 'package:ts_core/ts_core.dart';

class AppServicesProviderDiDto {
  AppServicesProviderDiDto({
    required this.analyticsNotifier,
  });
  final AnalyticsNotifier analyticsNotifier;
}

class AppServicesProvider extends StatelessWidget {
  const AppServicesProvider({
    required this.diDto,
    required this.builder,
    final Key? key,
  }) : super(key: key);
  final WidgetBuilder builder;
  final AppServicesProviderDiDto diDto;
  @override
  Widget build(final BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (final context) => diDto.analyticsNotifier,
        ),
        Provider<ApiServiceInitializer>(
          create: (final context) => ApiServiceInitializer(baseUrl: ''),
        ),
        Provider<ApiServices>(
          create: ApiServices.create,
        ),
        Provider(create: (final context) => AdManager()),
        ChangeNotifierProvider(
          create: (final context) => UserNotifier.use(
            context.read,
          ),
        ),
      ],
      builder: (final context, final internalChild) => builder(context),
    );
  }
}
