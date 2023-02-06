class Envs {
  Envs._();

  /// ********************************************
  /// *      ADS START
  /// ********************************************

  static const yandexFlexibleWeb =
      String.fromEnvironment('yandex-flexible-web');

  static const isMarketingMode = bool.fromEnvironment('is-marketing-mode');
  static const isDebugAds = bool.fromEnvironment('is-debug-ads');
}
