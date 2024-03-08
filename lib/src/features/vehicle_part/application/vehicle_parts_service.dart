// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
// import 'package:bato_mechanic/src/features/vehicle_part/data/vehicle_parts_repository.dart';
// import 'package:bato_mechanic/src/utils/model_utils.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../domain/vehicle_part/vehicle_part.dart';

// class VehiclePartsService {
//   VehiclePartsService({
//     required this.ref,
//   });
//   final Ref ref;

//   Future<List<VehiclePart>> fetchVehicleParts(String vehicleId) async {
//     final response = await ref
//         .watch(vehiclePartsRepositoryProvider)
//         .fetchVehicleParts(vehicleId);

//     if (response is Success) {
//       return response.response as List<VehiclePart>;
//     }
//     if (response is Failure) {
//       throw Exception('Something went wrong'.hardcoded());
//     }
//     return [];
//   }
// }

// final vehiclePartsServiceProvider = Provider((ref) {
//   final serviceProvider = VehiclePartsService(ref: ref);
//   return serviceProvider;
// });
