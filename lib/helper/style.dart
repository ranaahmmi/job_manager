import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppColors {
  const AppColors();
  static Color primaryColor = const Color(0xff003366);
  static Color grey = const Color(0xFFB5B9BD);
  static Color red = const Color(0xffb00020);
}

final ThemeData lightTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xff003366),
    primaryContainer: Color(0xffacbdcd),
    secondary: Color(0xffff9919),
    secondaryContainer: Color(0xfffff6ec),
    tertiary: Color(0xff5c5c95),
    tertiaryContainer: Color(0xffc8dbf8),
    appBarColor: Color(0xfffff6ec),
    error: Color(0xffb00020),
  ),
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 2,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 9,
    blendOnColors: false,
    blendTextTheme: false,
    thinBorderWidth: 0.5,
    thickBorderWidth: 1.0,
    defaultRadius: 6.0,
    switchSchemeColor: SchemeColor.primary,
    switchThumbSchemeColor: SchemeColor.secondary,
    checkboxSchemeColor: SchemeColor.secondary,
    radioSchemeColor: SchemeColor.secondary,
    inputDecoratorIsFilled: false,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
    bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.onPrimary,
    bottomNavigationBarMutedUnselectedLabel: false,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
    bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.onPrimary,
    bottomNavigationBarMutedUnselectedIcon: false,
    bottomNavigationBarBackgroundSchemeColor: SchemeColor.primary,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  fontFamily: "Arial",
);

final ThemeData darkTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xff9fc9ff),
    primaryContainer: Color(0xff00325b),
    secondary: Color(0xffffb59d),
    secondaryContainer: Color(0xff872100),
    tertiary: Color(0xff86d2e1),
    tertiaryContainer: Color(0xff004e59),
    appBarColor: Color(0xff872100),
    error: Color(0xffcf6679),
  ),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 15,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    defaultRadius: 6.0,
    thinBorderWidth: 0.5,
    thickBorderWidth: 1.0,
    switchSchemeColor: SchemeColor.primary,
    switchThumbSchemeColor: SchemeColor.secondary,
    checkboxSchemeColor: SchemeColor.secondary,
    radioSchemeColor: SchemeColor.secondary,
    inputDecoratorIsFilled: false,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
    bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.onPrimary,
    bottomNavigationBarMutedUnselectedLabel: false,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
    bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.onPrimary,
    bottomNavigationBarMutedUnselectedIcon: false,
    bottomNavigationBarBackgroundSchemeColor: SchemeColor.primary,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);
