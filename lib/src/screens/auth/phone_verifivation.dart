import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_view/pin_code_view.dart';

class PhoneVerificationScreen extends StatefulWidget {
  _PhoneVerificationScreenState createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.all(7),
          child: Center(
            child: _pinInput(context),
          )),
    );
  }

  Widget _pinInput(BuildContext context) {
    return PinCode(
      title: Text(
        "Lock Screen",
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.normal),
      ),
      subTitle: Text(''),
      codeTextStyle: TextStyle(
          fontSize: 20, fontStyle: FontStyle.normal, color: Colors.white),
      codeLength: 6,
      onCodeEntered: (v) => _onSubmit,
    );
  }

  void _onSubmit(String v) {
    print(v);
  }
}
