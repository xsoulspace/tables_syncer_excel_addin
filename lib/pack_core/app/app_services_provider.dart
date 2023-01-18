import 'package:flutter/widgets.dart';
// ignore: implementation_imports
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_core/ads/ads.dart';
import 'package:tables_syncer_excel_addin/pack_core/global_states/global_states.dart';
import 'package:tables_syncer_excel_addin/pack_core/pack_core.dart';
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
        Provider<ServicesCollection>(
          create: (final context) => ServicesCollection.v1,
        ),
        Provider(create: (final context) => AdManager()),
        ChangeNotifierProvider(
          create: (final context) => AppSettingsNotifier.use(
            context.read,
          ),
        ),
      ],
      builder: (final context, final internalChild) => builder(context),
    );
  }
}
