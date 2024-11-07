import 'package:flutter/material.dart';

class ThemeConfig {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    primaryColor: Colors.green,
    hintColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    // Add other light theme settings as needed
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    hintColor: Colors.white,
  );
}