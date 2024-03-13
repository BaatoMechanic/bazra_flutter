import 'package:bato_mechanic/src/features/common/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';
import 'src/utils/constants/managers/color_manager.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: goRouter(),
      theme: BaatoAppTheme.lightTheme,
      darkTheme: BaatoAppTheme.darkTheme,
      themeMode: ref.watch(bThemeModeProvider),
      title: 'Bato Mechanic',
    );
  }
}
