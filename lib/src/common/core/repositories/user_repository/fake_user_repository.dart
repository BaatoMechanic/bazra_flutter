import 'user_repository.dart';

class FakeUserRepository extends UserRepository {
  @override
  Future fetchUserInfo(String token) async {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }
}
