import 'package:flutter/material.dart';
import '../auth/auth.dart'
    show AuthBloc, AuthRepository, AuthService, AuthDbProvider;

class AuthProvider extends InheritedWidget {
  final AuthBloc bloc;
  // ### Inject service and local db to repository
  static AuthRepository _repo =
      AuthRepository(service: AuthService(), db: AuthDbProvider());

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
    AuthBloc(AuthRepository(service: AuthService(), db: AuthDbProvider()));
