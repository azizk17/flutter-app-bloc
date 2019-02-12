import 'package:flutter/material.dart';
import 'package:common/common.dart' show AuthBloc, AuthRepository;
import '../db/db.dart' show AuthDbProvider;
import '../firebase/firebase.dart' show AuthFirebase;

class AuthProvider extends InheritedWidget {
  final AuthBloc bloc;
  // ### Inject service and local db to repository
  static AuthRepository _repo =
      AuthRepository(service: AuthFirebase(), db: AuthDbProvider());

  AuthProvider({Key key, Widget child})
      : bloc = AuthBloc(_repo),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static AuthBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AuthProvider) as AuthProvider)
        .bloc;
  }
}

final authBloc =
    AuthBloc(AuthRepository(service: AuthFirebase(), db: AuthDbProvider()));
