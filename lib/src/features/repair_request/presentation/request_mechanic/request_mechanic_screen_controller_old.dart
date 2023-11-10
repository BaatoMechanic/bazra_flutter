// import 'dart:io';

// import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
// import 'package:bato_mechanic/src/features/repair_request/application/vechicle_category_service.dart';
// import 'package:bato_mechanic/src/features/repair_request/application/vechicles_service.dart';
// import 'package:bato_mechanic/src/features/repair_request/application/vehicle_parts_service.dart';
// import 'package:bato_mechanic/src/features/repair_request/data/vehicle_category_repository/vehicle_category_repository.dart';
// import 'package:bato_mechanic/src/features/repair_request/data/mechanic_repository/mechanic_repository.dart';
// import 'package:bato_mechanic/src/features/repair_request/domain/mechanic.dart';
// import 'package:bato_mechanic/src/features/repair_request/domain/vehicle.dart';
// import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_category.dart';
// import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';
// import 'package:bato_mechanic/src/features/repair_request/presentation/request_mechanic/repair_request_controller.dart';
// import 'package:bato_mechanic/src/features/repair_request/presentation/search_map/search_map_widget_controller.dart';
// import 'package:bato_mechanic/src/features/repair_request/presentation/vehicle_categories/vehicle_category_screen_controller.dart';
// import 'package:bato_mechanic/src/features/repair_request/presentation/vehicle_parts/vehicle_parts_screen_controller.dart';
// import 'package:bato_mechanic/src/features/repair_request/presentation/vehicles/vehicles_screen_controller.dart';
// import 'package:bato_mechanic/src/features/repair_request/presentation/vehicles/vehicles_state.dart';
// import 'package:bato_mechanic/src/utils/system_alerts_controller.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:video_player/video_player.dart';

// import '../../../../utils/model_utils.dart';
// import 'request_mechanic_state.dart';

// class RequestMechanicScreenController
//     extends StateNotifier<RequestMechanicState> {
//   RequestMechanicScreenController({required this.ref})
//       : super(
//           RequestMechanicState(
//             selectedImages: const AsyncValue.data([]),
//             selectedVideo: const AsyncValue.data(null),
//             preferredMechanic: const AsyncValue.data(null),
//           ),
//         );
//   final Ref ref;

//   Future<dynamic> _createRepairRequest(Map<String, dynamic> requestInfo) async {
//     var response = await ref
//         .read(repairRequestServiceProvider)
//         .createVehicleRepairRequest(requestInfo);
//     if (response is VehicleRepairRequest) {
//       ref
//           .read(repairRequestControllerProvider.notifier)
//           .setRepairRequest(response);
//     }
//     return response;
//   }

//   Future<bool> _addImagesToRepairRequest(
//       String requestId, List<File> images) async {
//     var response = await ref
//         .read(repairRequestServiceProvider)
//         .addImagesToVechicleRepairRequest(requestId, images);
//     if (response is VehicleRepairRequest) {
//       ref
//           .read(repairRequestControllerProvider.notifier)
//           .setRepairRequest(response);
//       return true;
//     }
//     return false;
//   }

//   Future<List<Mechanic>> fetchRecommendedMechanics() async {
//     final selectedCategory =
//         ref.read(vehicleCategoryServiceProvider).selectedVehicleCategory;
//     final selectedPart =
//         ref.read(vehiclePartsServiceProvider).selectedVehiclePart;
//     final result = await AsyncValue.guard(() => ref
//         .watch(mechanicRepositoryProvider)
//         .fetchRecommendedMechanics(
//             selectedCategory!.id.toString(), selectedPart!.id.toString()));
//     return result.value ?? [];
//   }

//   Future<void> pickImages() async {
//     final List<XFile> images = await ImagePicker().pickMultiImage(
//       imageQuality: 80, // Adjust the image quality as desired
//     );
//     final List<File> fileImages =
//         images.map((xFile) => File(xFile.path)).toList();
//     fileImages.addAll(state.selectedImages.value as List<File>);
//     state = state.copyWith(selectedImages: AsyncValue.data(fileImages));
//   }

//   removeSelectedImage(File image) {
//     state = state.copyWith(
//         selectedImages: AsyncValue.data(state.selectedImages.value!
//             .where((element) => element != image)
//             .toList()));
//   }

//   Future<void> setVideo(XFile video) async {
//     state = state.copyWith(selectedVideo: AsyncValue.data(File(video.path)));
//   }

//   setPreferredMechanic(Mechanic mechanic) {
//     state = state.copyWith(preferredMechanic: AsyncValue.data(mechanic));
//   }

//   Future<bool> requestForVehicleRepair(
//       String issueDescription, VideoPlayerController? videoController) async {
//     final customerRequestPosition =
//         ref.read(searchMapWidgetControllerProvider).markerPosition.value;
//     if (customerRequestPosition == null) {
//       state = state.copyWith(
//           value:
//               AsyncError("Please provide your location", StackTrace.current));
//       return false;
//     }
//     String coordinates =
//         '${customerRequestPosition.latitude},${customerRequestPosition.longitude}';

//     if (issueDescription.isEmpty) {
//       state = state.copyWith(
//           value: AsyncError(
//               "Please describe your issue in details", StackTrace.current));
//       return false;
//     }
//     if (state.selectedImages.value == null ||
//         state.selectedImages.value!.isEmpty) {
//       state = state.copyWith(
//           value: AsyncError("Please provide some images showing the issue",
//               StackTrace.current));
//       return false;
//     }
//     if (videoController == null) {
//       state = state.copyWith(
//           value: AsyncError(
//               "Please provide a video showing the issue", StackTrace.current));
//       return false;
//     }

//     // if (state.preferredMechanic.value == null) {
//     //   state = state.copyWith(
//     //       value: AsyncError(
//     //           "Please select your preferred mechanic", StackTrace.current));
//     //   return false;
//     // }

//     // _issueDescriptionFocusNode.unfocus();
//     Map<String, dynamic> requestData = {
//       "customer": 1,
//       // "preferred_mechanic": _preferedMechanic!.id,
//       "preferred_mechanic": "1",
//       // "location_name":
//       //     ref.read(searchMapWidgetControllerProvider).selectedPlaceName,
//       "location_name": " Test location",
//       "location_coordinates": coordinates,
//       // "vehicle": ref.read(vehiclesScreenControllerProvider).selectedVehicle!.id,
//       "vehicle": ref.read(vehicleServiceProvider).selectedVehicle!.id,
//       "vehicle_part":
//           ref.read(vehiclePartsServiceProvider).selectedVehiclePart!.id,
//       "description": issueDescription,
//     };
//     ref
//         .read(systemAlertProvider.notifier)
//         .setAlertMessage("Requesting for vehicle repair");

//     final response = await _createRepairRequest(requestData);
//     if (response is VehicleRepairRequest) {
//       ref.read(systemAlertProvider.notifier).setAlertMessage("Adding images");

//       if (await _addImagesToRepairRequest(
//           response.id.toString(), state.selectedImages.value!)) {
//         return true;
//       }
//     }
//     return false;
//   }
// }

// final requestMechanicScreenControllerProvider = StateNotifierProvider
//     .autoDispose<RequestMechanicScreenController, RequestMechanicState>(
//   (ref) => RequestMechanicScreenController(ref: ref),
// );

// final fetchRecommendedMechanicsProvider =
//     FutureProvider.autoDispose<List<Mechanic>>((ref) {
//   final requestMechanicController =
//       ref.watch(requestMechanicScreenControllerProvider.notifier);
//   return requestMechanicController.fetchRecommendedMechanics();
// });
