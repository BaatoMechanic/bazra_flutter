import 'package:riverpod_annotation/riverpod_annotation.dart';

part "providers.g.dart";

@Riverpod(keepAlive: true)
class UserIdentifier extends _$UserIdentifier {
  @override
  String? build() {
    return null;
  }

  void setUserIdentifier(String uid) {
    state = uid;
  }
}

@Riverpod(keepAlive: true)
class VerifyOtpIdx extends _$VerifyOtpIdx {
  @override
  String? build() {
    return null;
  }

  void setOtpIdx(String idx) {
    state = idx;
  }
}
