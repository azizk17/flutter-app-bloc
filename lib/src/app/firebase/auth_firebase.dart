import 'package:firebase_auth/firebase_auth.dart';
import 'package:common/common.dart' show AuthService;

class AuthFirebase extends AuthService {
  String phoneNumber;
  String smsCode;
  String verificationId;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> _msg;
  login() {}

  Future<String> signIn(String phone) async {
    await verifyPhone(phone);
  }

  Future<String> signInWithPhone(String phone) async {
    print("serives");

    this.phoneNumber = phone;
    await verifyPhone(phone);
    print("verificationId: $verificationId");
    return await _msg;
  }
  /**
   * * Phone auth
   */

  Future<void> verifyPhone(String phoneNu) async {
    print("verifyPhone");

    final PhoneCodeAutoRetrievalTimeout authRetrieve = (String verId) {
      this.verificationId = verId;
    };
    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
    };
    final PhoneVerificationCompleted verfiedSuccess = (FirebaseUser user) {
      _msg = Future<String>.value("msg donde");
    };
    final PhoneVerificationFailed veriFaield = (AuthException exp) {
      _msg = Future<String>.error("msg error");
      // _msg = Future<String>.value("verification ${exp.message}");
    };

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNu,
      codeAutoRetrievalTimeout: authRetrieve,
      codeSent: smsCodeSent,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verfiedSuccess,
      verificationFailed: veriFaield,
    );
  }
}
