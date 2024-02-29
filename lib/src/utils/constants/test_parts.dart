import 'package:bato_mechanic/src/features/vehicle_part/domain/vehicle_part/vehicle_part.dart';

final mTestVehicleParts = [
  VehiclePart(
    idx: "1",
    name: "wheel",
    // image: http://localhost:8000/media/store/images/vehicle_part/wheel.png
    image: "assets/images/parts/wheel.png", vehicleCategoryIdx: "1",
    isMultiple: true,
  ),
  VehiclePart(
    idx: "2",
    name: "engine",

    // image: http://localhost:8000/media/store/images/vehicle_part/engine.png
    image: "assets/images/parts/engine.png",
    vehicleCategoryIdx: "1", isMultiple: true,
  ),
  VehiclePart(
    idx: "3",
    name: "body",

    // image: http://localhost:8000/media/store/images/vehicle_part/body.png
    image: "assets/images/parts/body.png",
    vehicleCategoryIdx: "1", isMultiple: true,
  )
];
