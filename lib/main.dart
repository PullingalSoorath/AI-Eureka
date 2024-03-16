import 'package:eureka/homepage.dart';
import 'package:eureka/util/theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
