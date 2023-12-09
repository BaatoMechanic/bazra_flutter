import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bato_mechanic/src/features/auth/application/auth_service.dart';
import 'package:bato_mechanic/src/features/core/application/user_service.dart';
import 'package:bato_mechanic/src/features/payment/application/payment_service.dart';
import 'package:bato_mechanic/src/features/repair_request/application/mechanic_service.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/repair_request/data/map_repository/request_mechanic_map_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/data/mechanic_repository/mechanic_repository.dart';

import 'package:bato_mechanic/src/features/repair_request/domain/user_position.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/repair_request_controller.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/track_mechanic/track_mechanic_screen_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../../auth/domain/user.dart';

class TrackMechanicScreenController extends StateNotifier<AsyncValue<void>> {
  TrackMechanicScreenController({required this.ref})
      : super(const AsyncValue.data(null));
  final Ref ref;

  // final StreamController<UserPosition> mechanicPositionStreamController =
  //     StreamController<UserPosition>();

  Future<void> initializeLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position position;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        return;
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    position = await Geolocator.getCurrentPosition();

    final UserPosition currentUserLocation = UserPosition(
        latitude: position.latitude,
        longitude: position.longitude,
        timestamp: position.timestamp,
        accuracy: position.accuracy,
        altitude: position.altitude,
        heading: position.heading,
        speed: position.speed,
        speedAccuracy: position.speedAccuracy,
        locationName: "Temp Name");
    User currentUser = ref.read(authServiceProvider).currentUser!;
    currentUser = currentUser.copyWith(currentLocation: currentUserLocation);
    ref.read(authServiceProvider).setCurrentUser(currentUser);
  }

  Future<bool> payWithKhalti() async {
    final result = await ref.read(paymentServiceProvider).payWithKhalti();
    if (result) {
      VehicleRepairRequest? request =
          ref.watch(repairRequestServiceProvider).activeRepairRequest;
      ref.read(repairRequestServiceProvider).setActiveRepairRequest(
          request!.copyWith(status: VehicleRepairRequestStatus.IN_PROGRESS));
      return true;
    }
    return false;
  }

  Future<bool> payWithEsewa() async {
    final result = await ref.read(paymentServiceProvider).payWithEsewa();
    if (result) {
      VehicleRepairRequest? request =
          ref.watch(repairRequestServiceProvider).activeRepairRequest;
      ref.read(repairRequestServiceProvider).setActiveRepairRequest(
          request!.copyWith(status: VehicleRepairRequestStatus.IN_PROGRESS));
      return true;
    }
    return false;
  }

  Future<dynamic> fetchRoute() async {
    final response = await ref
        .read(requestMechanicMapRepositoryProvider)
        .getRoute('85.33033043146135,27.703292452047425',
            '85.33825904130937, 27.707645262018172');
    return response;
  }

  Future<User> fetchMechanicInfo(String mechanicId) async {
    final response = await ref
        .read(mechanicRepositoryProvider)
        .fetchMechanicInfo(mechanicId);
    final mechanic = User.fromJson(jsonDecode(response.body));
    ref.read(mechanicServiceProvider).setAssignedMechanic(mechanic);
    // state = state.copyWith(mechanicInfo: mechanic);

    // mechanicPositionStreamController.add(mechanic.currentLocation!);
    // state = state.copyWith(
    //     currentMechanicLocation: mechanicPositionStreamController.stream);
    // state = state.copyWith(currentUserLocation: mechanic.currentLocation);

    return mechanic;
  }

  int getEstimateArrivalTime() {
    // final UserPosition? userLocation = state.currentUserLocation;
    // final UserPosition? mechanicLocation = state.currentUserLocation;
    final UserPosition? userLocation =
        // ref.read(authServiceProvider).currentUser!.currentLocation;
        ref.read(mechanicServiceProvider).assignedMechanic?.currentLocation;
    final UserPosition? mechanicLocation =
        ref.read(mechanicServiceProvider).assignedMechanic?.currentLocation;
    if (mechanicLocation == null) {
      // -1 is returned because it is used to check in formatter utility function to return Unknown string
      return -1;
    }
    // Calculate distance using Haversine formula
    double distance = calculateHaversineDistance(
      userLocation!.latitude!,
      userLocation.longitude!,
      mechanicLocation.latitude!,
      mechanicLocation.longitude!,
    );

    // Assume an average speed of the mechanic (in kilometers per hour)
    double averageSpeedOfMechanic = 30.0;

    //estimated time of arrival (in hours)
    double estimatedTimeOfArrival = distance / averageSpeedOfMechanic;

    // Convert the estimated time to minutes
    int estimatedArrivalTimeInMinutes = (estimatedTimeOfArrival * 60).round();

    return estimatedArrivalTimeInMinutes;
  }
}

// Function to calculate distance using Haversine formula
double calculateHaversineDistance(
    double lat1, double lon1, double lat2, double lon2) {
  const double earthRadius = 6371; // Radius of the Earth in kilometers
  final double dLat = (lat2 - lat1) * (pi / 180);
  final double dLon = (lon2 - lon1) * (pi / 180);

  final double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(lat1 * (pi / 180)) *
          cos(lat2 * (pi / 180)) *
          sin(dLon / 2) *
          sin(dLon / 2);

  final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return earthRadius * c;
}

final trackMechanicScreenControllerProvider = StateNotifierProvider.autoDispose<
    TrackMechanicScreenController,
    AsyncValue<void>>((ref) => TrackMechanicScreenController(ref: ref));

final fetchTrackMechanicRouteProvider = FutureProvider.autoDispose((ref) =>
    ref.watch(trackMechanicScreenControllerProvider.notifier).fetchRoute());
