// To parse this JSON data, do
//
//     final vehicleRepairRequest = vehicleRepairRequestFromJson(jsonString);

import 'dart:convert';

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
  WAITING_COMPLETION_ACCEPTANCE,
  COMPLETED,
  CANCELLED
}

class VehicleRepairRequest {
  int id;
  int customerId;
  int? preferredMechanicId;
  int? assignedMechanicId;
  String locationName;
  String locationCoordinates;
  int vehicleId;
  int vehiclePartId;
  String? title;
  String? description;
  List<VehicleRepairRequestImage> images;
  List<VehicleRepairRequestVideo> videos;
  VehicleRepairRequestStatus status;
  DateTime createdAt;

  VehicleRepairRequest({
    required this.id,
    required this.customerId,
    this.preferredMechanicId,
    this.assignedMechanicId,
    required this.locationName,
    required this.locationCoordinates,
    required this.vehicleId,
    required this.vehiclePartId,
    required this.title,
    required this.description,
    required this.images,
    required this.videos,
    required this.status,
    required this.createdAt,
  });

  factory VehicleRepairRequest.fromJson(Map<String, dynamic> json) =>
      VehicleRepairRequest(
        id: json["id"],
        customerId: json["customer"],
        preferredMechanicId: json["preferred_mechanic"],
        assignedMechanicId: json["assigned_mechanic"],
        locationName: json["location_name"],
        locationCoordinates: json["location_coordinates"],
        vehicleId: json["vehicle"],
        vehiclePartId: json["vehicle_part"],
        title: json["title"],
        description: json["description"],
        images: List<VehicleRepairRequestImage>.from(
            json["images"].map((x) => VehicleRepairRequestImage.fromJson(x))),
        videos: List<VehicleRepairRequestVideo>.from(
            json["videos"].map((x) => VehicleRepairRequestVideo.fromJson(x))),
        // status: json['status'],
        status: vehicleRepairRequestStatusFromJson(json['status']),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer": customerId,
        "preferred_mechanic": preferredMechanicId,
        "assigned_mechanic": assignedMechanicId,
        "location_name": locationName,
        "location_coordinates": locationCoordinates,
        "vehicle": vehicleId,
        "vehicle_part": vehiclePartId,
        "title": title,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
        "status": status,
        "created_at": createdAt.toIso8601String(),
      };

  // Function to convert a JSON value to the enum
  static VehicleRepairRequestStatus vehicleRepairRequestStatusFromJson(
      String status) {
    switch (status) {
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
      case "WAITING_COMPLETION_ACCEPTANCE":
        return VehicleRepairRequestStatus.WAITING_COMPLETION_ACCEPTANCE;
      case "COMPLETED":
        return VehicleRepairRequestStatus.COMPLETED;
      case "CANCELLED":
        return VehicleRepairRequestStatus.CANCELLED;
      default:
        // Handle unknown or unsupported values
        // throw Exception("Unsupported status value: $status");
        return VehicleRepairRequestStatus.PENDING;
    }
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
