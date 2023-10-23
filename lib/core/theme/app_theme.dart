import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(),
    textTheme: const TextTheme(),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(),
    textTheme: const TextTheme(),
  );
}
