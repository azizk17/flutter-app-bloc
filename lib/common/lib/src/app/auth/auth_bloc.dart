import './auth_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../users/users.dart' show User;

class AuthBloc {
  AuthRepository _repo;

  final _phoneController = BehaviorSubject<String>();
  final _submitController = BehaviorSubject<String>();
  final _isLoading = BehaviorSubject<bool>();

  Observable<String> get phone => _phoneController.stream;
  Observable<bool> get isLoading => _isLoading.stream;
  Function(bool) get loading => _isLoading.sink.add;
  Function(String) get changePhone => _phoneController.sink.add;
  Function() get submit => _submit;

  AuthBloc(this._repo) {}
  _submit() async {
    print("bloc");
    _isLoading.sink.add(true);
    // var getUser = await this
    //     ._repo
    //     .signInWithPhone(_phoneController.value)
    //     .catchError((e) => print("has error BB ${e.toString()}"));
    // _isLoading.sink.add(false);
    await Future.delayed(const Duration(seconds: 3));
    _isLoading.sink.add(false);

    final _p = _phoneController.value;
    print(_p);
  }

  void dispose() {}
}
