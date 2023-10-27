import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/core/app/application/app_controller.dart';
import 'package:flutter_starter_template/core/app/infrastructure/app_state.dart';
import 'package:flutter_starter_template/core/app_setup/hive/hive_box.dart';
import 'package:flutter_starter_template/core/theme/application/theme_provider.dart'
    as theme;
import 'package:flutter_starter_template/core/widgets/custom_button.dart';
import 'package:hive/hive.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: const [
          _ThemeSwitchWidget(),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to demo app',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            CustomButton(
              name: 'Logout',
              onPressed: () async {
                for (final box in HiveBox.hiveBoxes) {
                  await Hive.deleteBoxFromDisk(box);
                }
                await Hive.deleteFromDisk();
                ref.read(appNotifierProvider.notifier).updateAppState(
                      const AppState.unAuthenticated(isSignIn: true),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeSwitchWidget extends ConsumerWidget {
  const _ThemeSwitchWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(theme.themeProvider).asData?.value;
    return Row(
      children: [
        const Icon(Icons.light_mode_outlined),
        CupertinoSwitch(
          value: themeMode == ThemeMode.dark,
          onChanged: (value) {
            ref.read(theme.themeProvider.notifier).changeTheme(isDark: value);
          },
        ),
        const Icon(Icons.dark_mode_outlined),
      ],
    );
  }
}
