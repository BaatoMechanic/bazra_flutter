import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/utils/constants/managers/api_values_manager.dart';
import '../../../shared/utils/http/http_client.dart';
import 'account_recovery_repository.dart';
import 'package:http/http.dart' as http;

class FakeAccountRecoveryRepository implements AccountRecoveryRepository {
  @override
  Future<bool> checkRecoveryOtp(String code, String otpIdx) {
    // TODO: implement checkRecoveryOtp
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> changePassword(
      String otpIdx, String newPassword) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> requestAccountRecoveryOtpPassword(
      String oldPassword) {
    // TODO: implement requestAccountRecoveryOtpPassword
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> requestAccountRecoveryOtpUid(String userId) {
    // TODO: implement requestAccountRecoveryOtpUid
    throw UnimplementedError();
  }
}
