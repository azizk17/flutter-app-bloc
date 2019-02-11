import 'package:flutter/material.dart';
import '../user/user.dart'
    show UserBloc, UserRepository, UserService, UserDbProvider;

class UserProvider extends InheritedWidget {
  final UserBloc bloc;
  // ### Inject service and local db to repository
  static UserRepository _repo =
      UserRepository(service: UserService(), db: UserDbProvider());

  UserProvider({Key key, Widget child})
      : bloc = UserBloc(_repo),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static UserBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(UserProvider) as UserProvider)
        .bloc;
  }
}
