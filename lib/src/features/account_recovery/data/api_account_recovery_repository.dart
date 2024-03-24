import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/user_settings.dart';
import '../../../shared/utils/constants/managers/api_values_manager.dart';
import '../../../shared/utils/http/http_client.dart';
import 'account_recovery_repository.dart';
import 'package:http/http.dart' as http;

class ApiAccountRecoveryRepository implements AccountRecoveryRepository {
  ApiAccountRecoveryRepository({required this.ref});

  final Ref ref;

  @override
  Future<Map<String, dynamic>> requestAccountRecoveryOtpUid(
      String userId) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}autho/account_recovery/send_otp_uid/');

    var response = await HttpHelper.guard(
        () => http.post(
              url,
              body: {
                "user_identifier": userId,
              },
            ),
        ref);
    return response;
  }

  @override
  Future<Map<String, dynamic>> requestAccountRecoveryOtpPassword(
      String oldPassword) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}autho/account_recovery/send_otp_password/');

    var response = await HttpHelper.guard(
        () => http.post(
              url,
              headers: {
                HttpHeaders.authorizationHeader:
                    'BM ${ref.read(sharedPreferencesProvider).getString('access')!}',
              },
              body: {
                "old_password": oldPassword,
              },
            ),
        ref);
    return response;
  }

  @override
  Future<bool> checkRecoveryOtp(String code, String otpIdx) async {
    var url =
        Uri.parse('${RemoteManager.BASE_URI}autho/account_recovery/check_otp/');

    await HttpHelper.guard(
        () => http.post(
              url,
              body: {
                "code": code,
                "otp": otpIdx,
              },
            ),
        ref);

    // directly return true because if error occurs then it will throw an exception before reaching here
    return true;
  }

  @override
  Future<Map<String, dynamic>> changePassword(
      String otpIdx, String newPassword) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}autho/account_recovery/$otpIdx/verify_otp/');

    var response = await HttpHelper.guard(
        () => http.post(
              url,
              body: {
                "new_password": newPassword,
              },
            ),
        ref);
    return response;
  }
}
