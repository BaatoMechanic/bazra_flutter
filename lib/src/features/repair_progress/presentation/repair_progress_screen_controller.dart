import 'dart:async';
import 'dart:math';

import 'package:bato_mechanic/src/features/repair_progress/data/repair_step_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/repair_request_repository.dart';

import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request/vehicle_repair_request.dart';

import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/enums/repair_setp_status.dart';
import '../domain/repair_step.dart';
part 'repair_progress_screen_controller.g.dart';

@riverpod
class RepairProgressScreenController extends _$RepairProgressScreenController {
  @override
  FutureOr<void> build() {
    // pass
  }

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

    // final UserPosition currentUserLocation = UserPosition(
    //     latitude: position.latitude,
    //     longitude: position.longitude,
    //     timestamp: position.timestamp,
    //     accuracy: position.accuracy,
    //     altitude: position.altitude,
    //     heading: position.heading,
    //     speed: position.speed,
    //     speedAccuracy: position.speedAccuracy,
    //     locationName: "Temp Name");
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

  Future<bool> setAdvancePaymentOnArrival(String repairRequestIdx) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref
            .read(repairRequestRepositoryProvider)
            .updateRepairRequest(repairRequestIdx, {
          "advance_payment_status":
              AdvancePaymentStatus.PAYMENT_ON_ARRIVAL.name.toLowerCase(),
          "status": VehicleRepairRequestStatus.WAITING_FOR_MECHANIC.name
              .toLowerCase(),
        }));
    return !state.hasError;
  }

  Future<List<RepairStep>> fetchRepairSteps(String repairRequestIdx) async {
    state = await AsyncValue.guard(() => ref
        .read(repairStepRepositoryProvider)
        .fetchRepairSteps(repairRequestIdx));

    return state.value as List<RepairStep>;
  }

  Future<bool> updateRepairStepStatus(String repairRequest,
      String repairStepIdx, RepairStepStatus status) async {
    String statusName = status.name.toLowerCase().replaceAll(" ", "_");
    state = await AsyncValue.guard(() => ref
        .read(repairStepRepositoryProvider)
        .updateRepairStepStatus(repairRequest, repairStepIdx, statusName));
    return !state.hasError;
  }

  Future<bool> completeRepair(String repairRequestIdx) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref
        .read(repairRequestRepositoryProvider)
        .updateRepairRequest(repairRequestIdx,
            {"status": RepairStepStatus.COMPLETE.name.toLowerCase()}));
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

@riverpod
Future<List<RepairStep>> fetchRepairSteps(
        FetchRepairStepsRef ref, String repairStepIdx) =>
    ref
        .watch(repairProgressScreenControllerProvider.notifier)
        .fetchRepairSteps(repairStepIdx);
