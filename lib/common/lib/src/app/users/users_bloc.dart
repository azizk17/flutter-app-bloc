import 'package:rxdart/rxdart.dart';
import './users.dart' show User, UsersRepository;

class UsersBloc {
  UsersRepository _repo;
  final _createController = BehaviorSubject();
  final _fetchItemController = PublishSubject();

  Function(User) get createNewUser => _createController.sink.add;
  Function(String) get getItemById => _fetchItemController.sink.add;
  Observable get user => _fetchItemController.stream;

  UsersBloc(this._repo);
}
