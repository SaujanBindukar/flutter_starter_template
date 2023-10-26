import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/core/app/application/app_controller.dart';
import 'package:flutter_starter_template/core/app/app_state.dart';
import 'package:flutter_starter_template/core/app_setup/hive/hive_box.dart';
import 'package:flutter_starter_template/core/theme/application/theme_provider.dart'
    as theme;
import 'package:hive/hive.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(theme.themeProvider).asData?.value;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: [
          CupertinoSwitch(
            value: themeMode == ThemeMode.dark,
            onChanged: (value) {
              ref.read(theme.themeProvider.notifier).changeTheme(isDark: value);
            },
          )
        ],
      ),
      body: Center(
        child: InkWell(
            onTap: () async {
              for (final box in HiveBox.hiveBoxes) {
                await Hive.deleteBoxFromDisk(box);
              }
              await Hive.deleteFromDisk();
              ref.read(appNotifierProvider.notifier).updateAppState(
                    const AppState.unAuthenticated(isSignIn: true),
                  );
            },
            child: const Text('Logout')),
      ),
    );
  }
}
