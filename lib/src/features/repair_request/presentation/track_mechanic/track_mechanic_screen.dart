import 'dart:async';

import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/common/widgets/billing_info_widget.dart';
import 'package:bato_mechanic/src/common/widgets/pay_bottom_sheet_widget.dart';
import 'package:bato_mechanic/src/common/widgets/butons/esewa_button.dart';
import 'package:bato_mechanic/src/common/widgets/butons/khalti_button.dart';
import 'package:bato_mechanic/src/common/widgets/butons/pay_button.dart';
import 'package:bato_mechanic/src/common/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/core/application/user_service.dart';
import 'package:bato_mechanic/src/features/repair_request/application/location_service.dart';
import 'package:bato_mechanic/src/features/repair_request/application/mechanic_service.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/user_position.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/repair_request_controller.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/request_mechanic_screen_controller.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/search_map/search_map_widget_controller.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/track_mechanic/track_mechanic_screen_controller.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/foramtters/date_formatter.dart';
import 'package:bato_mechanic/src/utils/helpers/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../../common/widgets/flutter_map/control_buttons/control_buttons.dart';
import '../../../../common/widgets/flutter_map/scale_layer/scale_layer_plugin_option.dart';
import '../../../auth/domain/user.dart';

class TrackMechanicScreen extends ConsumerStatefulWidget {
  const TrackMechanicScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<TrackMechanicScreen> createState() =>
      _TrackMechanicScreenState();
}

class _TrackMechanicScreenState extends ConsumerState<TrackMechanicScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  double _animationValue = 0.0;
  bool _showBigScreenMap = false;
  late MapController _mapController;
  late AnimationController _animationController;

  List<LatLng> pathPoints = [
    LatLng(27.703309, 85.330293),
    LatLng(27.703372, 85.330328),
    LatLng(27.703433, 85.3304),
    LatLng(27.703345, 85.331427),
    LatLng(27.7033, 85.331973),
    LatLng(27.70331, 85.332081),
    LatLng(27.703411, 85.332267),
    LatLng(27.703528, 85.332441),
    LatLng(27.703606, 85.332502),
    LatLng(27.703818, 85.332652),
    LatLng(27.703918, 85.332654),
    LatLng(27.703817, 85.332944),
    LatLng(27.703525, 85.333931),
    LatLng(27.703437, 85.334216),
    LatLng(27.703365, 85.334465),
    LatLng(27.703, 85.33565),
    LatLng(27.70294, 85.335815),
    LatLng(27.702783, 85.336285),
    LatLng(27.702876, 85.336324),
    LatLng(27.703198, 85.336223),
    LatLng(27.70327, 85.33621)
  ];

  @override
  void initState() {
    super.initState();

    _mapController = MapController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    int _currentIndex = 0;

    ref.read(repairRequestServiceProvider).fetchUserRepairRequests('1');

    final timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (mounted) {
        if (_currentIndex < pathPoints.length - 1) {
          User? user = ref.read(userServiceProvider).currentUser;
          UserPosition? nextPosition = user?.currentLocation;
          if (ref.read(watchMechanicStateChangesProvider).isLoading) {
            print('dd');
            return;
          }
          if (nextPosition == null) {
            print('null');
            ref.read(repairRequestControllerProvider).repairRequest;
          } else {
            nextPosition = nextPosition.copyWith(
              latitude: pathPoints[_currentIndex].latitude,
              longitude: pathPoints[_currentIndex].longitude,
            );

            // ref
            //     .read(trackMechanicScreenControllerProvider.notifier)
            //     .setMarkerPosition(nextPosition);
            ref
                .read(userServiceProvider)
                .setCurrentUser(user?.copyWith(currentLocation: nextPosition));

            _currentIndex++;
          }
        } else {
          print('reached to the location');
          timer.cancel();
        }
      }
    });

    // Register this object as an observer
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Get user location if not present
      if (ref.read(userServiceProvider).currentUser?.currentLocation == null) {
        ref.read(locationServiceProvider).initializeUserLocation();
      }
    });
  }

// Setting this variable because the notification is shown every time the screen is rebuilt
  bool _isFirstTime = true;

  @override
  Widget build(BuildContext context) {
    ref.listen(watchRepairRequestStateChangesProvider, (previous, state) {
      if (!state.isRefreshing && state.hasValue) {
        if (_isFirstTime &&
            state.value != null &&
            state.value!.status ==
                VehicleRepairRequestStatus.WAITING_FOR_ADVANCE_PAYMENT) {
          ToastHelper.showNotificationWithCloseButton(
              context, "Please pay baato kharcha to continue the process");
          _isFirstTime = false;
        }
      }
    });

    final repairRequestValue =
        ref.watch(watchRepairRequestStateChangesProvider);

    final assignedMechanic = ref.watch(watchMechanicStateChangesProvider).value;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return AsyncValueWidget(
        value: repairRequestValue,
        data: (repairRequest) {
          if (repairRequest == null) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator.adaptive()),
            );
          }

          if (assignedMechanic == null) {
            ref.read(mechanicServiceProvider).fetchAssignedMechanic(
                repairRequest.assignedMechanicId.toString());
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Track Mechanic'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        assignedMechanic == null
                            ? const CircularProgressIndicator.adaptive()
                            : Text(
                                assignedMechanic.name,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        const SizedBox(height: 4),
                        assignedMechanic == null
                            ? const CircularProgressIndicator.adaptive()
                            : Text(
                                'Mechanic Location: ${assignedMechanic.currentLocation!.locationName}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FullScreenMapScreen(
                                  mechanicLocation: assignedMechanic!
                                          .currentLocation!.locationName ??
                                      'Unknown',
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: _showBigScreenMap
                                ? MediaQuery.of(context).size.height * 0.75
                                : 400,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: _showMechanicTrackMap(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          width: 75,
                          decoration: BoxDecoration(
                            color: Colors.amberAccent[200],
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/parts/wheel.png',
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Estimated Arrival Time: ',
                            style: const TextStyle().copyWith(
                              color: isDarkTheme
                                  ? ThemeColor.white
                                  : ThemeColor.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: BaatoDateFormatter.formatMinutesToGeneric(
                                    ref
                                        .read(
                                            trackMechanicScreenControllerProvider
                                                .notifier)
                                        .getEstimateArrivalTime()),
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
                    ListTile(
                      title: Text(
                        repairRequest.title ?? "",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      subtitle: Text(
                        repairRequest.description ?? "No description provided",
                        // style: TextStyle().copyWith(
                        //   fontSize: 14,
                        // ),
                        style: Theme.of(context).textTheme.bodyMedium,
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
                          Column(
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
                          Text(
                            'Rs. 3000',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ThemeColor.primary,
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
                                .WAITING_FOR_ADVANCE_PAYMENT ||
                        repairRequest.status ==
                            VehicleRepairRequestStatus.WAITING_FOR_MECHANIC)
                      ..._buildBaatoKharcha(context)
                    else
                      SubmitButton(
                          label: 'Check Progress'.hardcoded(),
                          onPressed: () =>
                              context.pushNamed(appRoute.repairProgress.name))
                  ],
                ),
              ),
            ),
          );
        });
  }

  List<Widget> _buildBaatoKharcha(BuildContext context) {
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
                      final result = await ref
                          .read(trackMechanicScreenControllerProvider.notifier)
                          .payWithKhalti();
                      Navigator.of(context).pop();
                      if (result) {
                        context.pushNamed(appRoute.repairProgress.name);
                      } else {
                        ToastHelper.showNotificationWithCloseButton(
                            context, "Something went wrong, please try again");
                      }
                    },
                  ),
                  EsewaButton(
                    onPressed: () async {
                      context.goNamed(appRoute.repairProgress.name);
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
                ],
              ),
            );
          }),
    ];
  }

  Widget _showMechanicTrackMap(BuildContext context) {
    LatLng cameraCenter = LatLng(27.703292452047425, 85.33033043146135);
    final coordinatePointsValue = ref.watch(fetchTrackMechanicRouteProvider);
    final mechanicPositionValue = ref.watch(watchMechanicStateChangesProvider);
    // final userMarkerValue = ref.watch(watchUserPositionMarkerProvider);
    return AsyncValueWidget(
      value: mechanicPositionValue,
      data: (mechanicPosition) => FlutterMap(
        mapController: _mapController,
        options: MapOptions(
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
          // if (userMarkerValue.value != null)
          //   CurrentLocationLayer(
          //     positionStream: userMarkerValue as Stream<LocationMarkerPosition>,
          //   ),
          // CurrentLocationLayer(),
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
          MarkerLayer(
            markers: [
              Marker(
                width: 80,
                height: 80,
                point: LatLng(27.703292452047425, 85.33033043146135),
                builder: (ctx) => const Icon(
                  Icons.location_on,
                  color: Colors.orange,
                  size: 40.0,
                ),
              ),
              Marker(
                width: 80,
                height: 80,
                point: LatLng(27.707645262018172, 85.33825904130937),
                builder: (ctx) => const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40.0,
                ),
              ),
              // AsyncValueWidget(value: ref.watch(watchUserStateChangesProvider) , data: data)
              if (ref.watch(watchUserStateChangesProvider).value != null &&
                  ref
                          .watch(watchUserStateChangesProvider)
                          .value!
                          .currentLocation !=
                      null)
                Marker(
                  width: 80,
                  height: 80,
                  point: LatLng(
                      ref
                          .watch(watchUserStateChangesProvider)
                          .value!
                          .currentLocation!
                          .latitude,
                      ref
                          .watch(watchUserStateChangesProvider)
                          .value!
                          .currentLocation!
                          .longitude),
                  builder: (ctx) => const Icon(
                    Icons.location_on,
                    color: Colors.green,
                    size: 40.0,
                  ),
                ),
            ],
          ),
          AsyncValueWidget(
              value: coordinatePointsValue,
              data: (points) {
                List<LatLng> routeCoordinatePoints = points
                    .map((point) =>
                        LatLng(point[1].toDouble(), point[0].toDouble()))
                    .toList()
                    .cast<LatLng>();

                return PolylineLayer(
                  polylines: [
                    Polyline(
                      points: routeCoordinatePoints,
                      strokeWidth: 4,
                      // color: Theme.of(context).primaryColor,
                      color: Colors.purple,
                    ),
                  ],
                );
              })
        ],
      ),
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
