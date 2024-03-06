import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  colorScheme: const ColorScheme(
    primaryContainer: Color.fromARGB(255, 219, 228, 251),
    secondaryContainer: Color.fromARGB(255, 148, 173, 248),

    primary: Colors.blue,
    secondary: Colors.green, // Secondary color
    surface: Colors
        .white, // Surface color (background color of components like cards)
    background: Colors.white, // Background color
    error: Colors.red, // Error color
    onPrimary: Colors.white, // Color for elements on top of the primary color
    onSecondary:
        Colors.white, // Color for elements on top of the secondary color
    onSurface: Colors.black, // Color for elements on top of the surface color
    onBackground:
        Colors.black, // Color for elements on top of the background color
    onError: Colors.white, // Color for elements on top of the error color
    brightness: Brightness.light, // Brightness (light or dark)
    
    
  ),
);
