import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/core/theme/application/theme_provider.dart';

class AppObserver extends ConsumerWidget {
  const AppObserver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider).asData?.value;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          CupertinoSwitch(
            value: themeMode == ThemeMode.dark,
            onChanged: (value) {
              ref.read(themeProvider.notifier).changeTheme(isDark: value);
            },
          )
        ],
      ),
      body: const Center(
        child: Text('adh'),
      ),
    );
  }
}
