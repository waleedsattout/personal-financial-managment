import "package:flutter/material.dart";

class ErrorTheme {
  final TextTheme textTheme;

  const ErrorTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff904a45),
      surfaceTint: Color(0xff904a45),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdad6),
      onPrimaryContainer: Color(0xff3b0908),
      secondary: Color(0xff775653),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdad6),
      onSecondaryContainer: Color(0xff2c1513),
      tertiary: Color(0xff725b2e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfffedea6),
      onTertiaryContainer: Color(0xff261900),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff231918),
      onSurfaceVariant: Color(0xff534342),
      outline: Color(0xff857371),
      outlineVariant: Color(0xffd8c2bf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2d),
      inversePrimary: Color(0xffffb3ac),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff3b0908),
      primaryFixedDim: Color(0xffffb3ac),
      onPrimaryFixedVariant: Color(0xff73332f),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff2c1513),
      secondaryFixedDim: Color(0xffe7bdb8),
      onSecondaryFixedVariant: Color(0xff5d3f3c),
      tertiaryFixed: Color(0xfffedea6),
      onTertiaryFixed: Color(0xff261900),
      tertiaryFixedDim: Color(0xffe1c38c),
      onTertiaryFixedVariant: Color(0xff584419),
      surfaceDim: Color(0xffe8d6d4),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae8),
      surfaceContainerHigh: Color(0xfff6e4e2),
      surfaceContainerHighest: Color(0xfff1dedc),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6e302b),
      surfaceTint: Color(0xff904a45),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffaa6059),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff593b39),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff8f6c69),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff544015),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8a7142),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff231918),
      onSurfaceVariant: Color(0xff4e3f3e),
      outline: Color(0xff6c5b59),
      outlineVariant: Color(0xff897674),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2d),
      inversePrimary: Color(0xffffb3ac),
      primaryFixed: Color(0xffaa6059),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff8d4842),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff8f6c69),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff745451),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8a7142),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6f592c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe8d6d4),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae8),
      surfaceContainerHigh: Color(0xfff6e4e2),
      surfaceContainerHighest: Color(0xfff1dedc),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff44100e),
      surfaceTint: Color(0xff904a45),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6e302b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff341b19),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff593b39),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2f2000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff544015),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff2e211f),
      outline: Color(0xff4e3f3e),
      outlineVariant: Color(0xff4e3f3e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2d),
      inversePrimary: Color(0xffffe7e4),
      primaryFixed: Color(0xff6e302b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff521a17),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff593b39),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff402623),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff544015),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3b2a02),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe8d6d4),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae8),
      surfaceContainerHigh: Color(0xfff6e4e2),
      surfaceContainerHighest: Color(0xfff1dedc),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb3ac),
      surfaceTint: Color(0xffffb3ac),
      onPrimary: Color(0xff571e1a),
      primaryContainer: Color(0xff73332f),
      onPrimaryContainer: Color(0xffffdad6),
      secondary: Color(0xffe7bdb8),
      onSecondary: Color(0xff442927),
      secondaryContainer: Color(0xff5d3f3c),
      onSecondaryContainer: Color(0xffffdad6),
      tertiary: Color(0xffe1c38c),
      onTertiary: Color(0xff3f2d04),
      tertiaryContainer: Color(0xff584419),
      onTertiaryContainer: Color(0xfffedea6),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a1110),
      onSurface: Color(0xfff1dedc),
      onSurfaceVariant: Color(0xffd8c2bf),
      outline: Color(0xffa08c8a),
      outlineVariant: Color(0xff534342),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dedc),
      inversePrimary: Color(0xff904a45),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff3b0908),
      primaryFixedDim: Color(0xffffb3ac),
      onPrimaryFixedVariant: Color(0xff73332f),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff2c1513),
      secondaryFixedDim: Color(0xffe7bdb8),
      onSecondaryFixedVariant: Color(0xff5d3f3c),
      tertiaryFixed: Color(0xfffedea6),
      onTertiaryFixed: Color(0xff261900),
      tertiaryFixedDim: Color(0xffe1c38c),
      onTertiaryFixedVariant: Color(0xff584419),
      surfaceDim: Color(0xff1a1110),
      surfaceBright: Color(0xff423735),
      surfaceContainerLowest: Color(0xff140c0b),
      surfaceContainerLow: Color(0xff231918),
      surfaceContainer: Color(0xff271d1c),
      surfaceContainerHigh: Color(0xff322826),
      surfaceContainerHighest: Color(0xff3d3231),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffbab3),
      surfaceTint: Color(0xffffb3ac),
      onPrimary: Color(0xff330404),
      primaryContainer: Color(0xffcc7b74),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffebc1bc),
      onSecondary: Color(0xff26100e),
      secondaryContainer: Color(0xffad8884),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe5c790),
      onTertiary: Color(0xff201400),
      tertiaryContainer: Color(0xffa88d5b),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1110),
      onSurface: Color(0xfffff9f9),
      onSurfaceVariant: Color(0xffdcc6c3),
      outline: Color(0xffb39e9c),
      outlineVariant: Color(0xff927f7d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dedc),
      inversePrimary: Color(0xff743430),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff2c0102),
      primaryFixedDim: Color(0xffffb3ac),
      onPrimaryFixedVariant: Color(0xff5e2320),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff200b09),
      secondaryFixedDim: Color(0xffe7bdb8),
      onSecondaryFixedVariant: Color(0xff4b2f2c),
      tertiaryFixed: Color(0xfffedea6),
      onTertiaryFixed: Color(0xff190f00),
      tertiaryFixedDim: Color(0xffe1c38c),
      onTertiaryFixedVariant: Color(0xff463309),
      surfaceDim: Color(0xff1a1110),
      surfaceBright: Color(0xff423735),
      surfaceContainerLowest: Color(0xff140c0b),
      surfaceContainerLow: Color(0xff231918),
      surfaceContainer: Color(0xff271d1c),
      surfaceContainerHigh: Color(0xff322826),
      surfaceContainerHighest: Color(0xff3d3231),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f9),
      surfaceTint: Color(0xffffb3ac),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffbab3),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffebc1bc),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe5c790),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1110),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9f9),
      outline: Color(0xffdcc6c3),
      outlineVariant: Color(0xffdcc6c3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dedc),
      inversePrimary: Color(0xff4e1715),
      primaryFixed: Color(0xffffe0dc),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffbab3),
      onPrimaryFixedVariant: Color(0xff330404),
      secondaryFixed: Color(0xffffe0dc),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffebc1bc),
      onSecondaryFixedVariant: Color(0xff26100e),
      tertiaryFixed: Color(0xffffe3b4),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe5c790),
      onTertiaryFixedVariant: Color(0xff201400),
      surfaceDim: Color(0xff1a1110),
      surfaceBright: Color(0xff423735),
      surfaceContainerLowest: Color(0xff140c0b),
      surfaceContainerLow: Color(0xff231918),
      surfaceContainer: Color(0xff271d1c),
      surfaceContainerHigh: Color(0xff322826),
      surfaceContainerHighest: Color(0xff3d3231),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
