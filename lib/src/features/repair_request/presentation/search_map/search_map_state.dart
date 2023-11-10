// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class SearchMapState {
  SearchMapState({
    this.userPosition = const AsyncValue.data(null),
    this.markerPosition = const AsyncValue.data(null),
  });

  final AsyncValue<Position?> userPosition;
  final AsyncValue<LatLng?> markerPosition;
  // LatLng markerPosition = LatLng(27.703292452047425, 85.33033043146135);

  SearchMapState copyWith({
    AsyncValue<Position?>? userPosition,
    AsyncValue<LatLng>? markerPosition,
  }) {
    return SearchMapState(
      userPosition: userPosition ?? this.userPosition,
      markerPosition: markerPosition ?? this.markerPosition,
    );
  }
}
