import 'package:bato_mechanic/src/features/repair_request/application/location_service.dart';
import 'package:bato_mechanic/src/features/repair_request/data/map_repository/request_mechanic_map_repository.dart';
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

  fetchLocationName(double lat, double lon) async {
    // final markerPos = state.markerPosition.value;
    state = state.copyWith(markerPosition: const AsyncValue.loading());

    var response = await ref
        .read(requestMechanicMapRepositoryProvider)
        .fetchLocationName(lat, lon);

    if (response is Success) {
      // loading = false;
      // state = state.copyWith()
      state = state.copyWith(markerPosition: AsyncValue.data(LatLng(lat, lon)));
      return response.response;
    }

    if (response is Failure) {
      state = state.copyWith(
          markerPosition:
              AsyncValue.error(response.errorResponse, response.stackTrace));
      // mapError = MapError(code: response.code, message: response.errorResponse);
    }
    // loading = false;
    return null;
    // return 'TEst location';
  }

  fetchSearchLocations(String searchText) async {
    // loading = true;
    // var response = await MapApi.getSearchLocations(searchText);
    var response =
        await ref.read(locationServiceProvider).fetchSearchLocation(searchText);

    if (response is Success) {
      // loading = false;
      return response.response;
    }

    if (response is Failure) {
      // mapError = MapError(code: response.code, message: response.errorResponse);
    }
    // loading = false;
    // return null;
    return 'TEst search result location';
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
