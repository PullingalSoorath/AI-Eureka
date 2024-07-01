import 'package:flutter/material.dart';

final lightMode = ThemeData(
  appBarTheme: const AppBarTheme(color: Colors.white),
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color.fromARGB(255, 218, 234, 247),
    primary: Colors.black,
    secondary: Colors.white,
    primaryContainer: Color.fromARGB(255, 96, 178, 245),
    onSurface: Color.fromARGB(255, 252, 252, 252),
    secondaryContainer: Color.fromARGB(255, 208, 242, 254),
  ),
);

final darkMode = ThemeData(
  appBarTheme: const AppBarTheme(color: Colors.transparent),
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color.fromARGB(255, 0, 37, 68),
    primary: Colors.white,
    secondary: Colors.black,
    primaryContainer: Color.fromARGB(255, 42, 79, 110),
    onSurface: Color.fromARGB(255, 24, 80, 125),
    secondaryContainer: Color.fromARGB(255, 1, 37, 50),
  ),
);
