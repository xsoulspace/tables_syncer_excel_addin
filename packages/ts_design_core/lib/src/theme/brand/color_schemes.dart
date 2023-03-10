part of '../theme.dart';

class BrandColorSchemes {
  BrandColorSchemes._();
  static const light = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006E0F),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF97F989),
    onPrimaryContainer: Color(0xFF002201),
    secondary: Color(0xFF53634E),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD6E8CD),
    onSecondaryContainer: Color(0xFF111F0F),
    tertiary: Color(0xFF386569),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFBCEBEF),
    onTertiaryContainer: Color(0xFF002022),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFCFDF6),
    onBackground: Color(0xFF1A1C19),
    surface: Color(0xFFFCFDF6),
    onSurface: Color(0xFF1A1C19),
    surfaceVariant: Color(0xFFDFE4D8),
    onSurfaceVariant: Color(0xFF42493F),
    outline: Color(0xFF73796E),
    onInverseSurface: Color(0xFFF1F1EB),
    inverseSurface: Color(0xFF2F312D),
    inversePrimary: Color(0xFF7CDC70),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006E0F),
  );
  static final lightSurface = SurfaceColorScheme(light);

  static const dark = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF7CDC70),
    onPrimary: Color(0xFF003A04),
    primaryContainer: Color(0xFF005308),
    onPrimaryContainer: Color(0xFF97F989),
    secondary: Color(0xFFBACCB2),
    onSecondary: Color(0xFF263422),
    secondaryContainer: Color(0xFF3C4B37),
    onSecondaryContainer: Color(0xFFD6E8CD),
    tertiary: Color(0xFFA0CFD3),
    onTertiary: Color(0xFF00363A),
    tertiaryContainer: Color(0xFF1E4D51),
    onTertiaryContainer: Color(0xFFBCEBEF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1A1C19),
    onBackground: Color(0xFFE2E3DD),
    surface: Color(0xFF1A1C19),
    onSurface: Color(0xFFE2E3DD),
    surfaceVariant: Color(0xFF42493F),
    onSurfaceVariant: Color(0xFFC2C8BC),
    outline: Color(0xFF8C9388),
    onInverseSurface: Color(0xFF1A1C19),
    inverseSurface: Color(0xFFE2E3DD),
    inversePrimary: Color(0xFF006E0F),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF7CDC70),
  );
  static final darkSurface = SurfaceColorScheme(dark);
}

class SurfaceColorScheme extends ThemeExtension<SurfaceColorScheme> {
  SurfaceColorScheme(final ColorScheme scheme)
      : surface1 = ElevationOverlay.applySurfaceTint(
          scheme.surface,
          scheme.surfaceTint,
          5,
        ),
        surface2 = ElevationOverlay.applySurfaceTint(
          scheme.surface,
          scheme.surfaceTint,
          8,
        ),
        surface3 = ElevationOverlay.applySurfaceTint(
          scheme.surface,
          scheme.surfaceTint,
          11,
        ),
        surface4 = ElevationOverlay.applySurfaceTint(
          scheme.surface,
          scheme.surfaceTint,
          12,
        ),
        surface5 = ElevationOverlay.applySurfaceTint(
          scheme.surface,
          scheme.surfaceTint,
          14,
        );
  SurfaceColorScheme._({
    required this.surface1,
    required this.surface2,
    required this.surface3,
    required this.surface4,
    required this.surface5,
  });

  final Color surface1;
  final Color surface2;
  final Color surface3;
  final Color surface4;
  final Color surface5;

  @override
  ThemeExtension<SurfaceColorScheme> copyWith() {
    throw UnsupportedError('copyWith');
  }

  @override
  ThemeExtension<SurfaceColorScheme> lerp(
    final ThemeExtension<SurfaceColorScheme>? other,
    final double t,
  ) {
    if (other is! SurfaceColorScheme) {
      return this;
    }
    return SurfaceColorScheme._(
      surface1: Color.lerp(surface1, other.surface1, t)!,
      surface2: Color.lerp(surface2, other.surface2, t)!,
      surface3: Color.lerp(surface3, other.surface3, t)!,
      surface4: Color.lerp(surface4, other.surface4, t)!,
      surface5: Color.lerp(surface5, other.surface5, t)!,
    );
  }
}
