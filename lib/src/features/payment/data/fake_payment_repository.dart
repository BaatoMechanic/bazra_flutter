import 'dart:io';

import 'package:bato_mechanic/src/features/payment/data/payment_repository.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';

class FakePaymentRepository implements PaymentRepository {
  @override
  Future<dynamic> payWithEsewa() async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(code: HttpStatus.ok, response: true);
  }

  @override
  Future payWithKhalti() async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(code: HttpStatus.ok, response: true);
  }
}
