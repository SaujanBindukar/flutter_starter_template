import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'PlaypenSans',
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      background: Color(0xffFFFFFF),
      outline: Colors.black,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: Colors.black,
      ),
      hintStyle: TextStyle(
        color: Colors.black,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: Colors.black),
      ),
      enabledBorder: OutlineInputBorder(
        gapPadding: 0,
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      errorBorder: OutlineInputBorder(
        gapPadding: 0,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        gapPadding: 0,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.w700,
        )
        // you can add others here
        ),
  );

  static final darkTheme = ThemeData(
    fontFamily: 'PlaypenSans',
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      background: Color(0xff121212),
      outline: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      hintStyle: TextStyle(
        color: Colors.white,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        gapPadding: 0,
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      errorBorder: OutlineInputBorder(
        gapPadding: 0,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        gapPadding: 0,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(fontWeight: FontWeight.w700)

        // you can add others here
        ),
  );
}
