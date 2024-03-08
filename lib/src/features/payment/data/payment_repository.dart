import 'package:bato_mechanic/src/features/payment/data/fake_payment_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_repository.g.dart';

abstract class PaymentRepository {
  Future<dynamic> payWithEsewa();
  Future<dynamic> payWithKhalti();
}

// final paymentRepositoryProvider =
//     Provider<PaymentRepository>((ref) => FakePaymentRepository());

@riverpod
PaymentRepository paymentRepository(PaymentRepositoryRef ref) =>
    FakePaymentRepository();
