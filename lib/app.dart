import 'package:bato_mechanic/src/common/core/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/features/core/application/user_service.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/track_mechanic/track_mechanic_screen.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/utils/constants/managers/color_manager.dart';
import 'src/utils/constants/managers/theme_manager_back.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: ThemeColor.primary,
              title: Text(
                'Do you want to close the app?',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: ThemeColor.dark,
                    ),
              ),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text(
                    'Yes',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ThemeColor.dark,
                        ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text(
                    'No',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ThemeColor.dark,
                        ),
                  ),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: MaterialApp.router(
        routerConfig: goRouter(),
        theme: BaatoAppTheme.lightTheme,
        darkTheme: BaatoAppTheme.darkTheme,
        themeMode: ref.watch(themeModeProvider),
        title: 'Bato Mechanic',
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//   final controller = GestureFlipCardController();

//   @override
//   Widget build(BuildContext context) {
//     return GestureFlipCard(
//       animationDuration: const Duration(milliseconds: 300),
//       axis: FlipAxis.horizontal,
//       controller:
//           controller, // used to ccontrol the Gesture flip programmatically
//       enableController:
//           true, // if [True] if you need flip the card using programmatically
//       frontWidget: MaterialApp.router(
//         routerConfig: goRouter(),
//         theme: ThemeManager.lightTheme,
//         title: 'Bato Mechanic',
//       ),
//       backWidget: const TrackMechanicScreen(),
//     );
//   }
// }
