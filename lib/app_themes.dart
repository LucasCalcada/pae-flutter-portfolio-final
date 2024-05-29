import 'package:flutter/material.dart';

class Themes{
  static ColorScheme darkSchemeColors = const ColorScheme(
    brightness: Brightness.dark,
    background: Color(0xFF181926),
    onBackground: Color(0xFFCAD3F5),
    surface: Color(0xFF24273A),
    onSurface: Color(0xFFCAD3F5),
    primary: Color(0xFF363A4F),
    onPrimary: Color(0xFF6E738D),
    secondary: Color(0xFFB8C0E0),
    onSecondary: Color(0xFF8087A2),
    error: Color(0xFFED8796),
    onError: Color(0xFFCAD3F5)
  );

  static ColorScheme lightSchemeColors = const ColorScheme(
    brightness: Brightness.light,
    background: Color(0xFFDCE0E8),
    onBackground: Color(0xFF4C4F69),
    surface: Color(0xFFEFF1F5),
    onSurface: Color(0xFF4C4F69),
    primary: Color(0xFFCCD0DA),
    onPrimary: Color(0xFF4C4F69),
    secondary: Color(0xFFBCC0CC),
    onSecondary: Color(0xFF4C4F69),
    error: Color(0xFFD20F39),
    onError: Color(0xFF4C4F69)
  );

  static ThemeData appTheme(ColorScheme colors){
    return ThemeData(
      fontFamily: "Roboto",
      colorScheme: colors,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w600
        ),
        titleSmall: TextStyle(
          fontWeight: FontWeight.w600
        ),
        bodyLarge: TextStyle(
        )
      )
    );
  }

  static ThemeData darkTheme = appTheme(darkSchemeColors);
  static ThemeData lightTheme = appTheme(lightSchemeColors);

  static ThemeMode getCurrentThemeMode(context){
    Brightness b = MediaQuery.of(context).platformBrightness;
    if(b == Brightness.dark) return ThemeMode.dark;
    return ThemeMode.light;
  }
}