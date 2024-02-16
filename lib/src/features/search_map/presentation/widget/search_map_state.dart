// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class SearchMapState {
  SearchMapState({
    this.userPosition = const AsyncValue.data(null),
    this.markerPosition = const AsyncValue.data(null),
    this.searchLocations = const AsyncValue.data([]),
    this.selectedLocation = const AsyncValue.data(null),
  });

  final AsyncValue<Position?> userPosition;
  final AsyncValue<LatLng?> markerPosition;
  final AsyncValue<List<dynamic>> searchLocations;
  final AsyncValue<String?> selectedLocation;

  SearchMapState copyWith({
    AsyncValue<Position?>? userPosition,
    AsyncValue<LatLng>? markerPosition,
    AsyncValue<List<dynamic>>? searchLocations,
    AsyncValue<String>? selectedLocation,
  }) {
    return SearchMapState(
      userPosition: userPosition ?? this.userPosition,
      markerPosition: markerPosition ?? this.markerPosition,
      searchLocations: searchLocations ?? this.searchLocations,
      selectedLocation: selectedLocation ?? this.selectedLocation,
    );
  }
}
