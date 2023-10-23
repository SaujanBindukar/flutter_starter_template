import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final iThemeRepositoryProvider = Provider<IThemeRepository>((ref) {
  return ThemeRepository();
});

sealed class IThemeRepository {
  Future<void> cacheCurrentTheme({required bool isDarkMode});
  Future<bool> getCurrentTheme();
}

class ThemeRepository implements IThemeRepository {
  @override
  Future<void> cacheCurrentTheme({required bool isDarkMode}) async {
    try {
      final box = await Hive.openLazyBox<bool>('themeBox');
      await box.put('currentTheme', isDarkMode);
    } catch (e) {
      debugPrint('error in hive box $e');
    }
  }

  @override
  Future<bool> getCurrentTheme() async {
    try {
      final box = await Hive.openLazyBox<bool>('themeBox');
      final isDarkMode = box.isEmpty ? false : await box.get('currentTheme');
      return isDarkMode ?? false;
    } catch (e) {
      return false;
    }
  }
}
