import 'dart:convert';

import 'repair_step_repository.dart';

class FakeRepairStepRepository extends RepairStepRepository {
  @override
  Future fetchRepairSteps(String repairStepIdx) async {
    return await Future.delayed(
      const Duration(seconds: 2),
      () => jsonEncode(
        [
          {
            "idx": "Mny3256qjXQtRPCkpUVTn6",
            "name": "Inception",
            "text_description": "Did the inception",
            "audio_description": null,
            "status": "pending",
            "report": {
              "idx": "ek8YjiGrjgArEF7YX6t9GK",
              "bill_images": [
                {
                  "idx": "DMCNzJ6svpWmBiAc4To4Ck",
                  "image": "assets/images/vehicle/bus.png"
                },
                {
                  "idx": "XfSqdMrvV75FNYfUkWHkJK",
                  "image": "assets/images/vehicle/car.png"
                }
              ]
            }
          }
        ],
      ),
    );
  }

  @override
  Future updateRepairStepStatus(
      String repairRequestIdx, String repairStepIdx, String status) async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => jsonEncode(
        {
          "idx": "Mny3256qjXQtRPCkpUVTn6",
          "name": "Inception",
          "text_description": "Did the inception",
          "audio_description": null,
          "status": "completed",
          "report": {
            "idx": "ek8YjiGrjgArEF7YX6t9GK",
            "bill_images": [
              {
                "idx": "DMCNzJ6svpWmBiAc4To4Ck",
                "image": "assets/images/vehicle/car.png"
              },
              {
                "idx": "XfSqdMrvV75FNYfUkWHkJK",
                "image": "assets/images/vehicle/bus.png"
              }
            ]
          }
        },
      ),
    );
  }
}
