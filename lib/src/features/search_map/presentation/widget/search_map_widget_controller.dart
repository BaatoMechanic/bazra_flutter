import 'package:bato_mechanic/src/features/core/data/map_repository/map_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'search_map_state.dart';

part 'search_map_widget_controller.g.dart';

@riverpod
class SearchMapWidgetController extends _$SearchMapWidgetController {
  @override
  SearchMapState build() {
    return SearchMapState(
      markerPosition: LatLng(27.703292452047425, 85.33033043146135),
    );
  }

  initializeLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position position;

    state = state.copyWith(value: const AsyncValue.loading());

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        state = state.copyWith(userPosition: null);
        return;
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        state = state.copyWith(userPosition: null);
        return;
      }
    }

    position = await Geolocator.getCurrentPosition();
    state = state.copyWith(userPosition: position);
    state = state.copyWith(value: const AsyncValue.data(null));
  }

  Future<String?> fetchLocationName(double lat, double lon) async {
    state = state.copyWith(value: const AsyncValue.loading());

    var response = await AsyncValue.guard(
        () => ref.read(mapRepositoryProvider).fetchLocationName(lat, lon));

    if (response.hasValue) {
      state = state.copyWith(selectedLocation: response.value["display_name"]);
      state = state.copyWith(
        markerPosition: LatLng(
          double.parse(response.value["lat"]),
          double.parse(response.value["lon"]),
        ),
      );
      state = state.copyWith(value: const AsyncValue.data(null));
      return response.value["display_name"];
    }
    state = state.copyWith(value: const AsyncValue.data(null));

    return null;
  }

  Future<List<dynamic>> fetchSearchLocations(String searchText) async {
    state = state.copyWith(value: const AsyncValue.loading());
    var response = await AsyncValue.guard(
        () => ref.read(mapRepositoryProvider).getSearchLocations(searchText));

    if (response.hasValue) {
      state = state.copyWith(searchLocations: response.value);
      state = state.copyWith(value: const AsyncValue.data(null));
      return response.value;
    }
    state = state.copyWith(value: const AsyncValue.data(null));
    return [];
    // return 'TEst search result location';
  }

  void setMarkerPosition(LatLng position) {
    state = state.copyWith(value: const AsyncValue.loading());
    state = state.copyWith(markerPosition: position);
    state = state.copyWith(value: const AsyncValue.data(null));
  }
}
