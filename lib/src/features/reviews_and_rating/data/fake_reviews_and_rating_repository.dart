import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/utils/model_utils.dart';

import 'reviews_and_rating_repository.dart';

class FakeReviewsAndRatingRepository implements ReviewsAndRatingRepository {
  @override
  Future<dynamic> fetchMechanicReviews(String mechanicIdx) async {
    await Future.delayed(const Duration(seconds: 0));
    return Success(
      code: HttpStatus.accepted,
      response: json.encode(
        [
          {
            "idx": "2teLib4wdX5nRn7yo2yWbG",
            "rating": 4.5,
            "review":
                "That was a great service. He just magically started my vehicle on the fly",
            "reviewer": "itLGCnD7vf9P7eucZf3Kgo",
            "reviewed": "4ebFHe3UfuBLr9WbEroijH",
            "created_at": "2023-12-05T18:26:03.173890Z"
          },
          {
            "idx": "iUmBNyPBgDKK8GX652tRyC",
            "rating": 2.0,
            "review":
                "I got very good service from this same user previous time. But this time, he was a trash mechanic",
            "reviewer": "jB48ZkNpUro8PYtRXCrjDY",
            "reviewed": "4ebFHe3UfuBLr9WbEroijH",
            "created_at": "2023-12-06T18:18:08.674550Z"
          },
          {
            "idx": "BVYERx87gPWcSNhSP476bR",
            "rating": 1.5,
            "review":
                "I got very good service from this same user previous time. But this time, he was a trash mechanic",
            "reviewer": "jB48ZkNpUro8PYtRXCrjDY",
            "reviewed": "4ebFHe3UfuBLr9WbEroijH",
            "created_at": "2023-12-06T18:20:26.657062Z"
          }
        ],
      ),
    );
  }
}
