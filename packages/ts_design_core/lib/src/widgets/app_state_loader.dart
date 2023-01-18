import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';

abstract class AppStateInitializer extends ContextfulLoadable {
  @override
  Future<void> onLoad(final BuildContext context) async {}

  Future<void> onPostBindingLoad(final BuildContext context) async {}
}

class AppStateLoader extends HookWidget {
  const AppStateLoader({
    required this.child,
    required this.initializer,
    required this.loader,
    final Key? key,
  }) : super(key: key);
  final Widget child;
  final AppStateInitializer initializer;
  final Widget loader;
  @override
  Widget build(final BuildContext context) {
    final theme = FluentTheme.of(context);
    final loaded = useIsBool();
    final loading = useIsBool();

    if (loaded.value & !loading.value) {
      return child;
    }

    return FutureBuilder<bool>(
      future: () async {
        if (loading.value) return false;
        loading.value = true;
        loaded.value = true;
        await initializer.onLoad(context);
        unawaited(
          // ignore: use_build_context_synchronously
          initializer.onPostBindingLoad(context).then((final _) {
            loading.value = false;
          }),
        );

        return true;
      }(),
      builder: (final context, final snapshot) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
            children: [
              child,
              if (loading.value)
                Positioned.fill(
                  child: ColoredBox(
                    color: theme.micaBackgroundColor.withOpacity(0.5),
                    child: loader,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
