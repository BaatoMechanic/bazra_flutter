import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/shared/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'flavors.dart';
import 'src/shared/providers/user_settings.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter(),
      theme: BaatoAppTheme.lightTheme,
      darkTheme: BaatoAppTheme.darkTheme,
      themeMode: ref.watch(bThemeModeProvider),
      title: 'Bato Mechanic',
      builder: (context, child) {
        // Check if the app is in debug mode
        if (appFlavor == Flavor.dev.name) {
          // Wrap the child widget with a Banner widget to display the custom debug banner
          return Banner(
            message: appFlavor?.toUpperCase() ?? '',
            location: BannerLocation.bottomStart,
            color: Colors.red,
            textStyle: TextStyle(fontSize: 16, color: Colors.white),
            child: child!,
          );
        }
        return child!;
      },
    );
  }
}
