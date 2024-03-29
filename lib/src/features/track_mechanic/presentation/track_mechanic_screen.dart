// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:bato_mechanic/src/features/auth/application/auth_state.dart';
import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/api_repair_request_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/repair_request_repository.dart';
import 'package:bato_mechanic/src/features/services/application/service_type_service.dart';
import 'package:bato_mechanic/src/features/track_mechanic/presentation/waiting_mechanic_assignment_screen.dart';
import 'package:bato_mechanic/src/utils/extensions/enum_extensions.dart';
import 'package:bato_mechanic/src/utils/helpers/map_helpers.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/common/widgets/butons/esewa_button.dart';
import 'package:bato_mechanic/src/common/widgets/butons/khalti_button.dart';
import 'package:bato_mechanic/src/common/widgets/butons/pay_button.dart';
import 'package:bato_mechanic/src/common/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/features/payment/presentation/widgets/pay_bottom_sheet_widget.dart';
import 'package:bato_mechanic/src/features/auth/application/auth_service.dart';
import 'package:bato_mechanic/src/features/core/application/location_service.dart';
import 'package:bato_mechanic/src/features/core/application/mechanic_service.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/core/domain/user_position.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/repair_request_controller.dart';

import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/foramtters/date_formatter.dart';
import 'package:bato_mechanic/src/utils/helpers/toast_helper.dart';

import '../../../common/widgets/flutter_map/control_buttons/control_buttons.dart';
import '../../../common/widgets/flutter_map/scale_layer/scale_layer_plugin_option.dart';
import '../../auth/data/remote/fake_remote_auth_repository.dart';
import '../../auth/domain/user_back.dart';
import '../../repair_request/data/remote/repair_request_repository/fake_repair_request_repository.dart';
import '../data/api_track_mechanic_repository.dart';
import 'track_mechanic_screen_controller.dart';

class TrackMechanicScreen extends ConsumerStatefulWidget {
  const TrackMechanicScreen({
    Key? key,
    this.flipCardController,
    required this.repairRequestIdx,
  }) : super(key: key);

  final FlipCardController? flipCardController;
  final String repairRequestIdx;

  @override
  ConsumerState<TrackMechanicScreen> createState() =>
      _TrackMechanicScreenState();
}

class _TrackMechanicScreenState extends ConsumerState<TrackMechanicScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final double _animationValue = 0.0;
  bool _showBigScreenMap = false;
  late MapController _mapController;
  late AnimationController _animationController;

  // List<LatLng> pathPoints = [
  //   LatLng(27.703309, 85.330293),
  //   LatLng(27.703372, 85.330328),
  //   LatLng(27.703433, 85.3304),
  //   LatLng(27.703345, 85.331427),
  //   LatLng(27.7033, 85.331973),
  //   LatLng(27.70331, 85.332081),
  //   LatLng(27.703411, 85.332267),
  //   LatLng(27.703528, 85.332441),
  //   LatLng(27.703606, 85.332502),
  //   LatLng(27.703818, 85.332652),
  //   LatLng(27.703918, 85.332654),
  //   LatLng(27.703817, 85.332944),
  //   LatLng(27.703525, 85.333931),
  //   LatLng(27.703437, 85.334216),
  //   LatLng(27.703365, 85.334465),
  //   LatLng(27.703, 85.33565),
  //   LatLng(27.70294, 85.335815),
  //   LatLng(27.702783, 85.336285),
  //   LatLng(27.702876, 85.336324),
  //   LatLng(27.703198, 85.336223),
  //   LatLng(27.70327, 85.33621)
  // ];

  @override
  void initState() {
    super.initState();

    _mapController = MapController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    // int currentIndex = 0;

    // final timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
    //   if (mounted) {
    //     if (currentIndex < pathPoints.length - 1) {
    //       User? user = ref.read(authStateProvider).user;
    //       UserPosition? nextPosition = user?.currentLocation;
    //       // if (ref.read(watchMechanicStateChangesProvider).isLoading) {
    //       //   print('dd');
    //       //   return;
    //       // }
    //       if (nextPosition == null) {
    //         print('null');
    //         ref.read(repairRequestControllerProvider).repairRequest;
    //       } else {
    //         nextPosition = nextPosition.copyWith(
    //           latitude: pathPoints[currentIndex].latitude,
    //           longitude: pathPoints[currentIndex].longitude,
    //         );
    //         ref
    //             .read(authStateProvider.notifier)
    //             .setUser(user?.copyWith(currentLocation: nextPosition));

    //         currentIndex++;
    //       }
    //     } else {
    //       print('reached to the location');
    //       timer.cancel();
    //     }
    //   }
    // });

    // Register this object as an observer
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // // Get user location if not present
      // if (ref.read(authStateProvider).user?.currentLocation == null) {
      //   ref.read(locationServiceProvider).initializeUserLocation();
      // }

      // // Directly go to progress screen if the repair request is in progress
      // if (widget.repairRequest.status ==
      //     VehicleRepairRequestStatus.IN_PROGRESS) {
      //   if (mounted) {
      //     context.replaceNamed(APP_ROUTE.repairProgress.name);
      //   }
      // }
    });
  }

// Setting this variable because the notification is shown every time the screen is rebuilt
  bool _isFirstTime = true;

  @override
  Widget build(BuildContext context) {
    // ref.listen(watchRepairRequestStateChangesProvider, (previous, state) {
    //   if (!state.isRefreshing && state.hasValue) {
    //     if (_isFirstTime &&
    //         state.value != null &&
    //         state.value!.status ==
    //             VehicleRepairRequestStatus.WAITING_FOR_ADVANCE_PAYMENT) {
    //       ToastHelper.showNotificationWithCloseButton(
    //           context, "Please pay baato kharcha to continue the process");
    //       _isFirstTime = false;
    //     }
    //   }
    // });
    // AsyncValue<VehicleRepairRequest?> repairRequestValue =
    //     const AsyncValue.data(null);
    // if (ref.watch(activeRepairRequestProvider) != null) {
    //   repairRequestValue = ref.watch(fetchRepairRequestProvider(
    //       ref.read(activeRepairRequestProvider)!.idx));
    // } else {
    //   repairRequestValue =
    //       ref.watch(fetchRepairRequestProvider(widget.repairRequestIdx));
    // }

    final repairRequestValue =
        ref.watch(watchRepairRequestProvider(widget.repairRequestIdx));
    // final repairRequestValue =
    //     ref.watch(fetchRepairRequestProvider(widget.repairRequestIdx));

    // if (assignedMechanic == null &&
    //     repairRequestValue.value?.assignedMechanicIdx != null) {
    //   ref.read(mechanicServiceProvider).fetchAssignedMechanic(
    //       repairRequestValue.value!.assignedMechanicIdx!);
    // }
    final routeValue = ref.watch(fetchMechanicRouteProvider);

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return WillPopScope(
      onWillPop: () async {
        if (mounted) {
          if (widget.flipCardController != null) {
            widget.flipCardController!.toggleCard();
          }
        }
        return Future.value(false);
      },
      child: AsyncValueWidget(
          value: repairRequestValue,
          data: (repairRequest) {
            return Scaffold(
              appBar: AppBar(
                title: const Center(child: Text('Track Mechanic')),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          if (repairRequest.assignedMechanicIdx == null)
                            // Text('Waiting for mechanic'.hardcoded())
                            Text('')
                          else
                            AsyncValueWidget(
                              value: ref.watch(fetchMechanicInfoProvider(
                                  repairRequest.assignedMechanicIdx!)),
                              data: (assignedMechanic) => Column(
                                children: [
                                  TextButton(
                                    onPressed: () => context.pushNamed(
                                        APP_ROUTE.mechanicProfile.name,
                                        extra: {
                                          'mechanicIdx': assignedMechanic.idx
                                        }),
                                    style:
                                        Theme.of(context).textButtonTheme.style,
                                    child: Text(
                                      assignedMechanic.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              backgroundColor:
                                                  ThemeColor.transparent),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  AsyncValueWidget(
                                    value: ref.watch(
                                        watchRepairRequestMechanicLocationProvider(
                                            repairRequest.idx)),
                                    data: (location) => Text(
                                      location.locationName ??
                                          "Place: Unknown".hardcoded(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  AsyncValueWidget(
                                    value: ref.watch(
                                        watchRepairRequestMechanicLocationProvider(
                                            repairRequest.idx)),
                                    data: (location) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                FullScreenMapScreen(
                                              mechanicLocation: location
                                                      .locationName ??
                                                  'Place: Unknown'.hardcoded(),
                                            ),
                                          ),
                                        );
                                      },
                                      child: SizedBox(
                                        height: _showBigScreenMap
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.75
                                            : 400,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: _showMechanicTrackMap(
                                              context,
                                              routeValue.value?[
                                                      "routeCoordinates"] ??
                                                  []),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (repairRequest.status ==
                          VehicleRepairRequestStatus.WAITING_FOR_MECHANIC)
                        AsyncValueWidget(
                          value: ref.watch(fetchRepairRequestServiceProvider(
                              repairRequest.idx)),
                          data: (service) => Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(8),
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.amberAccent[200],
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                                child: service.icon != null
                                    ? Icon(service.icon)
                                    : Image.asset(
                                        'assets/images/parts/wheel.png',
                                      ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Estimated Arrival Time: '.hardcoded(),
                                  style: const TextStyle().copyWith(
                                    color: isDarkTheme
                                        ? ThemeColor.white
                                        : ThemeColor.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      // text: BaatoDateFormatter
                                      //     .formatMinutesToGeneric(ref
                                      //         .read(
                                      //             trackMechanicScreenControllerProvider
                                      //                 .notifier)
                                      //         .getEstimateArrivalTime()),
                                      text: BaatoDateFormatter
                                          .formatSecondsToGeneric(
                                              routeValue.value?["duration"] ??
                                                  -1),
                                      style: const TextStyle(
                                        color: ThemeColor.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ListTile(
                        title: Text(
                          repairRequest.title ?? "No title provided",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        subtitle: Text(
                          repairRequest.description ??
                              "No description provided",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Status",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                repairRequest.status.humanizeName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColor.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mechanic baato karcha',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Khaana included',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Text(
                                'Rs. 3000',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColor.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (repairRequest.advancePaymentStatus ==
                          AdvancePaymentStatus.PAYMENT_ON_ARRIVAL)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Baato Kharcha",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  repairRequest
                                      .advancePaymentStatus.humanizeName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeColor.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(
                        height: AppHeight.h12,
                      ),
                      if (repairRequest.status ==
                          VehicleRepairRequestStatus
                              .WAITING_FOR_ADVANCE_PAYMENT)
                        ..._buildBaatoKharcha(context, repairRequest.idx)
                      else if (repairRequest.status ==
                          VehicleRepairRequestStatus.COMPLETE)
                        SubmitButton(
                          showSpinner: false,
                          label: 'Review Mechanic'.hardcoded(),
                          onPressed: () => context
                              .pushNamed(APP_ROUTE.reviewMechanic.name, extra: {
                            "repairRequestIdx": repairRequest.idx,
                            "mechanicIdx": repairRequest.assignedMechanicIdx,
                          }),
                        )
                      else if (repairRequest.status ==
                              VehicleRepairRequestStatus.PENDING ||
                          repairRequest.status ==
                              VehicleRepairRequestStatus.WAITING_FOR_MECHANIC)
                        Container()
                      else
                        SubmitButton(
                          label: 'Check Progress'.hardcoded(),
                          onPressed: () => context.pushNamed(
                              APP_ROUTE.repairProgress.name,
                              extra: {"repairRequestIdx": repairRequest.idx}),
                        )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  List<Widget> _buildBaatoKharcha(
      BuildContext context, String repairRequestIdx) {
    return [
      Text(
        'Please pay baato kharcha to continue the process',
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: ThemeColor.error,
              fontStyle: FontStyle.italic,
            ),
      ),
      PayButton(
          label: "Pay baato kharcha",
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: ThemeColor.transparent,
              context: context,
              builder: (context) => PayBottomSheetWidget(
                children: [
                  KhaltiButton(
                    onPressed: () async {
                      // final result = await ref
                      //     .read(trackMechanicScreenControllerProvider.notifier)
                      //     .payWithKhalti();
                      Navigator.of(context).pop();
                      // if (result) {
                      //   context.pushNamed(APP_ROUTE.repairProgress.name);
                      // } else {
                      //   ToastHelper.showNotificationWithCloseButton(
                      //       context, "Something went wrong, please try again");
                      // }
                    },
                  ),
                  EsewaButton(
                    onPressed: () async {
                      context.goNamed(APP_ROUTE.repairProgress.name);
                      // final result = await ref
                      //     .read(trackMechanicScreenControllerProvider.notifier)
                      //     .payWithEsewa();
                      // Navigator.of(context).pop();
                      // if (result) {
                      //   context.pushNamed(appRoute.repairProgress.name);
                      // } else {
                      //   ToastHelper.showNotificationWithCloseButton(
                      //       context, "Something went wrong, please try again");
                      // }
                    },
                  ),
                  PayButton(
                    label: 'Cash on arrival'.hardcoded(),
                    buttonColor: Theme.of(context).primaryColor,
                    shouldShowSpinner: true,
                    onPressed: () async {
                      // Capture the context before the async operation
                      final BuildContext currentContext = context;

                      bool updated = await ref
                          .read(trackMechanicScreenControllerProvider.notifier)
                          .setAdvancePaymentOnArrival(repairRequestIdx);

                      if (updated) {
                        // Use the captured context within the async block
                        Navigator.of(currentContext).pop();

                        ToastHelper.showNotification(
                          currentContext,
                          "Mechanic is on the way".hardcoded(),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          }),
    ];
  }

  Widget _showMechanicTrackMap(
      BuildContext context, List<LatLng> routeCoordinates) {
    LatLng cameraCenter = LatLng(27.703292452047425, 85.33033043146135);
    final mechanicPositionValue = ref.watch(assignedMechanicProvider);
    // final userMarkerValue = ref.watch(watchUserPositionMarkerProvider);
    final mechanicLocationValue = ref.watch(
        watchRepairRequestMechanicLocationProvider(widget.repairRequestIdx));

    final userCurrentLocation = ref.watch(userCurrentLocationProvider);

    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        onTap: (tapPosition, latLng) {
          setState(() {
            _showBigScreenMap = !_showBigScreenMap;
          });
        },
        // onTap: (tapPosition, latLng) {
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         insetPadding: EdgeInsets.zero,
        //         contentPadding: EdgeInsets.zero,
        //         content: SizedBox(
        //             height: MediaQuery.of(context).size.height,
        //             width: MediaQuery.of(context).size.width,
        //             child: _showMechanicTrackMap(context)),
        //       );
        //     },
        //   );
        // },
        center: cameraCenter,
        zoom: 15.0,
        bounds: LatLngBounds(LatLng(27.703292452047425, 85.33033043146135),
            LatLng(27.707645262018172, 85.33825904130937)),
      ),
      nonRotatedChildren: [
        ScaleLayerWidget(
          options: ScaleLayerPluginOption(
            lineColor: Colors.black,
            lineWidth: 2,
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
            padding: const EdgeInsets.all(10),
          ),
        ),
        FlutterMapControlButtons(
          minZoom: 4,
          maxZoom: 19,
          mini: false,
          padding: 10,
          alignment: Alignment.bottomRight,
          mapController: _mapController,
          animationController: _animationController,
        ),
        const RichAttributionWidget(
          popupInitialDisplayDuration: Duration(seconds: 5),
          animationConfig: ScaleRAWA(),
          showFlutterMapAttribution: false,
          attributions: [
            TextSourceAttribution(
              'Full Screen Mode',
              prependCopyright: false,
            ),
            TextSourceAttribution(
              'Tap on the map to show full screen map',
              prependCopyright: false,
            ),
          ],
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          tileProvider: NetworkTileProvider(),
        ),
        CurrentLocationLayer(),
        AsyncValueWidget(
          value: mechanicLocationValue,
          data: (mechanicLocation) => MarkerLayer(
            markers: [
              Marker(
                width: 80,
                height: 80,
                point: LatLng(
                  ref
                          .watch(watchRepairRequestProvider(
                              widget.repairRequestIdx))
                          .value
                          ?.location?["latitude"] ??
                      0,
                  ref
                          .watch(watchRepairRequestProvider(
                              widget.repairRequestIdx))
                          .value
                          ?.location?["longitude"] ??
                      0,
                ),
                builder: (ctx) => const Icon(
                  Icons.location_on,
                  color: Colors.orange,
                  size: 40.0,
                ),
              ),
              Marker(
                width: 80,
                height: 80,
                point: LatLng(
                  userCurrentLocation.value?.latitude ?? 0,
                  userCurrentLocation.value?.longitude ?? 0,
                ),
                builder: (ctx) => const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40.0,
                ),
              ),
              Marker(
                width: 80,
                height: 80,
                point: LatLng(
                  mechanicLocation.latitude ?? 0,
                  mechanicLocation.longitude ?? 0,
                ),
                builder: (ctx) => const Icon(
                  Icons.location_on,
                  color: Colors.green,
                  size: 40.0,
                ),
              ),
            ],
          ),
        ),
        // AsyncValueWidget(
        //     value: routeCoordinates,
        //     data: (routeCoordinatePoints) {
        //       // data: (points) {
        //       // List<LatLng> routeCoordinatePoints = points
        //       //     .map((point) =>
        //       //         LatLng(point[1].toDouble(), point[0].toDouble()))
        //       //     .toList()
        //       //     .cast<LatLng>();

        //       return PolylineLayer(
        //         polylines: [
        //           Polyline(
        //             points: routeCoordinates,
        //             strokeWidth: 4,
        //             color: Colors.purple,
        //           ),
        //         ],
        //       );
        //     })
        PolylineLayer(
          polylines: [
            Polyline(
              points: routeCoordinates,
              strokeWidth: 4,
              color: Colors.purple,
            ),
          ],
        ),
      ],
    );
  }
}

class FullScreenMapScreen extends StatelessWidget {
  final String mechanicLocation;

  const FullScreenMapScreen({Key? key, required this.mechanicLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Map'),
      ),
      body: const Center(
        child: Text(
          'Full screen map goes here',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
