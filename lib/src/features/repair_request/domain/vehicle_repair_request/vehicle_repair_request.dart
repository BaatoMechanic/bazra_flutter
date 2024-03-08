
import 'package:freezed_annotation/freezed_annotation.dart';

part "vehicle_repair_request.freezed.dart";
part "vehicle_repair_request.g.dart";

enum VehicleRepairRequestStatus {
  @JsonValue("pending")
  PENDING,
  @JsonValue("waiting_for_user_acceptance")
  WAITING_FOR_USER_ACCEPTANCE,
  @JsonValue("waiting_for_advance_payment")
  WAITING_FOR_ADVANCE_PAYMENT,
  @JsonValue("waiting_for_mechanic")
  WAITING_FOR_MECHANIC,
  @JsonValue("in_progress")
  IN_PROGRESS,
  @JsonValue("halt")
  HALT,
  @JsonValue("waiting_for_completion_acceptance")
  WAITING_FOR_COMPLETION_ACCEPTANCE,
  @JsonValue("complete")
  COMPLETE,
  @JsonValue("cancelled")
  CANCELLED
}

enum AdvancePaymentStatus {
  @JsonValue("pending")
  PENDING,
  @JsonValue("complete")
  COMPLETE,
  @JsonValue("payment_on_arrival")
  PAYMENT_ON_ARRIVAL,
}

List<VehicleRepairRequest> vehicleRepairRequestsFromJson(
        List<dynamic> jsonList) =>
    List<VehicleRepairRequest>.from(jsonList.map(
        (item) => VehicleRepairRequest.fromJson(item as Map<String, dynamic>)));

@freezed
class VehicleRepairRequest with _$VehicleRepairRequest {
  const factory VehicleRepairRequest({
    required String idx,
    required String? title,
    required String? description,
    @JsonKey(name: "user") required String userIdx,
    @JsonKey(name: "vehicle_type") required String vehicleCategoryIdx,
    @JsonKey(name: "service_type") required String serviceTypeIdx,
    @JsonKey(name: "preferred_mechanic") required String? preferredMechanicIdx,
    @JsonKey(name: "assigned_mechanic") required String? assignedMechanicIdx,
    required Map<String, dynamic>? location,
    required VehicleRepairRequestStatus status,
    @JsonKey(name: "advance_payment_status")
    required AdvancePaymentStatus advancePaymentStatus,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _VehicleRepairRequest;

  factory VehicleRepairRequest.fromJson(Map<String, dynamic> json) =>
      _$VehicleRepairRequestFromJson(json);
}

@freezed
class VehicleRepairRequestImage with _$VehicleRepairRequestImage {
  const factory VehicleRepairRequestImage({
    required int id,
    required String image,
  }) = _VehicleRepairRequestImage;

  factory VehicleRepairRequestImage.fromJson(Map<String, dynamic> json) =>
      _$VehicleRepairRequestImageFromJson(json);
}

@freezed
class VehicleRepairRequestVideo with _$VehicleRepairRequestVideo {
  const factory VehicleRepairRequestVideo({
    required int id,
    required String video,
  }) = _VehicleRepairRequestVideo;

  factory VehicleRepairRequestVideo.fromJson(Map<String, dynamic> json) =>
      _$VehicleRepairRequestVideoFromJson(json);
}
