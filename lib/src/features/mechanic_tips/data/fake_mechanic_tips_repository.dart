import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/features/mechanic_tips/data/mechanic_tips_repository.dart';
import 'package:bato_mechanic/src/features/profile/presentation/mechanic/mechanic_profile_screen.dart';

import '../../../utils/model_utils.dart';

class FakeMechanicTipsRepository implements MechanicTipsRepository {
  @override
  Future<dynamic> fetchMechanicTips() async {
    return await Future.delayed(
        Duration(seconds: 2),
        () => Success(
              code: HttpStatus.ok,
              response: json.encode([
                {
                  "idx": "3c7KfjTFvBTJBrQ39VjfbZ",
                  "tip":
                      "When working on a vehicle, take the time to thoroughly inspect and diagnose the problem before jumping into repairs. A proper diagnosis can save you time",
                  "mechanic": {
                    "idx": "4ebFHe3UfuBLr9WbEroijH",
                    "name": "Mechanic User",
                    "image": null
                  }
                },
                {
                  "idx": "XRgi7CzWz5ytoBuJZGVcUu",
                  "tip":
                      "Regular maintenance of these fluids can prevent potential issues and contribute to the overall health of your vehicle.",
                  "mechanic": {
                    "idx": "4ebFHe3UfuBLr9WbEroijH",
                    "name": "Mechanic User",
                    "image": null
                  }
                },
                {
                  "idx": "QmnwBgXNEz4bNWpPrDKd8P",
                  "tip":
                      "By paying attention to your tires and addressing issues promptly, you not only improve safety but also optimize fuel efficiency and extend the life of your tires",
                  "mechanic": {
                    "idx": "4ebFHe3UfuBLr9WbEroijH",
                    "name": "Mechanic User",
                    "image": null
                  }
                }
              ]),
            ));
  }
}
