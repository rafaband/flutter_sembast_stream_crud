import 'package:flutter/material.dart';

class AppStyle {
  final ColorScheme _lightScheme = ColorScheme.light().copyWith(
    primary: Color(0xFFF59C3B),
    primaryVariant: Color(0xFFbd6d00),
    onPrimary: Color(0xFF6638B6),
    secondary: Color(0xFF6638B6),
    secondaryVariant: Color(0xFF310885),
    onSecondary: Color(0xFFF59C3B),
    background: Color(0xFFDEDEDE),
    onBackground: Color(0xFF989898),
  );

  final ColorScheme _darkScheme = ColorScheme.dark().copyWith(
    primary: Color(0xFF6638B6),
    primaryVariant: Color(0xFF310885),
    onPrimary: Color(0xFFF59C3B),
    secondary: Color(0xFFF59C3B),
    secondaryVariant: Color(0xFFbd6d00),
    onSecondary: Color(0xFF6638B6),
    background: Color(0xFF989898),
    onBackground: Color(0xFFDEDEDE),
  );

  ThemeData createLightTheme() {
    ThemeData theme = ThemeData.from(colorScheme: _lightScheme);

    return theme.copyWith();
  }

  ThemeData createDarkTheme() {
    ThemeData theme = ThemeData.from(colorScheme: _darkScheme);

    return theme.copyWith();
  }
}
