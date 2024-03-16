import 'dart:io';

import 'package:bato_mechanic/src/features/payment/data/payment_repository.dart';

class FakePaymentRepository implements PaymentRepository {
  @override
  Future<dynamic> payWithEsewa() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  Future payWithKhalti() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
