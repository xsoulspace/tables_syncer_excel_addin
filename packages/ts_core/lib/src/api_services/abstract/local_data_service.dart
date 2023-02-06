abstract class ILocalDataService {
  Future<void> setMap(
    final String key,
    final Map<String, dynamic> value,
  );
  Future<Map<String, dynamic>> getMap(
    final String key,
  );
  Future<void> setString(final String key, final String value);
  Future<String> getString(
    final String key, {
    final String defaultValue = '',
  });
  // ignore: avoid_positional_boolean_parameters
  Future<void> setBool(final String key, final bool value);
  Future<bool> getBool(
    final String key, {
    final bool defaultValue = false,
  });
  Future<void> setInt(final String key, final int? value);
  Future<int> getInt(
    final String key, {
    final int defaultValue = 0,
  });
}
