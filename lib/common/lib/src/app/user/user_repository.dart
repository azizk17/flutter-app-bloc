import './user_service.dart';
import './user_db_provider.dart';

class UserRepository {
  UserRepository({service: UserService, db: UserDbProvider});

  getItem() {}
  getItems() {}
  create() {}
  update() {}
  delete() {}
}
