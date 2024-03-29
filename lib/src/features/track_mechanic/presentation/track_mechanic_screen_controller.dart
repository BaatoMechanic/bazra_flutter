import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bato_mechanic/src/features/auth/application/auth_service.dart';
import 'package:bato_mechanic/src/features/auth/application/auth_state.dart';
import 'package:bato_mechanic/src/features/core/data/map_repository/map_repository.dart';
import 'package:bato_mechanic/src/features/payment/application/payment_service.dart';
import 'package:bato_mechanic/src/features/core/application/mechanic_service.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/core/data/mechanic_repository/mechanic_repository.dart';

import 'package:bato_mechanic/src/features/core/domain/user_position.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../auth/domain/user.dart';
import '../../auth/domain/user_back.dart';

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
    // TODO: Find solution for user location
    // User currentUser = ref.read(authStateProvider).user!;
    // currentUser = currentUser.copyWith(currentLocation: currentUserLocation);
    // ref.read(authStateProvider.notifier).setUser(currentUser);
  }

  // Future<bool> payWithKhalti() async {
  //   final result = await ref.read(paymentServiceProvider).payWithKhalti();
  //   if (result) {
  //     VehicleRepairRequest? request =
  //         ref.watch(repairRequestServiceProvider).getActiveRepairRequest();
  //     ref.read(repairRequestServiceProvider).setActiveRepairRequest(
  //         request!.copyWith(status: VehicleRepairRequestStatus.IN_PROGRESS));
  //     return true;
  //   }
  //   return false;
  // }

  // Future<bool> payWithEsewa() async {
  //   final result = await ref.read(paymentServiceProvider).payWithEsewa();
  //   if (result) {
  //     VehicleRepairRequest? request =
  //         ref.watch(repairRequestServiceProvider).getActiveRepairRequest();
  //     ref.read(repairRequestServiceProvider).setActiveRepairRequest(
  //         request!.copyWith(status: VehicleRepairRequestStatus.IN_PROGRESS));
  //     return true;
  //   }
  //   return false;
  // }

  // Future<User?> fetchMechanicInfo(String mechanicId) async {
  //   final user =
  //       await ref.read(mechanicServiceProvider).fetchMechanicInfo(mechanicId);

  //   ref.read(assignedMechanicProvider.notifier).state = user;

  //   return user;
  // }

  // Stream<UserPosition?> getUserAndMechanicPosition() {
  //   return ref.read(repairRequestServiceProvider).watchUsersLocation(
  //       ref.read(repairRequestServiceProvider).getActiveRepairRequest()!.idx);
  // }

  int getEstimateArrivalTime() {
    // final UserPosition? userLocation =
    //     ref.read(assignedMechanicProvider)?.currentLocation;
    // final UserPosition? mechanicLocation =
    //     ref.read(assignedMechanicProvider)?.currentLocation;
    // if (mechanicLocation == null) {
    //   // -1 is returned because it is used to check in formatter utility function to return Unknown string
    //   return -1;
    // }
    // // Calculate distance using Haversine formula
    // double distance = calculateHaversineDistance(
    //   userLocation!.latitude!,
    //   userLocation.longitude!,
    //   mechanicLocation.latitude!,
    //   mechanicLocation.longitude!,
    // );

    // // Assume an average speed of the mechanic (in kilometers per hour)
    // double averageSpeedOfMechanic = 30.0;

    // //estimated time of arrival (in hours)
    // double estimatedTimeOfArrival = distance / averageSpeedOfMechanic;

    // // Convert the estimated time to minutes
    // int estimatedArrivalTimeInMinutes = (estimatedTimeOfArrival * 60).round();

    // return estimatedArrivalTimeInMinutes;
    return 0;
  }

  Future<bool> setAdvancePaymentOnArrival(String repairStepIdx) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref
            .read(repairRequestServiceProvider)
            .updateVehicleRepairRequest(repairStepIdx, {
          "advance_payment_status":
              AdvancePaymentStatus.PAYMENT_ON_ARRIVAL.name.toLowerCase(),
          "status": VehicleRepairRequestStatus.WAITING_FOR_MECHANIC.name
              .toLowerCase(),
        }));
    return !state.hasError;
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
