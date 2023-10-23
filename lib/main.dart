import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/core/theme/application/theme_provider.dart';
import 'package:flutter_starter_template/core/app_setup/hive/hive_setup.dart';
import 'package:flutter_starter_template/core/routes/routes.dart';
import 'package:flutter_starter_template/core/theme/app_theme.dart';
import 'package:flutter_starter_template/my_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveSetup.initHive();
  runApp(
    ProviderScope(
      observers: [
        MyObserver(),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: themeMode.value,
      routerConfig: routes,
    );
  }
}
