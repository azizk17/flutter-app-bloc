import './auth_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../users/users.dart' show User;
import 'dart:async';
import 'package:intl/intl.dart';
import 'dart:ui'; // Locale

class AuthBloc {
  AuthRepository _repo;

  final _phoneController = BehaviorSubject<String>();
  final _submitController = BehaviorSubject<String>();
  final _countryCodeController = BehaviorSubject<String>();
  final _isLoading = BehaviorSubject<bool>();

  /**
   *  Streams
   */
  Observable<String> get phone =>
      _phoneController.stream.transform(_phoneFormat);
  Observable<String> get countryCode => _countryCodeController.stream;
  Observable<bool> get isLoading => _isLoading.stream;

  /**
   * Sinks
   */
  Function(bool) get loading => _isLoading.sink.add;
  Function(String) get changePhone => _phoneController.sink.add;
  Function(String) get changeCountryCode => _countryCodeController.sink.add;
  Function() get submit => _submit;

  AuthBloc(this._repo) {}
  _submit() async {
    String cc = _countryCodeController.value;
    String p = _phoneController.value;

    String finalPhoneNumber = "+$cc$p";
    print("final phone number " + finalPhoneNumber);
    // this._repo.signInWithPhone(finalPhoneNumber);
  }

  final _phoneFormat = StreamTransformer.fromHandlers(
      handleData: (String input, EventSink<String> sink) {
    var format = NumberFormat("###-###-####", "en_US");

    print("iut is " + format.format(input));
  });
  _phoneTransformer() {
    return ScanStreamTransformer((String v, String n, int i) {
      print("V is " + v);
      print("n is " + n);
    });
  }

  _valiPhone() {}
  _signInWithPhoneNumber({
    String countryCode,
    String phoneNumber,
  }) async {
    // TODO: phone validation and rules
    _isLoading.sink.add(true);
    await Future.delayed(const Duration(seconds: 3));
    print("object");
    _isLoading.sink.add(false);
  }

  void dispose() {
    _phoneController.close();
    _isLoading.close();
    _submitController.close();
    _countryCodeController.close();
  }
}
