import 'dart:io';

import 'package:bato_mechanic/src/features/repair_request/application/providers.dart';

import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request/vehicle_repair_request.dart';

import 'package:bato_mechanic/src/utils/system_alerts_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../auth/domain/mechanic/mechanic.dart';
import 'request_mechanic_state.dart';

class RequestMechanicScreenController
    extends StateNotifier<RequestMechanicState> {
  RequestMechanicScreenController({required this.ref})
      : super(
          RequestMechanicState(
            selectedImages: [],
            selectedVideo: null,
            preferredMechanic: null,
            selectedLocation: const {},
          ),
        );
  final Ref ref;

  Future<VehicleRepairRequest?> _createRepairRequest(
      Map<String, dynamic> requestInfo) async {
    state = state.copyWith(value: const AsyncLoading());
    final response = await AsyncValue.guard(() => ref
        .read(repairRequestServiceProvider)
        .createVehicleRepairRequest(requestInfo));
    state = state.copyWith(value: const AsyncData(null));
    return response.value;
  }

  Future<bool> _addImagesToRepairRequest(
      String requestId, List<File> images) async {
    state = state.copyWith(selectedImages: images);
    state = state.copyWith(value: const AsyncLoading());

    final response = await AsyncValue.guard(() => ref
        .read(repairRequestServiceProvider)
        .addImagesToVechicleRepairRequest(requestId, images));

    if (response.hasError) {
      state = state.copyWith(
          value: AsyncError("Error adding Images", StackTrace.current));
      return false;
    }

    return true;
  }

  // Future<List<User>> fetchRecommendedMechanics(
  //     String vehicleCategoryIdx, String serviceIdx) async {
  //   state = state.copyWith(value: const AsyncLoading());
  //   final result = await AsyncValue.guard(
  //       () => ref.watch(mechanicServiceProvider).fetchRecommendedMechanics(
  //             vehicleCategoryIdx,
  //             serviceIdx,
  //           ));
  //   state = state.copyWith(value : result);
  //   if (result.hasValue) {
  //     return result.value!;
  //   } else {
  //     return [];
  //   }
  // }

  Future<void> pickImages() async {
    final List<XFile> images = await ImagePicker().pickMultiImage(
      imageQuality: 80, // Adjust the image quality as desired
    );
    final List<File> fileImages =
        images.map((xFile) => File(xFile.path)).toList();
    fileImages.addAll(state.selectedImages);
    state = state.copyWith(
      selectedImages: fileImages,
      value: const AsyncData(null),
    );
  }

  removeSelectedImage(File image) {
    state = state.copyWith(
      selectedImages:
          state.selectedImages.where((element) => element != image).toList(),
      value: const AsyncData(null),
    );
  }

  Future<void> setVideo(XFile video) async {
    state = state.copyWith(
      selectedVideo: File(video.path),
      value: const AsyncData(null),
    );
    state = state.copyWith();
  }

  setPreferredMechanic(Mechanic mechanic) {
    state = state.copyWith(preferredMechanic: mechanic);
  }

  setSelectedLocation(Map<String, dynamic> location) {
    state = state.copyWith(selectedLocation: location);
  }

  Map<String, dynamic>? get selectedLocation => state.selectedLocation;

  Future<VehicleRepairRequest?> requestForVehicleRepair(String issueTitle,
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

    if (selectedLocation == null) {
      state = state.copyWith(
          value:
              AsyncError("Please provide your location", StackTrace.current));
      return null;
    }

    if (issueTitle.isEmpty) {
      state = state.copyWith(
          value: AsyncError(
              "Please give a title to your issue", StackTrace.current));
      return null;
    }
    if (issueDescription.isEmpty) {
      state = state.copyWith(
          value: AsyncError(
              "Please describe your issue in details", StackTrace.current));
      return null;
    }
    if (state.selectedImages.isEmpty) {
      state = state.copyWith(
          value: AsyncError(
              "Please provide some images showing the issue".hardcoded(),
              StackTrace.current));
      return null;
    }
    if (videoController == null) {
      state = state.copyWith(
        value: AsyncError(
          "Please provide a video showing the issue",
          StackTrace.current,
        ),
      );
      return null;
    }

    // if (state.preferredMechanic.value == null) {
    //   state = state.copyWith(
    //       value: AsyncError(
    //           "Please select your preferred mechanic", StackTrace.current));
    //   return false;
    // }

    // _issueDescriptionFocusNode.unfocus();
    Map<String, dynamic> requestData = {
      "title": issueTitle,
      "preferred_mechanic": state.preferredMechanic?.toJson(),

      "location_name": " Test location",
      // "selected_location": selectedPosition!.toJson(),
      "location": selectedLocation,
      // "location_coordinates": coordinates,
      // "vehicle": ref.read(vehicleServiceProvider).selectedVehicle!.id,
      "vehicle_type": ref.read(selectedVehicleCategoryProvider)?.idx,

      // "vehicle_part":
      //     ref.read(vehiclePartsServiceProvider).selectedVehiclePart!.id,
      "service_type": ref.read(selectedServiceProvider)?.idx,

      "description": issueDescription,
    };
    ref
        .read(systemAlertProvider.notifier)
        .setAlertMessage("Requesting for vehicle repair");

    final response = await _createRepairRequest(requestData);
    if (response is VehicleRepairRequest) {
      ref.read(systemAlertProvider.notifier).setAlertMessage("Adding images");

      if (await _addImagesToRepairRequest(
          response.idx.toString(), state.selectedImages)) {
        // When repair request has been successfully created then fetch the additional infos like mechanicinfo, customerInfo, vehicleInfo, etc
        // ref.read(mechanicServiceProvider).fetchAssignedMechanic(ref
        //     .read(fakeRepairRequestRepositoryProvider)
        //     .activeRepairRequest!
        //     .assignedMechanicIdx
        //     .toString());
        return response;
      }
    }
    return null;
  }
}

final requestMechanicScreenControllerProvider = StateNotifierProvider
    .autoDispose<RequestMechanicScreenController, RequestMechanicState>(
  (ref) => RequestMechanicScreenController(ref: ref),
);
