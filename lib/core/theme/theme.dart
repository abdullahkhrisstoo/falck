import "package:falack_app/core/font/fonts.dart";
import "package:flutter/material.dart";
import "package:falack_app/core/theme/text_form_feild_theme.dart";

class MaterialTheme {
  const MaterialTheme();

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3f6370),
      surfaceTint: Color(0xff3f6370),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc2e8f7),
      onPrimaryContainer: Color(0xff284c59),
      secondary: Color(0xff00677f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff42c1e6),
      onSecondaryContainer: Color(0xff002c37),
      tertiary: Color(0xff006397),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff68bdff),
      onTertiaryContainer: Color(0xff002c47),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff9f9fa),
      onSurface: Color(0xff1a1c1d),
      onSurfaceVariant: Color(0xff41484b),
      outline: Color(0xff71787b),
      outlineVariant: Color(0xffc1c7cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3131),
      inversePrimary: Color(0xffa7ccdb),
      primaryFixed: Color(0xffc2e9f8),
      onPrimaryFixed: Color(0xff001f28),
      primaryFixedDim: Color(0xffa7ccdb),
      onPrimaryFixedVariant: Color(0xff274c58),
      secondaryFixed: Color(0xffb6eaff),
      onSecondaryFixed: Color(0xff001f28),
      secondaryFixedDim: Color(0xff5cd5fb),
      onSecondaryFixedVariant: Color(0xff004e60),
      tertiaryFixed: Color(0xffcce5ff),
      onTertiaryFixed: Color(0xff001d31),
      tertiaryFixedDim: Color(0xff92ccff),
      onTertiaryFixedVariant: Color(0xff004b73),
      surfaceDim: Color(0xffdadadb),
      surfaceBright: Color(0xfff9f9fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f3f4),
      surfaceContainer: Color(0xffeeeeee),
      surfaceContainerHigh: Color(0xffe8e8e9),
      surfaceContainerHighest: Color(0xffe2e2e3),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff6E46BF), //todo: updated
      surfaceTint: Color(0xffa7ccdb),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb5dae9),
      onPrimaryContainer: Color(0xff1e4450),
      secondary: Color(0xff60d8fe),
      onSecondary: Color(0xff003543),
      secondaryContainer: Color(0xff24aed3),
      onSecondaryContainer: Color(0xff00181f),
      tertiary: Color(0xffa0d2ff),
      onTertiary: Color(0xff003351),
      tertiaryContainer: Color(0xff3aacf7),
      onTertiaryContainer: Color(0xff001b2d),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff171B21), //todo: background
      onSurface: Color(0xffe2e2e3),
      onSurfaceVariant: Color(0xffc1c7cb),
      outline: Color(0xff8b9295),
      outlineVariant: Color(0xff41484b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e3),
      inversePrimary: Color(0xff3f6370),
      primaryFixed: Color(0xffc2e9f8),
      onPrimaryFixed: Color(0xff001f28),
      primaryFixedDim: Color(0xffa7ccdb),
      onPrimaryFixedVariant: Color(0xff274c58),
      secondaryFixed: Color(0xffb6eaff),
      onSecondaryFixed: Color(0xff001f28),
      secondaryFixedDim: Color(0xff5cd5fb),
      onSecondaryFixedVariant: Color(0xff004e60),
      tertiaryFixed: Color(0xffcce5ff),
      onTertiaryFixed: Color(0xff001d31),
      tertiaryFixedDim: Color(0xff92ccff),
      onTertiaryFixedVariant: Color(0xff004b73),
      surfaceDim: Color(0xff121414),
      surfaceBright: Color(0xff38393a),
      surfaceContainerLowest: Color(0xff0d0e0f),
      surfaceContainerLow: Color(0xff1a1c1d),
      surfaceContainer: Color(0xff1e2021),
      surfaceContainerHigh: Color(0xff7C7C7E), //todo hint text
      surfaceContainerHighest: Color(0xff1A1F27),
      //       surfaceContainerHighest: Color(0xff333536),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
      useMaterial3: true,
      fontFamily: Fonts.family,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      inputDecorationTheme: TextFormFieldTheme.darkTheme(colorScheme));

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;

  final ColorFamily dark;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.dark,
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
