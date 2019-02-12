import './users.dart' show User, UsersService, UsersDb;
import 'package:meta/meta.dart';

class UsersRepository {
  UsersService service;
  UsersDb db;

  UsersRepository({
    @required this.service,
    @required this.db,
  });
}
