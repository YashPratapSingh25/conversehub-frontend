import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    onSurface: Colors.black,
    primary: Color(0xFF6C63FF),
    onPrimary: Colors.white,
    secondary: Colors.white,
    tertiary: Colors.grey,
    outline: Colors.grey,
    shadow: Colors.black,
    brightness: Brightness.light,
  )
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFF24293E),
    onSurface: Color(0xFFF0F0F0),
    primary: Color(0xFF6C63FF),
    onPrimary: Colors.white,
    secondary: Color(0xFF2E3855),
    tertiary: Colors.grey,
    outline: Colors.grey,
    shadow: Colors.white,
    brightness: Brightness.dark,
  )
);