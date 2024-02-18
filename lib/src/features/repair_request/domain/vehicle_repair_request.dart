// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final vehicleRepairRequest = vehicleRepairRequestFromJson(jsonString);

import 'dart:convert';

import 'package:bato_mechanic/src/features/core/domain/user_position.dart';

VehicleRepairRequest vehicleRepairRequestFromJson(String str) =>
    VehicleRepairRequest.fromJson(json.decode(str));

List<VehicleRepairRequest> vehicleRepairRequestsFromJson(String str) =>
    List<VehicleRepairRequest>.from(json.decode(str).map((x) {
      return VehicleRepairRequest.fromJson(x);
    }));

String vehicleRepairRequestToJson(VehicleRepairRequest data) =>
    json.encode(data.toJson());

enum VehicleRepairRequestStatus {
  PENDING,
  WAITING_FOR_USER_ACCEPTANCE,
  WAITING_FOR_ADVANCE_PAYMENT,
  WAITING_FOR_MECHANIC,
  IN_PROGRESS,
  HALT,
  WAITING_FOR_COMPLETION_ACCEPTANCE,
  COMPLETE,
  CANCELLED
}

enum AdvancePaymentStatus { PENDING, COMPLETE, PAYMENT_ON_ARRIVAL }

class VehicleRepairRequest {
  VehicleRepairRequest({
    required this.idx,
    this.title,
    this.description,
    required this.userIdx,
    required this.vehicleCategoryIdx,
    required this.serviceTypeIdx,
    this.preferredMechanicIdx,
    this.assignedMechanicIdx,
    this.location,
    required this.status,
    required this.advancePaymentStatus,
    required this.createdAt,
  });

  String idx;
  String? title;
  String? description;
  String userIdx;
  String vehicleCategoryIdx;
  // String vehiclePartIdx;
  String serviceTypeIdx;
  String? preferredMechanicIdx;
  String? assignedMechanicIdx;
  Map<String, dynamic>? location;
  VehicleRepairRequestStatus status;
  AdvancePaymentStatus advancePaymentStatus;
  DateTime createdAt;

  factory VehicleRepairRequest.fromJson(Map<String, dynamic> json) =>
      VehicleRepairRequest(
          idx: json["idx"],
          userIdx: json["user"],
          preferredMechanicIdx: json["preferred_mechanic"],
          assignedMechanicIdx: json["assigned_mechanic"],
          vehicleCategoryIdx: json["vehicle_type"],
          // vehiclePartIdx: json["vehicle_part"],
          serviceTypeIdx: json["service_type"],
          title: json["title"],
          description: json["description"],
          // images: List<VehicleRepairRequestImage>.from(
          //     json["images"].map((x) => VehicleRepairRequestImage.fromJson(x))),
          // videos: List<VehicleRepairRequestVideo>.from(
          //     json["videos"].map((x) => VehicleRepairRequestVideo.fromJson(x))),
          location: json["location"],
          status: vehicleRepairRequestStatusFromJson(json['status']),
          advancePaymentStatus:
              advancePaymentStatusFromJson(json["advance_payment_status"]),
          createdAt: DateTime.parse(json["created_at"]));

  Map<String, dynamic> toJson() => {
        "id": idx,
        "customer": userIdx,
        "preferred_mechanic": preferredMechanicIdx,
        "assigned_mechanic": assignedMechanicIdx,

        "vehicle": vehicleCategoryIdx,
        // "vehicle_part": vehiclePartIdx,
        "service_type": serviceTypeIdx,
        "title": title,
        "description": description,
        // "images": List<dynamic>.from(images.map((x) => x.toJson())),
        // "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
        "location": location,

        "status": status,
        "advance_payment_status": advancePaymentStatus,
        "created_at": createdAt.toIso8601String(),
      };

  // Function to convert a JSON value to the enum
  static VehicleRepairRequestStatus vehicleRepairRequestStatusFromJson(
      String status) {
    switch (status.toUpperCase()) {
      case "PENDING":
        return VehicleRepairRequestStatus.PENDING;
      case "WAITING_FOR_ADVANCE_PAYMENT":
        return VehicleRepairRequestStatus.WAITING_FOR_ADVANCE_PAYMENT;
      case "WAITING_FOR_USER_ACCEPTANCE":
        return VehicleRepairRequestStatus.WAITING_FOR_USER_ACCEPTANCE;
      case "WAITING_FOR_MECHANIC":
        return VehicleRepairRequestStatus.WAITING_FOR_MECHANIC;
      case "IN_PROGRESS":
        return VehicleRepairRequestStatus.IN_PROGRESS;
      case "HALT":
        return VehicleRepairRequestStatus.HALT;
      case "WAITING_FOR_COMPLETION_ACCEPTANCE":
        return VehicleRepairRequestStatus.WAITING_FOR_COMPLETION_ACCEPTANCE;
      case "COMPLETE":
        return VehicleRepairRequestStatus.COMPLETE;
      case "CANCELLED":
        return VehicleRepairRequestStatus.CANCELLED;
      default:
        // Handle unknown or unsupported values
        // throw Exception("Unsupported status value: $status");
        return VehicleRepairRequestStatus.PENDING;
    }
  }

  static AdvancePaymentStatus advancePaymentStatusFromJson(String status) {
    switch (status.toUpperCase()) {
      case "PENDING":
        return AdvancePaymentStatus.PENDING;
      case "COMPLETE":
        return AdvancePaymentStatus.COMPLETE;
      case "PAYMENT_ON_ARRIVAL":
        return AdvancePaymentStatus.PAYMENT_ON_ARRIVAL;
      default:
        // Handle unknown or unsupported values
        // throw Exception("Unsupported status value: $status");
        return AdvancePaymentStatus.PENDING;
    }
  }

  VehicleRepairRequest copyWith({
    int? id,
    int? customerId,
    int? preferredMechanicId,
    int? assignedMechanicId,
    int? vehicleId,
    // int? vehiclePartId,
    int? serviceTypeId,
    String? title,
    String? description,
    Map<String, dynamic>? location,
    UserPosition? mechanicLocation,
    List<VehicleRepairRequestImage>? images,
    List<VehicleRepairRequestVideo>? videos,
    DateTime? createdAt,
    VehicleRepairRequestStatus? status,
    AdvancePaymentStatus? advancePaymentStatus,
  }) {
    return VehicleRepairRequest(
      idx: idx,
      userIdx: userIdx,
      preferredMechanicIdx: preferredMechanicIdx,
      assignedMechanicIdx: assignedMechanicIdx,
      vehicleCategoryIdx: vehicleCategoryIdx,
      // vehiclePartIdx: vehiclePartIdx,
      serviceTypeIdx: serviceTypeIdx,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,

      // images: images ?? this.images,
      // videos: videos ?? this.videos,
      // createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      advancePaymentStatus: advancePaymentStatus ?? this.advancePaymentStatus,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class VehicleRepairRequestImage {
  int id;
  String image;

  VehicleRepairRequestImage({
    required this.id,
    required this.image,
  });

  factory VehicleRepairRequestImage.fromJson(Map<String, dynamic> json) =>
      VehicleRepairRequestImage(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class VehicleRepairRequestVideo {
  int id;
  String video;

  VehicleRepairRequestVideo({
    required this.id,
    required this.video,
  });

  factory VehicleRepairRequestVideo.fromJson(Map<String, dynamic> json) =>
      VehicleRepairRequestVideo(
        id: json["id"],
        video: json["video"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "video": video,
      };
}

class VehicleRepairRequestError {
  int code;
  Object message;

  VehicleRepairRequestError({required this.code, required this.message});
}
