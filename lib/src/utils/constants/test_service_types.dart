import 'dart:developer';

import 'package:bato_mechanic/src/common/core/domain/service_type.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_part.dart';
import 'package:bato_mechanic/src/utils/enums/service_type_options.dart';

// final mTestServiceTypes = [
//   ServiceType.BODY_REPAIR,
//   ServiceType.ENGINE_REPAIR,
//   ServiceType.ELECTRICAL_REPAIR,
//   ServiceType.WHEEL_REPAIR,
//   ServiceType.PAINTING,
//   ServiceType.OTHER
// ];

final mTestServiceTypes = [
  ServiceType(
      id: '1',
      name: 'Painting',
      type: ServiceTypeOption.PAINTING,
      partsIncluded: [
        VehiclePart(
          id: 1,
          name: "Frame",
          vehicleCategoryId: 1,
          image: 'assets/images/body.png',
          isMultiple: false,
        ),
      ]),
  ServiceType(
      id: '1',
      name: 'Wiring',
      type: ServiceTypeOption.ELECTRICAL_REPAIR,
      partsIncluded: [
        VehiclePart(
          id: 1,
          name: "Body",
          vehicleCategoryId: 1,
          image: 'assets/images/body.png',
          isMultiple: false,
        ),
      ]),
  ServiceType(
      id: '1',
      name: 'Wheel Repair',
      type: ServiceTypeOption.WHEEL_REPAIR,
      partsIncluded: [
        VehiclePart(
          id: 1,
          name: "Body",
          vehicleCategoryId: 1,
          image: 'assets/images/wheel.png',
          isMultiple: false,
        ),
      ]),
  ServiceType(
      id: '1',
      name: 'Engine Repair',
      type: ServiceTypeOption.ENGINE_REPAIR,
      partsIncluded: [
        VehiclePart(
          id: 1,
          name: "Engine",
          vehicleCategoryId: 1,
          image: 'assets/images/engine.png',
          isMultiple: false,
        ),
      ])
];
