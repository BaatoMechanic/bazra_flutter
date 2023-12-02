import 'package:bato_mechanic/src/features/repair_request/domain/vehicle.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_part.dart';

final mTestVehicleParts = [
  VehiclePart(
    id: 1,
    name: "wheel",
    // image: http://localhost:8000/media/store/images/vehicle_part/wheel.png
    image: "assets/images/parts/wheel.png", vehicleCategoryId: 1,
    isMultiple: true,
  ),
  VehiclePart(
    id: 2,
    name: "engine",

    // image: http://localhost:8000/media/store/images/vehicle_part/engine.png
    image: "assets/images/parts/engine.png",
    vehicleCategoryId: 1, isMultiple: true,
  ),
  VehiclePart(
    id: 3,
    name: "body",

    // image: http://localhost:8000/media/store/images/vehicle_part/body.png
    image: "assets/images/parts/body.png",
    vehicleCategoryId: 1, isMultiple: true,
  )
];
