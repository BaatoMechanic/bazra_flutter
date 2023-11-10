import 'package:bato_mechanic/src/features/repair_request/presentation/track_mechanic/track_mechanic_screen.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

import 'src/managers/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter(),
      theme: ThemeManager.lightTheme,
      title: 'Bato Mechanic',
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
