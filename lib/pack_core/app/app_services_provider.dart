import 'package:flutter/widgets.dart';
import 'package:office_addin_helper/office_addin_helper.dart';
// ignore: implementation_imports
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_core/ads/ads.dart';
import 'package:tables_syncer_excel_addin/pack_core/global_states/global_states.dart';
import 'package:ts_core/ts_core.dart';

class AppServicesProviderDiDto {
  AppServicesProviderDiDto({
    required this.analyticsNotifier,
    required this.userNotifier,
  });
  final AnalyticsNotifier analyticsNotifier;
  final UserNotifier userNotifier;
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
    return ValueListenableBuilder<bool>(
      valueListenable: diDto.userNotifier.useMockData,
      builder: (final context, final useMockData, final child) {
        return MultiProvider(
          providers: [
            if (useMockData)
              Provider<ExcelApiI>(
                key: const ValueKey('ExcelApiMock'),
                create: (final context) => ExcelApiMockImpl(),
              )
            else
              Provider<ExcelApiI>(
                key: const ValueKey('ExcelApi'),
                create: (final context) => ExcelApiImpl(),
              ),
            ChangeNotifierProvider(
              create: (final context) => diDto.analyticsNotifier,
            ),
            ChangeNotifierProvider<ApiServiceInitializer>(
              create: (final context) => ApiServiceInitializer(baseUrl: ''),
            ),
            Provider<ApiServices>(
              create: ApiServices.create,
            ),
            Provider(create: (final context) => AdManager()),
            ChangeNotifierProvider(
              create: (final context) => GlobalStateNotifiers.getUser(),
            ),
          ],
          builder: (final context, final child) => builder(context),
        );
      },
    );
  }
}
