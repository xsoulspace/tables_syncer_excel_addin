part of 'api_interceptors.dart';

enum ApiTokenPolicy {
  withTokenOnly,
  withTokenOrWithout,
  tokenFree,
}

enum EqualityPolicy {
  equals,
  startWith,
}

class ApiStrategy {
  ApiStrategy({
    this.tokenPolicy = ApiTokenPolicy.tokenFree,
    this.equalityPolicy = EqualityPolicy.equals,
  });
  final ApiTokenPolicy tokenPolicy;
  final EqualityPolicy equalityPolicy;
}

class ApiVerifier {
  ApiVerifier({
    required this.pathsStrategies,
  });

  final Map<String, ApiStrategy> pathsStrategies;

  ApiStrategy? checkAnotherPolicies(final String path) {
    for (final startWithPath in startWithPaths()) {
      if (path.startsWith(startWithPath)) {
        return pathsStrategies[startWithPath];
      }
    }
    return null;
  }

  ApiStrategy getStrategy(final String path) {
    /// verify by equality policy
    ApiStrategy? effectiveStrategy = pathsStrategies[path];
    effectiveStrategy ??= checkAnotherPolicies(path);

    return effectiveStrategy ??
        ApiStrategy(
          tokenPolicy: ApiTokenPolicy.withTokenOnly,
        );
  }

  Iterable<String> startWithPaths() => pathsStrategies.entries
      .where(
        (final pathEntry) =>
            pathEntry.value.equalityPolicy == EqualityPolicy.startWith,
      )
      .map((final e) => e.key);
}
