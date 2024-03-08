import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class SearchMapState {
  SearchMapState({
    this.userPosition,
    this.markerPosition,
    this.searchLocations = const [],
    this.selectedLocation,
    this.value = const AsyncValue.data(null),
  });

  final Position? userPosition;
  final LatLng? markerPosition;
  final List<dynamic> searchLocations;
  final String? selectedLocation;
  final AsyncValue<void> value;

  SearchMapState copyWith({
    Position? userPosition,
    LatLng? markerPosition,
    List<dynamic>? searchLocations,
    String? selectedLocation,
    AsyncValue<void>? value,
  }) {
    return SearchMapState(
      userPosition: userPosition ?? this.userPosition,
      markerPosition: markerPosition ?? this.markerPosition,
      searchLocations: searchLocations ?? this.searchLocations,
      selectedLocation: selectedLocation ?? this.selectedLocation,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(covariant SearchMapState other) {
    if (identical(this, other)) return true;

    return other.userPosition == userPosition &&
        other.markerPosition == markerPosition &&
        listEquals(other.searchLocations, searchLocations) &&
        other.selectedLocation == selectedLocation &&
        other.value == value;
  }

  @override
  int get hashCode {
    return userPosition.hashCode ^
        markerPosition.hashCode ^
        searchLocations.hashCode ^
        selectedLocation.hashCode ^
        value.hashCode;
  }

  @override
  String toString() {
    return 'SearchMapState(userPosition: $userPosition, markerPosition: $markerPosition, searchLocations: $searchLocations, selectedLocation: $selectedLocation, value: $value)';
  }
}
