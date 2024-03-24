import 'package:bato_mechanic/src/features/repair_progress/presentation/widgets/repair_steps_widget.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/shared/providers/location_service.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/build_context_extensions.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/enum_extensions.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import 'package:bato_mechanic/src/shared/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/shared/widgets/butons/esewa_button.dart';
import 'package:bato_mechanic/src/shared/widgets/butons/khalti_button.dart';
import 'package:bato_mechanic/src/shared/widgets/butons/pay_button.dart';
import 'package:bato_mechanic/src/shared/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/features/payment/presentation/widgets/pay_bottom_sheet_widget.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';

import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/shared/utils/foramtters/date_formatter.dart';
import 'package:bato_mechanic/src/shared/utils/helpers/toast_helper.dart';

import '../../../../shared/application/mechanic_service.dart';
import '../../../../shared/repositories/mechanic_repository/mechanic_repository.dart';
import '../../../../shared/widgets/flutter_map/control_buttons/control_buttons.dart';
import '../../../../shared/widgets/flutter_map/scale_layer/scale_layer_plugin_option.dart';
import '../../../services/data/service_type_repository.dart';
import '../../data/api_track_mechanic_repository.dart';
import 'repair_progress_screen_controller.dart';

class RepairProgressScreen extends ConsumerStatefulWidget {
  const RepairProgressScreen({
    Key? key,
    this.flipCardController,
    required this.repairRequestIdx,
  }) : super(key: key);

  final FlipCardController? flipCardController;
  final String repairRequestIdx;

  @override
  ConsumerState<RepairProgressScreen> createState() =>
      _RepairProgressScreenState();
}

class _RepairProgressScreenState extends ConsumerState<RepairProgressScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  bool _showBigScreenMap = false;
  late MapController _mapController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _mapController = MapController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

// Setting this variable because the notification is shown every time the screen is rebuilt
  // final bool _isFirstTime = true;

  @override
  void dispose() {
    _mapController.dispose();
    _animationController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

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

    final repairRequestValue =
        ref.watch(watchRepairRequestProvider(widget.repairRequestIdx));

    final routeValue = ref.watch(fetchMechanicRouteProvider);

    return AsyncValueWidget(
        value: repairRequestValue,
        data: (repairRequest) {
          return Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('Track Mechanic')),
            ),
            body: RefreshIndicator(
              onRefresh: () => ref.refresh(
                  watchRepairRequestProvider(widget.repairRequestIdx).future),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          if (repairRequest.assignedMechanicIdx != null)
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
                                  if (repairRequest.status ==
                                      VehicleRepairRequestStatus
                                          .WAITING_FOR_MECHANIC)
                                    Column(
                                      children: [
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
                                      ],
                                    ),
                                  if (repairRequest.status ==
                                      VehicleRepairRequestStatus
                                          .WAITING_FOR_MECHANIC)
                                    Column(
                                      children: [
                                        const SizedBox(height: 16),
                                        AsyncValueWidget(
                                          value: ref.watch(
                                              watchRepairRequestMechanicLocationProvider(
                                                  repairRequest.idx)),
                                          data: (location) => AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 120),
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
                                                    [],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      if (repairRequest.status ==
                          VehicleRepairRequestStatus.WAITING_FOR_MECHANIC)
                        Column(
                          children: [
                            const SizedBox(height: 20),
                            AsyncValueWidget(
                              value: ref.watch(
                                  fetchRepairRequestServiceTypeProvider(
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
                                        // ? Icon(service.icon)
                                        ? Text(
                                            service.icon!,
                                            style: const TextStyle(
                                                fontFamily: "MaterialIcons"),
                                          )
                                        : Image.asset(
                                            'assets/images/parts/wheel.png',
                                          ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Estimated Arrival Time: '
                                          .hardcoded(),
                                      style: const TextStyle().copyWith(
                                        color: context.isDarkMode
                                            ? ThemeColor.white
                                            : ThemeColor.black,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: BaatoDateFormatter
                                              .formatSecondsToGeneric(routeValue
                                                      .value?["duration"] ??
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
                          ],
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
                      Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: (repairRequest.advancePaymentStatus !=
                                      AdvancePaymentStatus.COMPLETE &&
                                  repairRequest.advanceCharge != null)
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Flexible(
                                      flex: 4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                        'Rs. ${repairRequest.advanceCharge}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: ThemeColor.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink()),
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
                          VehicleRepairRequestStatus.IN_PROGRESS)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Repair Steps".hardcoded(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              RepairStepsWidget(
                                  repairRequestIdx: repairRequest.idx)
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Consumer(builder: (context, ref, child) {
                  final repairRequestValue =
                      ref.watch(watchRepairRequestProvider(repairRequest.idx));
                  return AsyncValueWidget(
                    value: repairRequestValue,
                    data: (repairRequest) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (repairRequest.status ==
                            VehicleRepairRequestStatus
                                .WAITING_FOR_COMPLETION_ACCEPTANCE)
                          SubmitButton(
                            label: 'Complete the process'.hardcoded(),
                            showSpinner: ref
                                .watch(repairProgressScreenControllerProvider)
                                .isLoading,
                            onPressed: () async {
                              if (await ref
                                  .read(repairProgressScreenControllerProvider
                                      .notifier)
                                  .completeRepair(repairRequest.idx)) {
                                context.pushNamed(APP_ROUTE.reviewMechanic.name,
                                    extra: {
                                      'repairRequestIdx': repairRequest.idx,
                                      "mechanicIdx":
                                          repairRequest.assignedMechanicIdx
                                    });
                              }
                            },
                          ),
                        if (repairRequest.status ==
                            VehicleRepairRequestStatus.COMPLETE)
                          ElevatedButton(
                              child: Text('Review the mechanic'.hardcoded()),
                              onPressed: () {
                                context.goNamed(APP_ROUTE.reviewMechanic.name,
                                    extra: {
                                      'repairRequestIdx': repairRequest.idx,
                                      "mechanicIdx":
                                          repairRequest.assignedMechanicIdx
                                    });
                              }),
                      ],
                    ),
                  );
                }),
              ),
            ),
          );
        });
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
                          .read(repairProgressScreenControllerProvider.notifier)
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
