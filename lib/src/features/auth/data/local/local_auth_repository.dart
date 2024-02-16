import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/user.dart';
import '../../domain/user_back.dart';

abstract class LocalAuthRepository {
  Future<User> getCurrentUserInfo(String token);
  Future<void> signOut(Ref ref);
}
