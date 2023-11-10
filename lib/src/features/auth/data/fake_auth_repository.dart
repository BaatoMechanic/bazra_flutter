import 'package:bato_mechanic/src/features/auth/data/auth_repository.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';

class FakeAuthRepository implements AuthRepository {
  @override
  Future<dynamic> createUserWithIdAndPassword(
      String uId, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return Success(code: 201, response: {
      'id': uId,
      'name': 'Created User',
      'email': null,
      'phone': '00876567433',
      'profilePic': 'assets/images/no-profile.png',
      'role': 'Consumer',
    });
  }

  @override
  Future<dynamic> signInWithIdAndPassword(String uId, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return Success(code: 200, response: {
      'id': '123',
      'name': 'Krishna Rimal',
      'email': 'mail@krishna.com',
      'phone': '00876567433',
      'profilePic': 'assets/images/no-profile.png',
      'role': 'Consumer',
    });
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
