// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:bato_mechanic/src/managers/color_manager.dart';
// import 'package:bato_mechanic/src/managers/values_manager.dart';
// import 'package:flutter/material.dart';

// class Temp extends StatefulWidget {
//   Temp({super.key});

//   @override
//   State<Temp> createState() => _TempState();
// }

// class _TempState extends State<Temp> {
//   List<IconData> iconList = [
//     Icons.home,
//     Icons.search,
//     Icons.person,
//     Icons.settings,
//   ];

//   int _bottomNavIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(), //destination screen
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(
//           Icons.add,
//           size: AppSize.s30,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: AnimatedBottomNavigationBar(
//         elevation: 50,
//         activeColor: ColorManager.primary,
//         icons: iconList,
//         activeIndex: _bottomNavIndex,
//         gapLocation: GapLocation.center,
//         notchSmoothness: NotchSmoothness.defaultEdge,
//         leftCornerRadius: AppRadius.r12,

//         rightCornerRadius: AppRadius.r12,
//         onTap: (index) => setState(() => _bottomNavIndex = index),

//         //other params
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Temp extends StatelessWidget {
  const Temp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
