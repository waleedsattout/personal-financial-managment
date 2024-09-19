import "package:flutter/material.dart";

class WarningTheme {
  final TextTheme textTheme;

  const WarningTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff835414),
      surfaceTint: Color(0xff835414),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffddba),
      onPrimaryContainer: Color(0xff2b1700),
      secondary: Color(0xff715a41),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffdddbd),
      onSecondaryContainer: Color(0xff281805),
      tertiary: Color(0xff55633c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffd8e9b7),
      onTertiaryContainer: Color(0xff141f02),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff211a13),
      onSurfaceVariant: Color(0xff50453a),
      outline: Color(0xff827568),
      outlineVariant: Color(0xffd4c4b5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372f27),
      inversePrimary: Color(0xfff9ba72),
      primaryFixed: Color(0xffffddba),
      onPrimaryFixed: Color(0xff2b1700),
      primaryFixedDim: Color(0xfff9ba72),
      onPrimaryFixedVariant: Color(0xff663d00),
      secondaryFixed: Color(0xfffdddbd),
      onSecondaryFixed: Color(0xff281805),
      secondaryFixedDim: Color(0xffe0c1a3),
      onSecondaryFixedVariant: Color(0xff58432b),
      tertiaryFixed: Color(0xffd8e9b7),
      onTertiaryFixed: Color(0xff141f02),
      tertiaryFixedDim: Color(0xffbdcd9d),
      onTertiaryFixedVariant: Color(0xff3e4b27),
      surfaceDim: Color(0xffe5d8cc),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e6),
      surfaceContainer: Color(0xfffaebe0),
      surfaceContainerHigh: Color(0xfff4e6da),
      surfaceContainerHighest: Color(0xffeee0d5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff613a00),
      surfaceTint: Color(0xff835414),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9d6a29),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff543f28),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff897056),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3a4723),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6b7a50),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff211a13),
      onSurfaceVariant: Color(0xff4c4136),
      outline: Color(0xff695d51),
      outlineVariant: Color(0xff86786b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372f27),
      inversePrimary: Color(0xfff9ba72),
      primaryFixed: Color(0xff9d6a29),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff805212),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff897056),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6f583f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6b7a50),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff53613a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe5d8cc),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e6),
      surfaceContainer: Color(0xfffaebe0),
      surfaceContainerHigh: Color(0xfff4e6da),
      surfaceContainerHighest: Color(0xffeee0d5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff341d00),
      surfaceTint: Color(0xff835414),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff613a00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff301f0a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff543f28),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1a2605),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3a4723),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff2b2218),
      outline: Color(0xff4c4136),
      outlineVariant: Color(0xff4c4136),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372f27),
      inversePrimary: Color(0xffffe8d3),
      primaryFixed: Color(0xff613a00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff432600),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff543f28),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3b2914),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff3a4723),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff24310f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe5d8cc),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e6),
      surfaceContainer: Color(0xfffaebe0),
      surfaceContainerHigh: Color(0xfff4e6da),
      surfaceContainerHighest: Color(0xffeee0d5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff9ba72),
      surfaceTint: Color(0xfff9ba72),
      onPrimary: Color(0xff482a00),
      primaryContainer: Color(0xff663d00),
      onPrimaryContainer: Color(0xffffddba),
      secondary: Color(0xffe0c1a3),
      onSecondary: Color(0xff3f2d17),
      secondaryContainer: Color(0xff58432b),
      onSecondaryContainer: Color(0xfffdddbd),
      tertiary: Color(0xffbdcd9d),
      onTertiary: Color(0xff283412),
      tertiaryContainer: Color(0xff3e4b27),
      onTertiaryContainer: Color(0xffd8e9b7),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff18120c),
      onSurface: Color(0xffeee0d5),
      onSurfaceVariant: Color(0xffd4c4b5),
      outline: Color(0xff9d8e81),
      outlineVariant: Color(0xff50453a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeee0d5),
      inversePrimary: Color(0xff835414),
      primaryFixed: Color(0xffffddba),
      onPrimaryFixed: Color(0xff2b1700),
      primaryFixedDim: Color(0xfff9ba72),
      onPrimaryFixedVariant: Color(0xff663d00),
      secondaryFixed: Color(0xfffdddbd),
      onSecondaryFixed: Color(0xff281805),
      secondaryFixedDim: Color(0xffe0c1a3),
      onSecondaryFixedVariant: Color(0xff58432b),
      tertiaryFixed: Color(0xffd8e9b7),
      onTertiaryFixed: Color(0xff141f02),
      tertiaryFixedDim: Color(0xffbdcd9d),
      onTertiaryFixedVariant: Color(0xff3e4b27),
      surfaceDim: Color(0xff18120c),
      surfaceBright: Color(0xff403830),
      surfaceContainerLowest: Color(0xff130d07),
      surfaceContainerLow: Color(0xff211a13),
      surfaceContainer: Color(0xff251e17),
      surfaceContainerHigh: Color(0xff302921),
      surfaceContainerHighest: Color(0xff3b332c),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffebf76),
      surfaceTint: Color(0xfff9ba72),
      onPrimary: Color(0xff241200),
      primaryContainer: Color(0xffbd8643),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe4c5a7),
      onSecondary: Color(0xff221302),
      secondaryContainer: Color(0xffa78c70),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffc1d1a1),
      onTertiary: Color(0xff0f1900),
      tertiaryContainer: Color(0xff87966b),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff18120c),
      onSurface: Color(0xfffffaf8),
      onSurfaceVariant: Color(0xffd9c8b9),
      outline: Color(0xffafa092),
      outlineVariant: Color(0xff8f8174),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeee0d5),
      inversePrimary: Color(0xff683f00),
      primaryFixed: Color(0xffffddba),
      onPrimaryFixed: Color(0xff1d0e00),
      primaryFixedDim: Color(0xfff9ba72),
      onPrimaryFixedVariant: Color(0xff502f00),
      secondaryFixed: Color(0xfffdddbd),
      onSecondaryFixed: Color(0xff1c0e01),
      secondaryFixedDim: Color(0xffe0c1a3),
      onSecondaryFixedVariant: Color(0xff46321c),
      tertiaryFixed: Color(0xffd8e9b7),
      onTertiaryFixed: Color(0xff0b1400),
      tertiaryFixedDim: Color(0xffbdcd9d),
      onTertiaryFixedVariant: Color(0xff2e3a17),
      surfaceDim: Color(0xff18120c),
      surfaceBright: Color(0xff403830),
      surfaceContainerLowest: Color(0xff130d07),
      surfaceContainerLow: Color(0xff211a13),
      surfaceContainer: Color(0xff251e17),
      surfaceContainerHigh: Color(0xff302921),
      surfaceContainerHighest: Color(0xff3b332c),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaf8),
      surfaceTint: Color(0xfff9ba72),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xfffebf76),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf8),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe4c5a7),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff5ffdc),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc1d1a1),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff18120c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffffaf8),
      outline: Color(0xffd9c8b9),
      outlineVariant: Color(0xffd9c8b9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeee0d5),
      inversePrimary: Color(0xff3f2400),
      primaryFixed: Color(0xffffe2c5),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xfffebf76),
      onPrimaryFixedVariant: Color(0xff241200),
      secondaryFixed: Color(0xffffe2c5),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe4c5a7),
      onSecondaryFixedVariant: Color(0xff221302),
      tertiaryFixed: Color(0xffddedbb),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc1d1a1),
      onTertiaryFixedVariant: Color(0xff0f1900),
      surfaceDim: Color(0xff18120c),
      surfaceBright: Color(0xff403830),
      surfaceContainerLowest: Color(0xff130d07),
      surfaceContainerLow: Color(0xff211a13),
      surfaceContainer: Color(0xff251e17),
      surfaceContainerHigh: Color(0xff302921),
      surfaceContainerHighest: Color(0xff3b332c),
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
