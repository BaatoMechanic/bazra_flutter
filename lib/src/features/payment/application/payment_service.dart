// import 'package:bato_mechanic/src/features/payment/data/payment_repository.dart';
// import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
// import 'package:bato_mechanic/src/features/repair_request/data/remote/repair_request_repository/repair_request_repository.dart';
// import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';
// import 'package:bato_mechanic/src/utils/model_utils.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class PaymentService {
//   PaymentService({required this.ref});

//   final Ref ref;
//   final VehicleRepairRequest repairRequest;

//   Future<bool> payWithEsewa() async {
//     var response = await ref.read(paymentRepositoryProvider).payWithEsewa();
//     if (response is Success) {
      
//       ref.read(repairRequestServiceProvider).setActiveRepairRequest(
//           request!.copyWith(status: VehicleRepairRequestStatus.IN_PROGRESS));
//       return true;
//     }

//     return false;
//   }

//   Future<bool> payWithKhalti() async {
//     var response = await ref.read(paymentRepositoryProvider).payWithKhalti();
//     if (response is Success) {
//       VehicleRepairRequest? request =
//           ref.watch(repairRequestRepositoryProvider).activeRepairRequest;
//       ref.read(repairRequestServiceProvider).setActiveRepairRequest(
//           request!.copyWith(status: VehicleRepairRequestStatus.IN_PROGRESS));
//       return true;
//     }

//     return false;
//   }
// }

// final paymentServiceProvider =
//     Provider<PaymentService>((ref) => PaymentService(ref: ref));
