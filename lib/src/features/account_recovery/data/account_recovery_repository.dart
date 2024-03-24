import 'package:bato_mechanic/main.dart';
import 'package:bato_mechanic/src/features/account_recovery/data/fake_account_recovery_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api_account_recovery_repository.dart';

part 'account_recovery_repository.g.dart';

abstract class AccountRecoveryRepository {
  Future<Map<String, dynamic>> requestAccountRecoveryOtpUid(String userId);
  Future<Map<String, dynamic>> requestAccountRecoveryOtpPassword(
      String oldPassword);
  Future<bool> checkRecoveryOtp(String code, String otpIdx);
  Future<Map<String, dynamic>> changePassword(
      String otpIdx, String newPassword);
}

@riverpod
AccountRecoveryRepository accountRecoveryRepository(
        AccountRecoveryRepositoryRef ref) =>
    SHOW_FAKE
        ? FakeAccountRecoveryRepository()
        : ApiAccountRecoveryRepository(ref: ref);
