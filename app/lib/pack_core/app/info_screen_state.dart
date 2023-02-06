part of 'info_screen.dart';

InfoScreenState useInfoScreenState() => use(
      LifeHook(
        debugLabel: 'InfoScreenState',
        state: InfoScreenState(),
      ),
    );

class InfoScreenState extends LifeState {
  InfoScreenState();
}
