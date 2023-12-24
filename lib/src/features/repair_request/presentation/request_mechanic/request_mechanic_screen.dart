import 'dart:io';

import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/async_value_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';

import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';

import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/request_mechanic_screen_controller.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/helpers/helper_functions.dart';
import 'package:bato_mechanic/src/utils/system_alerts_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../../common/widgets/form_fields/description_field.dart';
import '../../../../utils/helpers/toast_helper.dart';

import '../../../search_map/presentation/widget/map_search_widget.dart';

class RequestMechanicScreen extends ConsumerStatefulWidget {
  const RequestMechanicScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RequestMechanicScreen> createState() =>
      _RequestMechanicScreenState();
}

class _RequestMechanicScreenState extends ConsumerState<RequestMechanicScreen>
    with WidgetsBindingObserver {
  late TextEditingController _issueTextController;
  late FocusNode _issueTextFocusNode;
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    _issueTextController = TextEditingController();
    _issueTextFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _issueTextController.dispose();
    _issueTextFocusNode.dispose();
    super.dispose();
  }

  Future<void> _pickVideo() async {
    try {
      final XFile? video =
          await ImagePicker().pickVideo(source: ImageSource.gallery);
      if (video != null) {
        _videoController = VideoPlayerController.file(File(video.path));
        await _videoController!.initialize();
        ref
            .read(requestMechanicScreenControllerProvider.notifier)
            .setVideo(video);
      }
    } catch (exp) {
      // catch the image picker is already active exception

      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(requestMechanicScreenControllerProvider,
        (previousState, state) => state.value.showError(context));

    final recommendedMechanics = ref.watch(fetchRecommendedMechanicsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Mechanic'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Provide your location:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: const MapSearchWidget(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Describe the issue:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              DescriptionField(
                controller: _issueTextController,
                focusNode: _issueTextFocusNode,
                hintText: 'Describe the issue',
              ),
              const SizedBox(height: 16),
              const Text(
                'Attach photos:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: ref
                        .read(requestMechanicScreenControllerProvider.notifier)
                        .pickImages,
                    child: Text(
                      'Add Photos',
                      style: const TextStyle().copyWith(color: ThemeColor.dark),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: (ref
                                .watch(requestMechanicScreenControllerProvider)
                                .selectedImages
                                .value as List<File>)
                            .map((File image) {
                          return Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.file(
                                      image,
                                      width: 100,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -10,
                                  right: -10,
                                  child: IconButton(
                                    style: Theme.of(context)
                                        .iconButtonTheme
                                        .style!
                                        .copyWith(
                                          backgroundColor:
                                              const MaterialStatePropertyAll<Color>(
                                                  ThemeColor.transparent),
                                        ),
                                    onPressed: () => ref
                                        .read(
                                            requestMechanicScreenControllerProvider
                                                .notifier)
                                        .removeSelectedImage(image),
                                    icon: const Icon(
                                      Icons.cancel,
                                      // color: Colors.amberAccent[200],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Attach a video:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Builder(builder: (context) {
              //   return ElevatedButton(
              //     onPressed: _pickVideo,
              //     child: _videoController != null
              //         ? const Text('Change Video')
              //         : const Text('Add Video'),
              //   );
              // }),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _pickVideo,
                    child: _videoController != null
                        ? Text(
                            'Change Video',
                            style: const TextStyle().copyWith(color: ThemeColor.dark),
                          )
                        : Text(
                            'Add Video',
                            style: const TextStyle().copyWith(color: ThemeColor.dark),
                          ),
                  ),
                  if (_videoController != null)
                    Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p12),
                      child: Align(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth:
                                  HelperFunctions.screenWidth(context) * 0.5,
                              maxHeight:
                                  HelperFunctions.screenHeight(context) * 0.2,
                            ),
                            child: AspectRatio(
                              aspectRatio: _videoController!.value.aspectRatio,
                              child: VideoPlayer(_videoController!),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 16),

              AsyncValueWidget(
                value: recommendedMechanics,
                data: (recommendedMechanics) => recommendedMechanics.isEmpty
                    ? Text(
                        "No Mechanics".hardcoded(),
                      )
                    : Column(
                        children: [
                          const Text(
                            'Select prefered mechanic',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 130.0.doubleHardcoded(),
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: recommendedMechanics.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () => ref
                                    .read(
                                        requestMechanicScreenControllerProvider
                                            .notifier)
                                    .setPreferredMechanic(
                                        recommendedMechanics[index]),
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.amberAccent[200],
                                    border: ref
                                                .watch(
                                                    requestMechanicScreenControllerProvider)
                                                .preferredMechanic
                                                .value !=
                                            null
                                        ? ref
                                                    .watch(
                                                        requestMechanicScreenControllerProvider)
                                                    .preferredMechanic
                                                    .value ==
                                                recommendedMechanics[index]
                                            ? Border.all(
                                                color: Colors.blue,
                                                width: 2,
                                              )
                                            : null
                                        : null,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: SizedBox(
                                    width: 130,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          // child: Image.asset(
                                          //   'assets/images/no-profile.png',
                                          // ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 4,
                                            ),
                                            // child: Image.network(
                                            //   requestMechanicViewModel
                                            //       .recommendedMechanics[index].image,
                                            // ),
                                            child: Image.asset(
                                              'assets/images/no-profile.png'
                                                  .hardcoded(),
                                            ),
                                          ),
                                        ),
                                        // const SizedBox(height: 8),
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                // recommendedMechanics[index].averageRating,
                                                '4.5',
                                                // requestMechanicViewModel
                                                //     .recommendedMechanics[index]
                                                //     .averageRating
                                                //     .toString(),
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 18,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(systemAlertProvider.notifier)
                      .showLoadingWithMessageOptional(context);
                  ref
                      .read(requestMechanicScreenControllerProvider.notifier)
                      .requestForVehicleRepair(
                          _issueTextController.text, _videoController)
                      .then((result) {
                    if (result) {
                      ref
                          .read(systemAlertProvider.notifier)
                          .closeLoading(context);
                      ToastHelper.showNotification(
                        context,
                        'Request has been sent successfully',
                        notificationDuration: 2,
                      );
                      ref
                          .read(systemAlertProvider.notifier)
                          .closeLoading(context);
                      context.goNamed(APP_ROUTE.trackMechanic.name);
                      return;
                    } else {
                      ref
                          .read(systemAlertProvider.notifier)
                          .closeLoading(context);
                      // ToastHelper.showNotification(
                      //   context,
                      //   'Something went wrong'.hardcoded(),
                      //   notificationDuration: 2,
                      // );
                    }
                  });
                },
                child: Text(
                  'Request for a mechanic',
                  style: const TextStyle().copyWith(color: ThemeColor.dark),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// -------------------------------------- Map integration using google maps starts here -------------------------------------------

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class RequestMechanicScreen extends StatefulWidget {
//   @override
//   _RequestMechanicScreenState createState() => _RequestMechanicScreenState();
// }

// class _RequestMechanicScreenState extends State<RequestMechanicScreen> {
//   final Completer<GoogleMapController> _controller = Completer();

//   static const LatLng sourceLocation = LatLng(37.3300926, -122.03272188);
//   static const LatLng destination = LatLng(37.33429383, -122.06600055);

//   List<LatLng> polylineCoordinates = [];

//   void getPolyPoints() async {
//     PolylinePoints polylinePoints = PolylinePoints();
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       'AIzaSyCtV10-IveVc0T2kd1WKL2zFtKUkEKbsN8',
//       PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
//       PointLatLng(destination.latitude, destination.longitude),
//     );

//     if (result.points.isNotEmpty) {
//       result.points.forEach(
//         (PointLatLng point) =>
//             polylineCoordinates.add(LatLng(point.latitude, point.longitude)),
//       );
//       print(polylineCoordinates);
//       setState(() {});
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getPolyPoints();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Appbar'),
//       ),
//       body: GoogleMap(
//         polylines: {
//           Polyline(
//             polylineId: PolylineId("route"),
//             points: polylineCoordinates,
//             color: Colors.black,
//             width: 6,
//           ),
//         },
//         initialCameraPosition: CameraPosition(
//           target: sourceLocation,
//           zoom: 13.5,
//         ),
//         markers: {
//           Marker(
//             markerId: MarkerId("source"),
//             position: sourceLocation,
//           ),
//           Marker(
//             markerId: MarkerId("destination"),
//             position: destination,
//           ),
//         },
//       ),
//     );
//   }
// }

// -------------------------------------- Map integration using google maps ends here -------------------------------------------

// import 'package:flutter/material.dart';

// class RequestMechanicScreen extends StatefulWidget {
//   const RequestMechanicScreen({super.key});

//   @override
//   State<RequestMechanicScreen> createState() => _RequestMechanicScreenState();
// }

// class _RequestMechanicScreenState extends State<RequestMechanicScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Appbar'),
//       ),
//     );
//   }
// }

// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_map/flutter_map.dart';

// class RequestMechanicScreen extends StatefulWidget {
//   static const String route = '/';

//   const RequestMechanicScreen({Key? key}) : super(key: key);

//   @override
//   State<RequestMechanicScreen> createState() => _RequestMechanicScreenState();
// }

// class _RequestMechanicScreenState extends State<RequestMechanicScreen> {
//   // @override
//   // void initState() {
//   //   super.initState();

//   //   const seenIntroBoxKey = 'seenIntroBox(a)';
//   //   if (kIsWeb && Uri.base.host.trim() == 'demo.fleaflet.dev') {
//   //     SchedulerBinding.instance.addPostFrameCallback(
//   //       (_) async {
//   //         final prefs = await SharedPreferences.getInstance();
//   //         if (prefs.getBool(seenIntroBoxKey) ?? false) return;

//   //         if (!mounted) return;

//   //         final width = MediaQuery.of(context).size.width;
//   //         await showDialog<void>(
//   //           context: context,
//   //           builder: (context) => AlertDialog(
//   //             icon: UnconstrainedBox(
//   //               child: SizedBox.square(
//   //                 dimension: 64,
//   //                 child:
//   //                     Image.asset('assets/ProjectIcon.png', fit: BoxFit.fill),
//   //               ),
//   //             ),
//   //             title: const Text('flutter_map Live Web Demo'),
//   //             content: ConstrainedBox(
//   //               constraints: BoxConstraints(
//   //                 maxWidth: width < 750
//   //                     ? double.infinity
//   //                     : (width / (width < 1100 ? 1.5 : 2.5)),
//   //               ),
//   //               child: Column(
//   //                 mainAxisSize: MainAxisSize.min,
//   //                 children: [
//   //                   const Text(
//   //                     "This is built automatically off of the latest commits to 'master', so may not reflect the latest release available on pub.dev.\nThis is hosted on Firebase Hosting, meaning there's limited bandwidth to share between all users, so please keep loads to a minimum.",
//   //                     textAlign: TextAlign.center,
//   //                   ),
//   //                   Padding(
//   //                     padding:
//   //                         const EdgeInsets.only(right: 8, top: 16, bottom: 4),
//   //                     child: Align(
//   //                       alignment: Alignment.centerRight,
//   //                       child: Text(
//   //                         "This won't be shown again",
//   //                         style: TextStyle(
//   //                           color: Theme.of(context)
//   //                               .colorScheme
//   //                               .inverseSurface
//   //                               .withOpacity(0.5),
//   //                         ),
//   //                         textAlign: TextAlign.right,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                 ],
//   //               ),
//   //             ),
//   //             actions: [
//   //               TextButton.icon(
//   //                 onPressed: () => Navigator.of(context).pop(),
//   //                 label: const Text('OK'),
//   //                 icon: const Icon(Icons.done),
//   //               ),
//   //             ],
//   //             contentPadding: const EdgeInsets.only(
//   //               left: 24,
//   //               top: 16,
//   //               bottom: 0,
//   //               right: 24,
//   //             ),
//   //           ),
//   //         );
//   //         await prefs.setBool(seenIntroBoxKey, true);
//   //       },
//   //     );
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home')),
//       body: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(top: 8, bottom: 8),
//               child: Text('This is a map that is showing (51.5, -0.9).'),
//             ),
//             Flexible(
//               child: FlutterMap(
//                 options: MapOptions(
//                   center: const LatLng(51.5, -0.09),
//                   zoom: 5,
//                   maxBounds: LatLngBounds(
//                     const LatLng(-90, -180),
//                     const LatLng(90, 180),
//                   ),
//                 ),
//                 nonRotatedChildren: [
//                   RichAttributionWidget(
//                     popupInitialDisplayDuration: const Duration(seconds: 5),
//                     animationConfig: const ScaleRAWA(),
//                     attributions: [
//                       TextSourceAttribution(
//                         'OpenStreetMap contributors',
//                         // onTap: () => launchUrl(
//                         //   Uri.parse('https://openstreetmap.org/copyright'),
//                         // ),
//                       ),
//                       const TextSourceAttribution(
//                         'This attribution is the same throughout this app, except where otherwise specified',
//                         prependCopyright: false,
//                       ),
//                     ],
//                   ),
//                 ],
//                 children: [
//                   TileLayer(
//                     urlTemplate:
//                         'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                     userAgentPackageName: 'dev.fleaflet.flutter_map.example',
//                   ),
//                   MarkerLayer(
//                     markers: [
//                       Marker(
//                         width: 80,
//                         height: 80,
//                         point: const LatLng(51.5, -0.09),
//                         builder: (ctx) => const FlutterLogo(
//                           textColor: Colors.blue,
//                           key: ObjectKey(Colors.blue),
//                         ),
//                       ),
//                       Marker(
//                         width: 80,
//                         height: 80,
//                         point: const LatLng(53.3498, -6.2603),
//                         builder: (ctx) => const FlutterLogo(
//                           textColor: Colors.green,
//                           key: ObjectKey(Colors.green),
//                         ),
//                       ),
//                       Marker(
//                         width: 80,
//                         height: 80,
//                         point: const LatLng(48.8566, 2.3522),
//                         builder: (ctx) => const FlutterLogo(
//                           textColor: Colors.purple,
//                           key: ObjectKey(Colors.purple),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
