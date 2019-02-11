import './auth_db_provider.dart';
import './auth_service.dart';
import 'package:meta/meta.dart';

class AuthRepository {
  AuthDbProvider db;
  AuthService service;

  AuthRepository({@required this.service, @required this.db});

  login() async {
    // return await _service.sub();
  }

  Future<void> signInWithPhone(String phone) async {
    print("repo");

    await service
        .signInWithPhone(phone)
        .then((d) => print("data is $d"))
        .catchError((e) => print("e is ${e.toString()}"));
  }

  register() {}
  isAuth() {}
  hasRole() {}
  hasPermssion() {}
}
