// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/auth/domain/user_back.dart';
import 'package:bato_mechanic/src/features/core/domain/user_position.dart';

import '../../../auth/domain/mechanic.dart';

// class RequestMechanicState {
//   RequestMechanicState({
//     required this.selectedImages,
//     required this.selectedVideo,
//     required this.preferredMechanic,
//     required this.selectedLocation,
//     this.value = const AsyncValue.data(null),
//   });

//   final AsyncValue<List<File>> selectedImages;
//   final AsyncValue<File?> selectedVideo;
//   final AsyncValue<User?> preferredMechanic;
//   final UserPosition? selectedLocation;

//   final AsyncValue<void> value;

//   RequestMechanicState copyWith({
//     AsyncValue<List<File>>? selectedImages,
//     AsyncValue<File?>? selectedVideo,
//     AsyncValue<User?>? preferredMechanic,
//     AsyncValue<void>? value,
//     UserPosition? selectedPosition,
//   }) {
//     return RequestMechanicState(
//       selectedImages: selectedImages ?? this.selectedImages,
//       selectedVideo: selectedVideo ?? this.selectedVideo,
//       preferredMechanic: preferredMechanic ?? this.preferredMechanic,
//       selectedLocation: selectedPosition ?? this.selectedLocation,
//       value: value ?? this.value,
//     );
//   }

//   @override
//   String toString() {
//     return 'SelectedPosition: $selectedLocation, RequestMechanicState(selectedImages: $selectedImages, selectedVideo: $selectedVideo, preferredMechanic: $preferredMechanic, value: $value)';
//   }

//   @override
//   bool operator ==(covariant RequestMechanicState other) {
//     if (identical(this, other)) return true;

//     return other.selectedImages == selectedImages &&
//         other.selectedVideo == selectedVideo &&
//         other.preferredMechanic == preferredMechanic &&
//         other.selectedLocation == selectedLocation &&
//         other.value == value;
//   }

//   @override
//   int get hashCode {
//     return selectedImages.hashCode ^
//         selectedVideo.hashCode ^
//         preferredMechanic.hashCode ^
//         selectedLocation.hashCode ^
//         value.hashCode;
//   }
// }
class RequestMechanicState {
  RequestMechanicState({
    required this.selectedImages,
    required this.selectedVideo,
    required this.preferredMechanic,
    required this.selectedLocation,
    this.value = const AsyncValue.data(null),
  });

  final List<File> selectedImages;
  final File? selectedVideo;
  final Mechanic? preferredMechanic;
  final Map<String, dynamic> selectedLocation;

  final AsyncValue<void> value;

  RequestMechanicState copyWith({
    List<File>? selectedImages,
    File? selectedVideo,
    Mechanic? preferredMechanic,
    Map<String, dynamic>? selectedLocation,
    AsyncValue<void>? value,
  }) {
    return RequestMechanicState(
      selectedImages: selectedImages ?? this.selectedImages,
      selectedVideo: selectedVideo ?? this.selectedVideo,
      preferredMechanic: preferredMechanic ?? this.preferredMechanic,
      selectedLocation: selectedLocation ?? this.selectedLocation,
      value: value ?? this.value,
    );
  }

  @override
  bool operator ==(covariant RequestMechanicState other) {
    if (identical(this, other)) return true;

    return listEquals(other.selectedImages, selectedImages) &&
        other.selectedVideo == selectedVideo &&
        other.preferredMechanic == preferredMechanic &&
        mapEquals(other.selectedLocation, selectedLocation) &&
        other.value == value;
  }

  @override
  int get hashCode {
    return selectedImages.hashCode ^
        selectedVideo.hashCode ^
        preferredMechanic.hashCode ^
        selectedLocation.hashCode ^
        value.hashCode;
  }

  @override
  String toString() {
    return 'RequestMechanicState(selectedImages: $selectedImages, selectedVideo: $selectedVideo, preferredMechanic: $preferredMechanic, selectedLocation: $selectedLocation, value: $value)';
  }
}
