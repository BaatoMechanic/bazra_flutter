import 'package:bato_mechanic/src/features/core/application/location_service.dart';
import 'package:bato_mechanic/src/features/core/data/map_repository/map_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../../utils/model_utils.dart';
import 'search_map_state.dart';

class SearchMapWidgetController extends StateNotifier<SearchMapState> {
  SearchMapWidgetController({required this.ref})
      : super(
          SearchMapState(
            userPosition: const AsyncValue.data(null),
            markerPosition:
                AsyncValue.data(LatLng(27.703292452047425, 85.33033043146135)),
          ),
        );
  final Ref ref;

  initializeLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position position;

    state = state.copyWith(userPosition: const AsyncValue.loading());

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        state = state.copyWith(userPosition: const AsyncValue.data(null));
        return;
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        state = state.copyWith(userPosition: const AsyncValue.data(null));
        return;
      }
    }

    position = await Geolocator.getCurrentPosition();
    state = state.copyWith(userPosition: AsyncValue.data(position));
  }

  Future<String?> fetchLocationName(double lat, double lon) async {
    state = state.copyWith(markerPosition: const AsyncValue.loading());

    var response = await AsyncValue.guard(
        () => ref.read(mapRepositoryProvider).fetchLocationName(lat, lon));

    if (response.hasValue) {
      state = state.copyWith(
          selectedLocation: AsyncValue.data(response.value["display_name"]));
      state = state.copyWith(
        markerPosition: AsyncValue.data(
          LatLng(double.parse(response.value["lat"]),
              double.parse(response.value["lon"])),
        ),
      );
      return response.value["display_name"];
    }

    return null;
  }

  Future<List<dynamic>> fetchSearchLocations(String searchText) async {
    state = state.copyWith(searchLocations: const AsyncValue.loading());
    var response = await AsyncValue.guard(
        () => ref.read(mapRepositoryProvider).getSearchLocations(searchText));

    if (response.hasValue) {
      state = state.copyWith(searchLocations: AsyncValue.data(response.value));
      return response.value;
    }
    return [];
    // return 'TEst search result location';
  }

  void setMarkerPosition(LatLng position) {
    state = state.copyWith(markerPosition: const AsyncValue.loading());
    state = state.copyWith(markerPosition: AsyncValue.data(position));
  }
}

final searchMapWidgetControllerProvider = StateNotifierProvider.autoDispose<
    SearchMapWidgetController, SearchMapState>(
  (ref) => SearchMapWidgetController(ref: ref),
);

// final fetchSearchLocationsProvider =
//     FutureProvider.autoDispose.family<String, String>((ref, searchText) {
//   final searchMapWidgetController =
//       ref.watch(searchMapWidgetControllerProvider.notifier);
//   return searchMapWidgetController.fetchSearchLocations(searchText);
// });
