// import 'package:bato_mechanic/src/features/auth/data/local/local_auth_repository.dart';
// import 'package:bato_mechanic/src/features/auth/domain/user.dart';
// import 'package:flutter/foundation.dart';
// import 'package:riverpod/src/framework.dart';
// import 'package:sembast/sembast.dart';
// import 'package:sembast/sembast_io.dart';

// class SembastAuthRepository implements LocalAuthRepository {
//   SembastAuthRepository(this.db);

//   final Database db;
//   final StoreRef store = StoreRef.main();

//   static const authKey = 'userAuth';

//   static Future<Database> createDatabase(String filename) async {
//     if (!kIsWeb) {
//       final appDocDir = await getApplicationDocumentsDirectory();
//       return databaseFactoryIo.openDatabase('${appDocDir.path}/$filename');
//     } else {
//       return databaseFactoryWeb.openDatabase(filename);
//     }
//   }

//   static Future<SembastCartRepository> makeDefault() async {
//     return SembastCartRepository(await createDatabase('default.db'));
//   }

//   @override
//   Future<User> getCurrentUserInfo(String token) {
//     // TODO: implement getCurrentUserInfo
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> signOut(Ref<Object?> ref) {
//     // TODO: implement signOut
//     throw UnimplementedError();
//   }
// }
