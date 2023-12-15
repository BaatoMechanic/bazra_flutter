import 'dart:io';

import 'package:bato_mechanic/src/features/auth/domain/user.dart';
import 'package:bato_mechanic/src/features/repair_request/application/service_type_service.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/core/application/mechanic_service.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/repair_request/application/vechicle_category_service.dart';
import 'package:bato_mechanic/src/features/repair_request/application/vechicles_service.dart';
import 'package:bato_mechanic/src/features/repair_request/application/vehicle_parts_service.dart';
import 'package:bato_mechanic/src/features/repair_request/data/vehicle_category_repository/vehicle_category_repository.dart';
import 'package:bato_mechanic/src/features/core/data/mechanic_repository/mechanic_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_category.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/repair_request_controller.dart';

import 'package:bato_mechanic/src/features/repair_request/presentation/vehicle_categories/vehicle_category_screen_controller.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/vehicle_parts/vehicle_parts_screen_controller.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/vehicles/vehicles_screen_controller.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/vehicles/vehicles_state.dart';
import 'package:bato_mechanic/src/utils/system_alerts_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/model_utils.dart';
import '../../../core/domain/user_position.dart';
import 'request_mechanic_state.dart';

class RequestMechanicScreenController
    extends StateNotifier<RequestMechanicState> {
  RequestMechanicScreenController({required this.ref})
      : super(
          RequestMechanicState(
            selectedImages: const AsyncValue.data([]),
            selectedVideo: const AsyncValue.data(null),
            preferredMechanic: const AsyncValue.data(null),
            selectedPosition: null,
          ),
        );
  final Ref ref;

  Future<dynamic> _createRepairRequest(Map<String, dynamic> requestInfo) async {
    var response = await AsyncValue.guard(() => ref
        .read(repairRequestServiceProvider)
        .createVehicleRepairRequest(requestInfo));
    state = state.copyWith(value: response);
    if (response.value is VehicleRepairRequest) {
      ref
          .read(repairRequestServiceProvider)
          .setActiveRepairRequest(response.value);
      response.value;
    }
    return response.value;
  }

  Future<bool> _addImagesToRepairRequest(
      String requestId, List<File> images) async {
    state = state.copyWith(value: const AsyncLoading());
    var response = await AsyncValue.guard(() => ref
        .read(repairRequestServiceProvider)
        .addImagesToVechicleRepairRequest(requestId, images));
    if (response.value is VehicleRepairRequest) {
      ref
          .read(repairRequestServiceProvider)
          .setActiveRepairRequest(response.value);
      state = state.copyWith(selectedImages: AsyncData(images));
      return true;
    }
    state = state.copyWith(
        value: AsyncError("Error adding Images", StackTrace.current));
    return false;
  }

  Future<List<User>> fetchRecommendedMechanics() async {
    final selectedCategory =
        ref.read(vehicleCategoryServiceProvider).selectedVehicleCategory;
    final selectedPart =
        ref.read(vehiclePartsServiceProvider).selectedVehiclePart;
    final result = await AsyncValue.guard(
        () => ref.watch(mechanicServiceProvider).fetchRecommendedMechanics(
            // selectedCategory!.id.toString(), selectedPart!.id.toString()));
            "1",
            "1"));
    // .fetchRecommendedMechanics("1", "1"));
    state = state.copyWith(value: result);
    if (result.hasValue) {
      return result.value!;
    } else {
      return [];
    }
  }

  Future<void> pickImages() async {
    final List<XFile> images = await ImagePicker().pickMultiImage(
      imageQuality: 80, // Adjust the image quality as desired
    );
    final List<File> fileImages =
        images.map((xFile) => File(xFile.path)).toList();
    fileImages.addAll(state.selectedImages.value as List<File>);
    state = state.copyWith(
      selectedImages: AsyncValue.data(fileImages),
      value: const AsyncData(null),
    );
  }

  removeSelectedImage(File image) {
    state = state.copyWith(
      selectedImages: AsyncValue.data(state.selectedImages.value!
          .where((element) => element != image)
          .toList()),
      value: const AsyncData(null),
    );
  }

  Future<void> setVideo(XFile video) async {
    state = state.copyWith(
      selectedVideo: AsyncValue.data(File(video.path)),
      value: const AsyncData(null),
    );
    state = state.copyWith();
  }

  setPreferredMechanic(User mechanic) {
    state = state.copyWith(preferredMechanic: AsyncValue.data(mechanic));
  }

  setSelectedPosition(UserPosition position) {
    state = state.copyWith(selectedPosition: position);
  }

  UserPosition? get selectedPosition => state.selectedPosition;

  Future<bool> requestForVehicleRepair(
      String issueDescription, VideoPlayerController? videoController) async {
    // final customerRequestPosition =
    //     ref.read(searchMapWidgetControllerProvider).markerPosition.value;
    // if (customerRequestPosition == null) {
    //   state = state.copyWith(
    //       value:
    //           AsyncError("Please provide your location", StackTrace.current));
    //   return false;
    // }
    // String coordinates =
    //     '${customerRequestPosition.latitude},${customerRequestPosition.longitude}';

    if (selectedPosition == null) {
      state = state.copyWith(
          value:
              AsyncError("Please provide your location", StackTrace.current));
      return false;
    }

    if (issueDescription.isEmpty) {
      state = state.copyWith(
          value: AsyncError(
              "Please describe your issue in details", StackTrace.current));
      return false;
    }
    if (state.selectedImages.value == null ||
        state.selectedImages.value!.isEmpty) {
      state = state.copyWith(
          value: AsyncError(
              "Please provide some images showing the issue".hardcoded(),
              StackTrace.current));
      return false;
    }
    if (videoController == null) {
      state = state.copyWith(
        value: AsyncError(
          "Please provide a video showing the issue",
          StackTrace.current,
        ),
      );
      return false;
    }

    // if (state.preferredMechanic.value == null) {
    //   state = state.copyWith(
    //       value: AsyncError(
    //           "Please select your preferred mechanic", StackTrace.current));
    //   return false;
    // }

    // _issueDescriptionFocusNode.unfocus();
    Map<String, dynamic> requestData = {
      "customer": 1,
      // "preferred_mechanic": _preferedMechanic!.id,
      "preferred_mechanic": "1",
      // "location_name":
      //     ref.read(searchMapWidgetControllerProvider).selectedPlaceName,
      "location_name": " Test location",
      "selected_location": selectedPosition!.toJson(),
      // "location_coordinates": coordinates,
      // "vehicle": ref.read(vehicleServiceProvider).selectedVehicle!.id,
      "vehicle_type":
          ref.read(vehicleCategoryServiceProvider).selectedVehicleCategory!.id,

      // "vehicle_part":
      //     ref.read(vehiclePartsServiceProvider).selectedVehiclePart!.id,
      "service_type": ref.read(serviceTypeServiceProvider).selectedServiceType,

      "description": issueDescription,
    };
    ref
        .read(systemAlertProvider.notifier)
        .setAlertMessage("Requesting for vehicle repair");

    final response = await _createRepairRequest(requestData);
    if (response is VehicleRepairRequest) {
      ref.read(systemAlertProvider.notifier).setAlertMessage("Adding images");

      if (await _addImagesToRepairRequest(
          response.idx.toString(), state.selectedImages.value!)) {
        // When repair request has been successfully created then fetch the additional infos like mechanicinfo, customerInfo, vehicleInfo, etc
        ref.read(mechanicServiceProvider).fetchAssignedMechanic(ref
            .read(repairRequestServiceProvider)
            .activeRepairRequest!
            .assignedMechanicIdx
            .toString());
        return true;
      }
    }
    return false;
  }
}

final requestMechanicScreenControllerProvider = StateNotifierProvider
    .autoDispose<RequestMechanicScreenController, RequestMechanicState>(
  (ref) => RequestMechanicScreenController(ref: ref),
);

final fetchRecommendedMechanicsProvider =
    FutureProvider.autoDispose<List<User>>((ref) {
  final requestMechanicController =
      ref.watch(requestMechanicScreenControllerProvider.notifier);
  return requestMechanicController.fetchRecommendedMechanics();
});
