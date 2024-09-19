import "package:flutter/material.dart";

class PrimaryTheme {
  final TextTheme textTheme;

  const PrimaryTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff595892),
      surfaceTint: Color(0xff595892),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffe2dfff),
      onPrimaryContainer: Color(0xff15134a),
      secondary: Color(0xff5d5c71),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe3e0f9),
      onSecondaryContainer: Color(0xff1a1a2c),
      tertiary: Color(0xff7a5368),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd8eb),
      onTertiaryContainer: Color(0xff2f1124),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff1b1b21),
      onSurfaceVariant: Color(0xff47464f),
      outline: Color(0xff787680),
      outlineVariant: Color(0xffc8c5d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inversePrimary: Color(0xffc2c1ff),
      primaryFixed: Color(0xffe2dfff),
      onPrimaryFixed: Color(0xff15134a),
      primaryFixedDim: Color(0xffc2c1ff),
      onPrimaryFixedVariant: Color(0xff424178),
      secondaryFixed: Color(0xffe3e0f9),
      onSecondaryFixed: Color(0xff1a1a2c),
      secondaryFixedDim: Color(0xffc7c4dd),
      onSecondaryFixedVariant: Color(0xff464559),
      tertiaryFixed: Color(0xffffd8eb),
      onTertiaryFixed: Color(0xff2f1124),
      tertiaryFixedDim: Color(0xffeab9d2),
      onTertiaryFixedVariant: Color(0xff603c50),
      surfaceDim: Color(0xffdcd9e0),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffeae7ef),
      surfaceContainerHighest: Color(0xffe5e1e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3e3d74),
      surfaceTint: Color(0xff595892),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff706fa9),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff424155),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff747288),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5b384c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff92687f),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff1b1b21),
      onSurfaceVariant: Color(0xff43424b),
      outline: Color(0xff5f5e67),
      outlineVariant: Color(0xff7b7983),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inversePrimary: Color(0xffc2c1ff),
      primaryFixed: Color(0xff706fa9),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff57568f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff747288),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5b5a6f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff92687f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff775066),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd9e0),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffeae7ef),
      surfaceContainerHighest: Color(0xffe5e1e9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1c1b51),
      surfaceTint: Color(0xff595892),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3e3d74),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff212033),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff424155),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff37182b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5b384c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff24232b),
      outline: Color(0xff43424b),
      outlineVariant: Color(0xff43424b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inversePrimary: Color(0xffedeaff),
      primaryFixed: Color(0xff3e3d74),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff27265c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff424155),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2b2b3e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5b384c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff432235),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd9e0),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffeae7ef),
      surfaceContainerHighest: Color(0xffe5e1e9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc2c1ff),
      surfaceTint: Color(0xffc2c1ff),
      onPrimary: Color(0xff2b2a60),
      primaryContainer: Color(0xff424178),
      onPrimaryContainer: Color(0xffe2dfff),
      secondary: Color(0xffc7c4dd),
      onSecondary: Color(0xff2f2f42),
      secondaryContainer: Color(0xff464559),
      onSecondaryContainer: Color(0xffe3e0f9),
      tertiary: Color(0xffeab9d2),
      onTertiary: Color(0xff472639),
      tertiaryContainer: Color(0xff603c50),
      onTertiaryContainer: Color(0xffffd8eb),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff131318),
      onSurface: Color(0xffe5e1e9),
      onSurfaceVariant: Color(0xffc8c5d0),
      outline: Color(0xff928f9a),
      outlineVariant: Color(0xff47464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e9),
      inversePrimary: Color(0xff595892),
      primaryFixed: Color(0xffe2dfff),
      onPrimaryFixed: Color(0xff15134a),
      primaryFixedDim: Color(0xffc2c1ff),
      onPrimaryFixedVariant: Color(0xff424178),
      secondaryFixed: Color(0xffe3e0f9),
      onSecondaryFixed: Color(0xff1a1a2c),
      secondaryFixedDim: Color(0xffc7c4dd),
      onSecondaryFixedVariant: Color(0xff464559),
      tertiaryFixed: Color(0xffffd8eb),
      onTertiaryFixed: Color(0xff2f1124),
      tertiaryFixedDim: Color(0xffeab9d2),
      onTertiaryFixedVariant: Color(0xff603c50),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39383f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff201f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff35343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc7c5ff),
      surfaceTint: Color(0xffc2c1ff),
      onPrimary: Color(0xff100d45),
      primaryContainer: Color(0xff8c8bc8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffcbc8e1),
      onSecondary: Color(0xff151426),
      secondaryContainer: Color(0xff908ea5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffeebdd6),
      onTertiary: Color(0xff290c1e),
      tertiaryContainer: Color(0xffb0849b),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131318),
      onSurface: Color(0xfffdf9ff),
      onSurfaceVariant: Color(0xffccc9d4),
      outline: Color(0xffa4a1ac),
      outlineVariant: Color(0xff84828c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e9),
      inversePrimary: Color(0xff434279),
      primaryFixed: Color(0xffe2dfff),
      onPrimaryFixed: Color(0xff0a0640),
      primaryFixedDim: Color(0xffc2c1ff),
      onPrimaryFixedVariant: Color(0xff313066),
      secondaryFixed: Color(0xffe3e0f9),
      onSecondaryFixed: Color(0xff100f21),
      secondaryFixedDim: Color(0xffc7c4dd),
      onSecondaryFixedVariant: Color(0xff353448),
      tertiaryFixed: Color(0xffffd8eb),
      onTertiaryFixed: Color(0xff230719),
      tertiaryFixedDim: Color(0xffeab9d2),
      onTertiaryFixedVariant: Color(0xff4d2b3f),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39383f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff201f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff35343a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffdf9ff),
      surfaceTint: Color(0xffc2c1ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffc7c5ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffdf9ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffcbc8e1),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9f9),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffeebdd6),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffdf9ff),
      outline: Color(0xffccc9d4),
      outlineVariant: Color(0xffccc9d4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e9),
      inversePrimary: Color(0xff242359),
      primaryFixed: Color(0xffe7e4ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc7c5ff),
      onPrimaryFixedVariant: Color(0xff100d45),
      secondaryFixed: Color(0xffe7e4fe),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffcbc8e1),
      onSecondaryFixedVariant: Color(0xff151426),
      tertiaryFixed: Color(0xffffdeed),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffeebdd6),
      onTertiaryFixedVariant: Color(0xff290c1e),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39383f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff201f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff35343a),
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
