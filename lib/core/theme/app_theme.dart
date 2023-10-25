import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      background: Color(0xffFFFFFF),
    ),
    textTheme: const TextTheme(),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      background: Color(0xff121212),
    ),
    textTheme: const TextTheme(),
  );
}
