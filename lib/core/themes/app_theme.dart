import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
      primary: Color(0xFF6C63FF),
      brightness: Brightness.light
  )
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
      primary: Color(0xFF6C63FF),
      brightness: Brightness.dark
  )
);