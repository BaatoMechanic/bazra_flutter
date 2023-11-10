// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/repair_request/domain/mechanic.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_category.dart';

class RequestMechanicState {
  RequestMechanicState({
    // this.error = const AsyncValue.data(null),
    required this.selectedImages,
    required this.selectedVideo,
    required this.preferredMechanic,
    this.value = const AsyncValue.data(null),
  });
  // final VehicleCategory? vehicleCategory;
  // final Vehicle? selectedVehicle;
  final AsyncValue<List<File>> selectedImages;
  final AsyncValue<File?> selectedVideo;
  final AsyncValue<Mechanic?> preferredMechanic;
  // final AsyncValue<String?> error;
  final AsyncValue<void> value;

  RequestMechanicState copyWith({
    AsyncValue<List<File>>? selectedImages,
    AsyncValue<File?>? selectedVideo,
    AsyncValue<Mechanic?>? preferredMechanic,
    AsyncValue<void>? value,
  }) {
    return RequestMechanicState(
      selectedImages: selectedImages ?? this.selectedImages,
      selectedVideo: selectedVideo ?? this.selectedVideo,
      preferredMechanic: preferredMechanic ?? this.preferredMechanic,
      value: value ?? this.value,
    );
  }

  @override
  String toString() {
    return 'RequestMechanicState(selectedImages: $selectedImages, selectedVideo: $selectedVideo, preferredMechanic: $preferredMechanic, value: $value)';
  }

  @override
  bool operator ==(covariant RequestMechanicState other) {
    if (identical(this, other)) return true;

    return other.selectedImages == selectedImages &&
        other.selectedVideo == selectedVideo &&
        other.preferredMechanic == preferredMechanic &&
        other.value == value;
  }

  @override
  int get hashCode {
    return selectedImages.hashCode ^
        selectedVideo.hashCode ^
        preferredMechanic.hashCode ^
        value.hashCode;
  }
}
