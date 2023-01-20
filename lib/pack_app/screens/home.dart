import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:office_addin_helper/office_addin_helper.dart';
import 'package:provider/provider.dart';
import 'package:tables_syncer_excel_addin/pack_app/screens/debug_pane.dart';
import 'package:tables_syncer_excel_addin/pack_app/widgets/widgets.dart';

class DiDto {
  DiDto.use(final Locator read) : excelApi = read();
  final ExcelApiI excelApi;
}

HomeState useState({
  required final Locator read,
}) =>
    use(
      LifeHook(
        debugLabel: 'State',
        state: HomeState(diDto: DiDto.use(read)),
      ),
    );

class HomeState extends LifeState {
  HomeState({
    required this.diDto,
  });

  final DiDto diDto;
  final worksheets = <SheetModel<dynamic>>[];
  Future<void> getWorksheets() async {
    final sheets = await diDto.excelApi.getSheets();
    worksheets.addAll(sheets);
    setState();
  }
}

class HomeScreen extends HookWidget {
  const HomeScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final scrollController = useScrollController();
    final state = useState(read: context.read);
    return ScaffoldPage(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DebugPane(),
          TextButton(
            onPressed: state.getWorksheets,
            child: const Text('Get Worksheets'),
          ),
          ...state.worksheets.map((final e) => Text(e.name)),
          const AdsBanner(),
        ],
      ),
    );
  }
}
