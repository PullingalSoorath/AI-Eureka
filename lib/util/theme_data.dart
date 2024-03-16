import 'package:flutter/material.dart';

// ThemeMode themeMode = ThemeMode.system;

// ThemeData get themedata {
//   switch (themeMode) {
//     case ThemeMode.system:
//       return lightMode;
//     case ThemeMode.light:
//       return lightMode;
//     case ThemeMode.dark:
//       return darkMode;
//   }
// }

final lightMode = ThemeData(
  appBarTheme: const AppBarTheme(color: Colors.white),
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(255, 218, 234, 247),
    primary: Colors.black,
    secondary: Colors.white,
    primaryContainer: Colors.blue,
    onBackground: Color.fromARGB(255, 252, 252, 252),
  ),
);

final darkMode = ThemeData(
  appBarTheme: const AppBarTheme(color: Colors.transparent),
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Color.fromARGB(255, 0, 37, 68),
    primary: Colors.white,
    secondary: Colors.black,
    primaryContainer: Color.fromARGB(255, 42, 79, 110),
    onBackground: Color.fromARGB(255, 24, 80, 125),
  ),
);
