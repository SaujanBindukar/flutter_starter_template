import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void showSnackBar({required String message}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
