import 'package:flutter/material.dart';
import 'package:common/common.dart' show UsersBloc, UsersRepository;
import '../db/db.dart' show UsersDbProvider;
import '../firebase/firebase.dart' show UsersFirebase;

class UsersProvider extends InheritedWidget {
  final UsersBloc bloc;
  // ### Inject service and local db to repository
  static UsersRepository _repo =
      UsersRepository(service: UsersFirebase(), db: UsersDbProvider());

  UsersProvider({Key key, Widget child})
      : bloc = UsersBloc(_repo),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static UsersBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(UsersProvider)
            as UsersProvider)
        .bloc;
  }
}
