import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4284571928),
      surfaceTint: Color(4284571928),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4293453711),
      onPrimaryContainer: Color(4280098048),
      secondary: Color(4284506179),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293387455),
      onSecondaryContainer: Color(4280098054),
      tertiary: Color(4282213975),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290768088),
      onTertiaryContainer: Color(4278198551),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294834668),
      onSurface: Color(4280032276),
      onSurfaceVariant: Color(4282926906),
      outline: Color(4286150761),
      outlineVariant: Color(4291479478),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413928),
      inversePrimary: Color(4291545974),
      primaryFixed: Color(4293453711),
      onPrimaryFixed: Color(4280098048),
      primaryFixedDim: Color(4291545974),
      onPrimaryFixedVariant: Color(4282992896),
      secondaryFixed: Color(4293387455),
      onSecondaryFixed: Color(4280098054),
      secondaryFixedDim: Color(4291479717),
      onSecondaryFixedVariant: Color(4282992685),
      tertiaryFixed: Color(4290768088),
      onTertiaryFixed: Color(4278198551),
      tertiaryFixedDim: Color(4288991421),
      onTertiaryFixedVariant: Color(4280634944),
      surfaceDim: Color(4292729549),
      surfaceBright: Color(4294834668),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294440166),
      surfaceContainer: Color(4294045409),
      surfaceContainerHigh: Color(4293716187),
      surfaceContainerHighest: Color(4293321685),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282729728),
      surfaceTint: Color(4284571928),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4286085165),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282729513),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286019159),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280371772),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283661676),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294834668),
      onSurface: Color(4280032276),
      onSurfaceVariant: Color(4282663734),
      outline: Color(4284571730),
      outlineVariant: Color(4286413676),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413928),
      inversePrimary: Color(4291545974),
      primaryFixed: Color(4286085165),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284440342),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286019159),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284374336),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283661676),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282082388),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292729549),
      surfaceBright: Color(4294834668),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294440166),
      surfaceContainer: Color(4294045409),
      surfaceContainerHigh: Color(4293716187),
      surfaceContainerHighest: Color(4293321685),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4280558592),
      surfaceTint: Color(4284571928),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282729728),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280492811),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282729513),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200348),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280371772),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294834668),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280624153),
      outline: Color(4282663734),
      outlineVariant: Color(4282663734),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413928),
      inversePrimary: Color(4294111640),
      primaryFixed: Color(4282729728),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281216512),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282729513),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281216533),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280371772),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278596390),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292729549),
      surfaceBright: Color(4294834668),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294440166),
      surfaceContainer: Color(4294045409),
      surfaceContainerHigh: Color(4293716187),
      surfaceContainerHighest: Color(4293321685),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4291545974),
      surfaceTint: Color(4291545974),
      onPrimary: Color(4281479680),
      primaryContainer: Color(4282992896),
      onPrimaryContainer: Color(4293453711),
      secondary: Color(4291479717),
      onSecondary: Color(4281479704),
      secondaryContainer: Color(4282992685),
      onSecondaryContainer: Color(4293387455),
      tertiary: Color(4288991421),
      onTertiary: Color(4278925098),
      tertiaryContainer: Color(4280634944),
      onTertiaryContainer: Color(4290768088),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279505932),
      onSurface: Color(4293321685),
      onSurfaceVariant: Color(4291479478),
      outline: Color(4287861122),
      outlineVariant: Color(4282926906),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293321685),
      inversePrimary: Color(4284571928),
      primaryFixed: Color(4293453711),
      onPrimaryFixed: Color(4280098048),
      primaryFixedDim: Color(4291545974),
      onPrimaryFixedVariant: Color(4282992896),
      secondaryFixed: Color(4293387455),
      onSecondaryFixed: Color(4280098054),
      secondaryFixedDim: Color(4291479717),
      onSecondaryFixedVariant: Color(4282992685),
      tertiaryFixed: Color(4290768088),
      onTertiaryFixed: Color(4278198551),
      tertiaryFixedDim: Color(4288991421),
      onTertiaryFixedVariant: Color(4280634944),
      surfaceDim: Color(4279505932),
      surfaceBright: Color(4282006064),
      surfaceContainerLowest: Color(4279176967),
      surfaceContainerLow: Color(4280032276),
      surfaceContainer: Color(4280295448),
      surfaceContainerHigh: Color(4281018914),
      surfaceContainerHighest: Color(4281742636),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4291874682),
      surfaceTint: Color(4291545974),
      onPrimary: Color(4279703296),
      primaryContainer: Color(4287992902),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291742889),
      onSecondary: Color(4279703299),
      secondaryContainer: Color(4287926898),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289254593),
      onTertiary: Color(4278197010),
      tertiaryContainer: Color(4285504136),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279505932),
      onSurface: Color(4294900717),
      onSurfaceVariant: Color(4291742650),
      outline: Color(4289045395),
      outlineVariant: Color(4286940276),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293321685),
      inversePrimary: Color(4283124480),
      primaryFixed: Color(4293453711),
      onPrimaryFixed: Color(4279374336),
      primaryFixedDim: Color(4291545974),
      onPrimaryFixedVariant: Color(4281874432),
      secondaryFixed: Color(4293387455),
      onSecondaryFixed: Color(4279374337),
      secondaryFixedDim: Color(4291479717),
      onSecondaryFixedVariant: Color(4281874206),
      tertiaryFixed: Color(4290768088),
      onTertiaryFixed: Color(4278195469),
      tertiaryFixedDim: Color(4288991421),
      onTertiaryFixedVariant: Color(4279450927),
      surfaceDim: Color(4279505932),
      surfaceBright: Color(4282006064),
      surfaceContainerLowest: Color(4279176967),
      surfaceContainerLow: Color(4280032276),
      surfaceContainer: Color(4280295448),
      surfaceContainerHigh: Color(4281018914),
      surfaceContainerHighest: Color(4281742636),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294966492),
      surfaceTint: Color(4291545974),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4291874682),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294966492),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291742889),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293787637),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289254593),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279505932),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294966249),
      outline: Color(4291742650),
      outlineVariant: Color(4291742650),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293321685),
      inversePrimary: Color(4281084928),
      primaryFixed: Color(4293716883),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4291874682),
      onPrimaryFixedVariant: Color(4279703296),
      secondaryFixed: Color(4293650883),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291742889),
      onSecondaryFixedVariant: Color(4279703299),
      tertiaryFixed: Color(4291097052),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289254593),
      onTertiaryFixedVariant: Color(4278197010),
      surfaceDim: Color(4279505932),
      surfaceBright: Color(4282006064),
      surfaceContainerLowest: Color(4279176967),
      surfaceContainerLow: Color(4280032276),
      surfaceContainer: Color(4280295448),
      surfaceContainerHigh: Color(4281018914),
      surfaceContainerHighest: Color(4281742636),
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
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
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
