import 'package:bato_mechanic/src/features/repair_request/domain/vehicle.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_part.dart';

final mTestVehicleParts = [
  VehiclePart(
    id: 1,
    name: "wheel",
    vehicleId: 1,
    // image: http://localhost:8000/media/store/images/vehicle_part/wheel.png
    image: "assets/images/parts/wheel.png",
  ),
  VehiclePart(
    id: 2,
    name: "engine",
    vehicleId: 1,
    // image: http://localhost:8000/media/store/images/vehicle_part/engine.png
    image: "assets/images/parts/engine.png",
  ),
  VehiclePart(
    id: 3,
    name: "body",
    vehicleId: 1,
    // image: http://localhost:8000/media/store/images/vehicle_part/body.png
    image: "assets/images/parts/body.png",
  )
];
