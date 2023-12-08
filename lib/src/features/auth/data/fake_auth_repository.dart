import 'package:bato_mechanic/src/features/auth/data/auth_repository.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:http/http.dart';
import 'package:riverpod/src/framework.dart';

import '../../../common/core/repositories/user_settings_repository.dart';

class FakeAuthRepository implements AuthRepository {
  @override
  Future<dynamic> createUserWithIdAndPassword(
      String uId, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return Success(
        code: 201,
        response:
            '{"idx": "itLGCnD7vf9P7eucZf3Kgo", "name": "Krishna Rimal", "email": null, "phone": "9808144809", "image": null, "primary_role": "Consumer", "roles": [] }');
  }

  @override
  Future<dynamic> signInWithIdAndPassword(String uId, String password) async {
    await Future.delayed(Duration(seconds: 1));
    var response = Response(
        '{"refresh": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMTYyODcwNiwiaWF0IjoxNzAxNTQyMzA2LCJqdGkiOiIwNTA3NTExNWUyYmI0MTIzODc4OTZiZDBmZjE4OTZlYiIsInVzZXJfaWQiOjEzfQ.c_iA-kFOi_P_b29pVR2UK_R4I3S03VUaBSC0KblwCSQ", "access": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAxNjI4NzA2LCJpYXQiOjE3MDE1NDIzMDYsImp0aSI6ImIyYjk2ZTVmYmVjZDRhNzFiNWJmODI5YzgzM2E5NjZiIiwidXNlcl9pZCI6MTN9.nZCaUPmEyefC7FnQkkC7iiu2h5gLffuvjNyeHp6Iy7c"}',
        200);
    return Success(code: response.statusCode, response: response);
  }

  @override
  Future getCurrentUserInfo(String token) async {
    await Future.delayed(Duration(seconds: 1));
    var response = Response(
        '{"idx": "itLGCnD7vf9P7eucZf3Kgo", "name": "Krishna Rimal", "email": null,"phone": "9808144809", "image": null,"primary_role": "Consumer","roles": []}',
        200);
    return Success(code: response.statusCode, response: response.body);
  }

  @override
  void signOut(Ref ref) {
    ref.read(sharedPreferencesProvider).remove('access');
    ref.read(sharedPreferencesProvider).remove('refresh');
  }

  @override
  Future refreshToken(String refreshToken) async {
    await Future.delayed(Duration(seconds: 1));
    var response = Response(
        '{"access": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAxNjI4NzA2LCJpYXQiOjE3MDE1NDIzMDYsImp0aSI6ImIyYjk2ZTVmYmVjZDRhNzFiNWJmODI5YzgzM2E5NjZiIiwidXNlcl9pZCI6MTN9.nZCaUPmEyefC7FnQkkC7iiu2h5gLffuvjNyeHp6Iy7c"}',
        200);
    return Success(code: response.statusCode, response: response);
  }
}
