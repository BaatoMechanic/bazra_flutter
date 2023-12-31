// import 'dart:async';

// import 'package:bato_mechanic/src/common_widgets/async_value_widget.dart';
// import 'package:bato_mechanic/src/extensions/string_extension.dart';
// import 'package:bato_mechanic/src/features/repair_request/domain/user_position.dart';
// import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/repair_request_controller.dart';
// import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/request_mechanic_screen_controller.dart';
// import 'package:bato_mechanic/src/features/repair_request/presentation/search_map/search_map_widget_controller.dart';
// import 'package:bato_mechanic/src/features/repair_request/presentation/track_mechanic/track_mechanic_screen_controller.dart';
// import 'package:bato_mechanic/src/utils/date_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map/plugin_api.dart';
// import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:latlong2/latlong.dart';

// import '../../../../common_widgets/flutter_map_utils/control_buttons/control_buttons.dart';
// import '../../../../common_widgets/flutter_map_utils/scale_layer/scale_layer_plugin_option.dart';

// class TrackMechanicScreen extends ConsumerStatefulWidget {
//   const TrackMechanicScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   ConsumerState<TrackMechanicScreen> createState() =>
//       _TrackMechanicScreenState();
// }

// class _TrackMechanicScreenState extends ConsumerState<TrackMechanicScreen>
//     with TickerProviderStateMixin {
//   double _animationValue = 0.0;
//   bool _showBigScreenMap = false;
//   late MapController _mapController;
//   late AnimationController _animationController;
//   LatLng _currentPosition = LatLng(27.703292452047425, 85.33033043146135);
//   List<LatLng> pathPoints = [
//     LatLng(27.703309, 85.330293),
//     LatLng(27.703372, 85.330328),
//     LatLng(27.703433, 85.3304),
//     LatLng(27.703345, 85.331427),
//     LatLng(27.7033, 85.331973),
//     LatLng(27.70331, 85.332081),
//     LatLng(27.703411, 85.332267),
//     LatLng(27.703528, 85.332441),
//     LatLng(27.703606, 85.332502),
//     LatLng(27.703818, 85.332652),
//     LatLng(27.703918, 85.332654),
//     LatLng(27.703817, 85.332944),
//     LatLng(27.703525, 85.333931),
//     LatLng(27.703437, 85.334216),
//     LatLng(27.703365, 85.334465),
//     LatLng(27.703, 85.33565),
//     LatLng(27.70294, 85.335815),
//     LatLng(27.702783, 85.336285),
//     LatLng(27.702876, 85.336324),
//     LatLng(27.703198, 85.336223),
//     LatLng(27.70327, 85.33621)
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _mapController = MapController();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 5),
//     );

//     int _currentIndex = 0;

//     // final timer = Timer.periodic(Duration(seconds: 3), (timer) async {
//     //   // print('called');
//     //   if (_currentIndex < pathPoints.length - 1) {
//     //     UserPosition? nextPosition =
//     //         ref.read(watchMechanicPositionProvider).value;
//     //     if (ref.read(watchMechanicPositionProvider).isLoading) {
//     //       print('dd');
//     //       return;
//     //     }
//     //     if (nextPosition == null) {
//     //       print('null');
//     //       ref.read(repairRequestControllerProvider).repairRequest;
//     //     } else {
//     //       nextPosition = nextPosition.copyWith(
//     //           latitude: pathPoints[_currentIndex].latitude);
//     //       nextPosition = nextPosition.copyWith(
//     //           longitude: pathPoints[_currentIndex].longitude);

//     //       ref
//     //           .read(trackMechanicScreenControllerProvider.notifier)
//     //           .setMarkerPosition(nextPosition);
//     //       _currentIndex++;
//     //       // setState(() {});
//     //     }
//     //   } else {
//     //     print('reached to the location');
//     //     timer.cancel();
//     //   }
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final vehicleRepairRequest =
//     //     ref.watch(repairRequestControllerProvider).repairRequest;

//     // if (vehicleRepairRequest == null) {
//     //   return const Center(
//     //     child: CircularProgressIndicator(),
//     //   );
//     // }
//     // final mechanicInfoValue =
//     //     ref.watch(fetchTrackMechanicScreenMechanicInfoProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Track Mechanic'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AsyncValueWidget(
//                 value: mechanicInfoValue,
//                 data: (mechanic) => Column(
//                   children: [
//                     Text(
//                       'Mechanic: ${mechanic.firstName} ${mechanic.lastName}',
//                       style: const TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       'Mechanic Location: ${mechanic.currentLocationName ?? "Unknown".hardcoded()}',
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => FullScreenMapScreen(
//                               mechanicLocation: mechanic.currentLocationName ??
//                                   "Unknown".hardcoded(),
//                             ),
//                           ),
//                         );
//                       },
//                       child: SizedBox(
//                         // height: 400,
//                         height: _showBigScreenMap
//                             ? MediaQuery.of(context).size.height * 0.75
//                             : 400,

//                         child: mechanic.currentLocation != null
//                             ? ClipRRect(
//                                 borderRadius: BorderRadius.circular(20.0),
//                                 child: _showMechanicTrackMap(context),
//                               )
//                             : const Center(child: CircularProgressIndicator()),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.all(8),
//                     padding: const EdgeInsets.all(8),
//                     // height: 50,
//                     width: 75,
//                     decoration: BoxDecoration(
//                       color: Colors.amberAccent[200],
//                       borderRadius: BorderRadius.circular(
//                         20,
//                       ),
//                     ),
//                     child: Image.asset(
//                       'assets/images/parts/wheel.png',
//                     ),
//                   ),
//                   RichText(
//                     text: TextSpan(
//                       text: 'Estimated Arrival Time: ',
//                       style: const TextStyle(color: Colors.black),
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: formatMinutesToGeneric(ref
//                               .read(trackMechanicScreenControllerProvider
//                                   .notifier)
//                               .getEstimateArrivalTime()),
//                           style: const TextStyle(
//                             color: Colors.orange,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               const ListTile(
//                 title: Text(
//                   'Tire repair',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 subtitle: Text(
//                   'Tire repair and replacement',
//                   style: TextStyle(
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 16.0,
//                   vertical: 8.0,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Total Cost',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           'No parts included',
//                           style: TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       'Rs. 3000',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.orange,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 16.0,
//                   vertical: 8.0,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Advance Cost Paid',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       'Rs. 2000',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.orange,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 16.0,
//                   vertical: 8.0,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Remaining Cost',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       'Rs. 1000',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.orange,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // FlutterMap _showMechanicTrackMap(BuildContext context) {
//   Widget _showMechanicTrackMap(BuildContext context) {
//     LatLng cameraCenter = LatLng(27.703292452047425, 85.33033043146135);
//     final coordinatePointsValue = ref.watch(fetchTrackMechanicRouteProvider);
//     final mechanicPositionValue = ref.watch(watchMechanicPositionProvider);

//     return AsyncValueWidget(
//       value: mechanicPositionValue,
//       data: (mechanicPosition) => FlutterMap(
//         mapController: _mapController,
//         options: MapOptions(
//           onTap: (tapPosition, latLng) {
//             print('tapped');
//             setState(() {
//               _showBigScreenMap = true;
//             });
//           },
//           // onTap: (tapPosition, latLng) {
//           //   showDialog(
//           //     context: context,
//           //     builder: (BuildContext context) {
//           //       return AlertDialog(
//           //         insetPadding: EdgeInsets.zero,
//           //         contentPadding: EdgeInsets.zero,
//           //         content: SizedBox(
//           //             height: MediaQuery.of(context).size.height,
//           //             width: MediaQuery.of(context).size.width,
//           //             child: _showMechanicTrackMap(context)),
//           //       );
//           //     },
//           //   );
//           // },
//           center: cameraCenter,
//           zoom: 15.0,
//           bounds: LatLngBounds(LatLng(27.703292452047425, 85.33033043146135),
//               LatLng(27.707645262018172, 85.33825904130937)),
//         ),
//         nonRotatedChildren: [
//           ScaleLayerWidget(
//             options: ScaleLayerPluginOption(
//               lineColor: Colors.black,
//               lineWidth: 2,
//               textStyle: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 12,
//               ),
//               padding: const EdgeInsets.all(10),
//             ),
//           ),
//           FlutterMapControlButtons(
//             minZoom: 4,
//             maxZoom: 19,
//             mini: false,
//             padding: 10,
//             alignment: Alignment.bottomRight,
//             mapController: _mapController,
//             animationController: _animationController,
//           ),
//           CurrentLocationLayer(),
//           const RichAttributionWidget(
//             popupInitialDisplayDuration: Duration(seconds: 5),
//             animationConfig: ScaleRAWA(),
//             showFlutterMapAttribution: false,
//             attributions: [
//               TextSourceAttribution(
//                 'Full Screen Mode',
//                 prependCopyright: false,
//               ),
//               TextSourceAttribution(
//                 'Tap on the map to show full screen map',
//                 prependCopyright: false,
//               ),
//             ],
//           ),
//         ],
//         children: [
//           TileLayer(
//             urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//             userAgentPackageName: 'dev.fleaflet.flutter_map.example',
//             tileProvider: NetworkTileProvider(),
//           ),
//           MarkerLayer(
//             markers: [
//               Marker(
//                 width: 80,
//                 height: 80,
//                 point: LatLng(27.703292452047425, 85.33033043146135),
//                 builder: (ctx) => const Icon(
//                   Icons.location_on,
//                   color: Colors.orange,
//                   size: 40.0,
//                 ),
//               ),
//               Marker(
//                 width: 80,
//                 height: 80,
//                 point: LatLng(27.707645262018172, 85.33825904130937),
//                 builder: (ctx) => const Icon(
//                   Icons.location_on,
//                   color: Colors.purple,
//                   size: 40.0,
//                 ),
//               ),
//               // Marker(
//               //   width: 80,
//               //   height: 80,
//               //   // point: _currentPosition,
//               //   point: LatLng(
//               //       mechanicPosition.latitude, mechanicPosition.longitude),
//               //   builder: (ctx) => const Icon(
//               //     Icons.location_on,
//               //     color: Colors.red,
//               //     size: 40.0,
//               //   ),
//               // ),
//             ],
//           ),
//           AsyncValueWidget(
//               value: coordinatePointsValue,
//               data: (points) {
//                 List<LatLng> routeCoordinatePoints = points
//                     .map((point) =>
//                         LatLng(point[1].toDouble(), point[0].toDouble()))
//                     .toList()
//                     .cast<LatLng>();

//                 return PolylineLayer(
//                   polylines: [
//                     Polyline(
//                       points: routeCoordinatePoints,
//                       strokeWidth: 4,
//                       color: Colors.purple,
//                     ),
//                   ],
//                 );
//               })
//         ],
//       ),
//     );
//   }
// }

// class FullScreenMapScreen extends StatelessWidget {
//   final String mechanicLocation;

//   const FullScreenMapScreen({Key? key, required this.mechanicLocation})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Full Screen Map'),
//       ),
//       body: const Center(
//         child: Text(
//           'Full screen map goes here',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
