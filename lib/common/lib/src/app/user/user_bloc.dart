import 'package:rxdart/rxdart.dart';
import './user_model.dart';
import './user_repository.dart';

class UserBloc {
  UserRepository _repo;
  final _createController = BehaviorSubject();
  final _fetchItemController = PublishSubject();

  Function(User) get createNewUser => _createController.sink.add;
  Function(String) get getItemById => _fetchItemController.sink.add;
  Observable get user => _fetchItemController.stream;

  UserBloc(this._repo);
}
