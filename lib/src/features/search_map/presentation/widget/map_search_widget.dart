import 'dart:async';

import 'package:bato_mechanic/src/features/auth/application/auth_service.dart';
import 'package:bato_mechanic/src/features/auth/application/auth_state.dart';
import 'package:bato_mechanic/src/features/core/domain/user_position.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/request_mechanic_screen_controller.dart';
import 'package:bato_mechanic/src/features/search_map/presentation/widget/search_map_state.dart';
import 'package:bato_mechanic/src/features/search_map/presentation/widget/search_map_widget_controller.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/helpers/helper_functions.dart';
import 'package:bato_mechanic/src/utils/helpers/map_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../../../common/widgets/flutter_map/control_buttons/control_buttons.dart';
import '../../domain/osm_data.dart';

class MapSearchWidget extends ConsumerStatefulWidget {
  const MapSearchWidget({super.key});

  @override
  ConsumerState<MapSearchWidget> createState() => _MapSearchWidgetState();
}

class _MapSearchWidgetState extends ConsumerState<MapSearchWidget>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late MapController _mapController = MapController();
  late AnimationController _animationController;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<OSMdata> _options = <OSMdata>[];
  Timer? _debounce;
  late double width;
  late double height;
  String _selectedPlaceName = 'lol';

  // bool _isFetchingSearchLocations = false;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    /// The below code is listening to the mapEventStream and when the mapEventMoveEnd event is
    /// triggered, it moves the pointer to that position

    _mapController.mapEventStream.listen((event) async {
      // Uncomment this if we want to move the maker position on drag movement to always place the marker at the center of the map
      if (event is MapEventMove) {
        ref.read(searchMapWidgetControllerProvider.notifier).setMarkerPosition(
            _mapController.pointToLatLng(CustomPoint(width / 2, height / 2))
                as LatLng);
      }
      if (event is MapEventMoveEnd) {
        _showLocationName(event.center.latitude, event.center.longitude);
      }
    });
  }

  _showLocationName(double lat, double lon) async {
    String? placeName = await ref
        .read(searchMapWidgetControllerProvider.notifier)
        .fetchLocationName(lat, lon);
    if (placeName != null) {
      _searchController.text = placeName;
      _selectedPlaceName = placeName;
      // UserPosition? userPosition =
      //     ref.read(authStateProvider).user?.currentLocation;

      // if (userPosition != null) {
      //   ref
      //       .read(requestMechanicScreenControllerProvider.notifier)
      //       .setSelectedLocation({
      //     "latitude": lat,
      //     "longitude": lon,
      //     "location_name": placeName,
      //     "accuracy": userPosition.accuracy,
      //     "altitude": userPosition.altitude,
      //     "timestamp": userPosition.timestamp.toString(),
      //   });
      // } else {
      //   userPosition = await MapHelper.getUserLocation();
      //   if (userPosition != null) {
      //     ref
      //         .read(requestMechanicScreenControllerProvider.notifier)
      //         .setSelectedLocation({
      //       "latitude": lat,
      //       "longitude": lon,
      //       "location_name": placeName,
      //       "accuracy": userPosition.accuracy,
      //       "altitude": userPosition.altitude,
      //       "timestamp": userPosition.timestamp.toString(),
      //     }

      // );
      // }
      // }
    } else {
      print('here');
    }
  }

  void _animatedMapMove(LatLng destLocation, double destZoom, bool mounted,
      TickerProvider vsync) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final latTween = Tween<double>(
        begin: _mapController.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: _mapController.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: _mapController.zoom, end: destZoom);
    // Create a animation controller that has a duration and a TickerProvider.
    if (mounted) {
      _animationController = AnimationController(
          vsync: vsync, duration: const Duration(milliseconds: 500));
    }
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    final Animation<double> animation = CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn);

    _animationController.addListener(() {
      _mapController.move(
          LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
          zoomTween.evaluate(animation));
    });

    if (mounted) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    _animationController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchMapWidgetControllerProvider);
    return SafeArea(
      child: Stack(
        children: [
          _showMap(context),
          _buildSearchBar(state),
        ],
      ),
    );
  }

  Widget _showMap(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      width = constraints.maxWidth;
      height = constraints.maxHeight;
      return FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          onTap: (tapPosition, latLng) async {
            ref
                .read(searchMapWidgetControllerProvider.notifier)
                .setMarkerPosition(latLng);
            await _showLocationName(latLng.latitude, latLng.longitude);
            _animatedMapMove(latLng, _mapController.zoom, mounted, this);
          },
          center:
              ref.watch(searchMapWidgetControllerProvider).markerPosition.value,
          zoom: 15.0,
        ),
        nonRotatedChildren: [
          FlutterMapControlButtons(
            minZoom: 4,
            // String placeName = await ref
            //     .read(searchMapWidgetControllerProvider.notifier)
            //     .getLocationName(latLng.latitude, latLng.longitude);
            // selectedPlaceName = placeName;
            // _animatedMapMove(latLng, _mapController.zoom, mounted, this);
            maxZoom: 19,
            mini: false,
            padding: 10,
            alignment: Alignment.bottomRight,
            mapController: _mapController,
            animationController: _animationController,
          ),
          // _buildSelectButton(),
          // const RichAttributionWidget(
          //   popupInitialDisplayDuration: const Duration(seconds: 5),
          //   animationConfig: const ScaleRAWA(),
          //   showFlutterMapAttribution: false,
          //   attributions: [
          //     TextSourceAttribution(
          //       'Full Screen Mode',
          //       prependCopyright: false,
          //     ),
          //     TextSourceAttribution(
          //       'Tap on the map to show full screen map',
          //       prependCopyright: false,
          //     ),
          //   ],
          // ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            tileProvider: NetworkTileProvider(),
          ),
          if (!ref
              .watch(searchMapWidgetControllerProvider)
              .markerPosition
              .isLoading)
            MarkerLayer(
              rotate: true,
              markers: [
                Marker(
                  width: 80,
                  height: 80,
                  point: ref
                      .watch(searchMapWidgetControllerProvider)
                      .markerPosition
                      .value as LatLng,
                  builder: (ctx) => const Icon(
                    Icons.location_on,
                    color: Colors.orange,
                    size: 40.0,
                  ),
                ),
              ],
            ),
          CurrentLocationLayer(),
          if (ref
              .watch(searchMapWidgetControllerProvider)
              .markerPosition
              .isLoading)
            HelperFunctions.loadingInidicator(context),
        ],
      );
    });
  }

  Widget _buildSearchBar(SearchMapState state) {
    OutlineInputBorder inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
    );
    OutlineInputBorder inputFocusBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
    );

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            SearchBar(
              controller: _searchController,
              focusNode: _searchFocusNode,
              hintText: 'Enter place name',
              backgroundColor:
                  const MaterialStatePropertyAll<Color>(ThemeColor.light),
              trailing: [
                // _isFetchingSearchLocations
                state.searchLocations.isLoading
                    ? HelperFunctions.loadingInidicator(
                        context,
                        radius: AppHeight.h20,
                      )
                    : IconButton(
                        style: const ButtonStyle().copyWith(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ThemeColor.transparent),
                        ),
                        onPressed: () {
                          _searchController.clear();

                          _options = [];
                        },
                        icon: const Icon(
                          Icons.clear,
                        ),
                      ),
              ],
              onChanged: (String value) {
                if (_debounce?.isActive ?? false) {
                  _debounce?.cancel();
                }

                _debounce = Timer(const Duration(milliseconds: 20), () async {
                  // if (mounted) {
                  //   setState(() {
                  //     _isFetchingSearchLocations = true;
                  //   });
                  // }
                  var response = await ref
                      .read(searchMapWidgetControllerProvider.notifier)
                      .fetchSearchLocations(_searchController.text);
                  if (mounted) {
                    setState(() {
                      _options = response
                          .map((e) => OSMdata(
                              displayname: e['display_name'],
                              latitude: double.parse(e['lat']),
                              longitude: double.parse(e['lon'])))
                          .toList()
                          .cast<OSMdata>();
                      // _isFetchingSearchLocations = false;
                    });
                  }
                });
              },
            ),
            _buildListView(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectButton() {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 15,
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: const ButtonStyle().copyWith(
            // foregroundColor: isDarkTheme
            //     ? MaterialStatePropertyAll<Color>(ThemeColor.black)
            //     : null,
            foregroundColor:
                const MaterialStatePropertyAll<Color>(ThemeColor.black),
          ),
          child: Text('Select this location'.hardcoded()),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Container(
      margin: const EdgeInsets.only(top: AppMargin.m4),
      padding: const EdgeInsets.all(AppPadding.p4),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      height: _options.isEmpty ? AppHeight.h0 : AppHeight.h320,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: _options.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration().copyWith(
                color: Theme.of(context).primaryColor,
                border: const Border(
                  bottom: BorderSide(
                    color: ThemeColor.light,
                  ),
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(
                  _options[index].displayname,
                ),
                onTap: () async {
                  LatLng positionToMove = LatLng(
                      _options[index].latitude, _options[index].longitude);

                  _animatedMapMove(
                      positionToMove, _mapController.zoom, mounted, this);
                  ref
                      .read(searchMapWidgetControllerProvider.notifier)
                      .setMarkerPosition(positionToMove);
                  _mapController.center.latitude = positionToMove.latitude;
                  _mapController.center.longitude = positionToMove.longitude;

                  // UserPosition? userPosition =
                  //     ref.read(authStateProvider).user?.currentLocation;

                  // if (userPosition == null) {
                  //   userPosition = await MapHelper.getUserLocation();
                  //   if (userPosition != null) {
                  //     ref
                  //         .read(
                  //             requestMechanicScreenControllerProvider.notifier)
                  //         .setSelectedLocation({
                  //       "latitude": _options[index].latitude,
                  //       "longitude": _options[index].longitude,
                  //       "location_name": _options[index].displayname,
                  //       "accuracy": userPosition.accuracy,
                  //       "altitude": userPosition.altitude,
                  //       "timestamp": userPosition.timestamp.toString(),
                  //     });
                  //     _searchController.text = _options[index].displayname;
                  //   }
                  // }
                  _searchController.text = _options[index].displayname;

                  _searchFocusNode.unfocus();
                  _options.clear();
                },
              ),
            );
          }),
    );
  }
}
