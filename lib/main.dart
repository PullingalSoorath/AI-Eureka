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
      theme: myTheme,
      themeMode: ThemeMode.system, // Change theme mode to follow system default
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
