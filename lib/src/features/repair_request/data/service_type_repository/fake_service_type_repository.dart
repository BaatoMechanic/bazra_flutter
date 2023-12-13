import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/features/repair_request/data/service_type_repository/service_type_repository.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:http/http.dart';

class FakeServiceTypeRepository implements ServiceTypeRepository {
  @override
  Future fetchAllServiceTypes() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => Success(
        code: HttpStatus.ok,
        response: json.encode([
          {
            "idx": "BWFdwSq9j2CZMh6wwRfwNm",
            "name": "Painting",
            "description": "Denting Painting",
            "type": "painting",
            "image":
                "http://localhost:8000/media/service_image/3350063-200.png",
            "parts_included": [
              "mNyhe7hNaDL3MpqtkofyS5",
              "mNyhe7hNfDL3MpqtkofyS5",
            ]
          },
          {
            "idx": "BWFdwSq9j2CZMh6wwRfwNr",
            "name": "Engine Repair",
            "description": "Engine repair",
            "type": "engine_repair",
            "image":
                "http://localhost:8000/media/service_image/3350063-200.png",
            "parts_included": ["mNyhe7hNaDL3MpqtkofyS5"]
          },
          {
            "idx": "BWFdbSq9j2CZMh6wwRfwNr",
            "name": "Wheel Repair",
            "description": "Wheel Repair",
            "type": "wheel_repair",
            "image":
                "http://localhost:8000/media/service_image/3350063-200.png",
            "parts_included": [
              "mNyhe7hNaDL3MpqtkofyS5",
            ]
          }
        ]),
      ),
    );
  }
}
