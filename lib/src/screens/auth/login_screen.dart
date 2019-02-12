import 'package:flutter/material.dart';
import '../../providers/auth_provider.dart';
import 'dart:async';
import 'package:common/common.dart' show User;
import './phone_verifivation.dart';

import './country_picker.dart';
import '../../widgets/widgets.dart' show PrimaryBtn;
import '../../locale.dart';
// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("sdfsd"),
//     );
//   }
// }

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool err = false;
  bool isLoading = false;
  bool _showCredentialScreen = true;
  StreamSubscription _su;

  @override
  void initState() {
    // TODO: implement initState
    _listenToStreams();

    super.initState();

    // Future.delayed(const Duration(seconds: 2));
    // this.isLoading = true;
    // print("is loading" + this.isLoading.toString());
    // authBloc = AuthProvider.of(context);
  }

  _listenToStreams() {
    authBloc.isLoading.listen(
      (data) {
        setState(() {
          this.isLoading = data;
        });

        print("data:" + isLoading.toString());
      },
      onError: (e) => print(e),
    );
  }

  _showError(String e) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(e),
    ));
  }

  _showCredential(bool val) {
    setState(() {
      this._showCredentialScreen = val;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _showCredentialScreen
            ? _credential(context)
            : _verification(context),
      ),
    );
  }

  Widget _credential(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // _phoneInput(context),
        PickCountry(
          isLoading: this.isLoading,
        ),
        _submitBtn(context),
        FlatButton(
          child: Text("show dialog"),
          onPressed: () {
            Navigator.pushNamed(context, '/phoneVerification');
          },
        )
      ],
    );
  }

  Widget _verification(BuildContext context) {
    return Dialog(
      child: PhoneVerificationScreen(),
    );
  }

  Widget _phoneInput(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 40,
        color: Colors.blue,
      ),
      onChanged: authBloc.changePhone,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        enabled: !this.isLoading,
      ),
    );
  }

  Widget _submitBtn(BuildContext context) {
    // return PrimaryBtn(
    //   child: Text("hello"),
    //   isLoading: this.isLoading,
    //   onPressed: () => print("dsdsd"),
    // );
    return FlatButton(
      splashColor: Colors.blue,
      color: Theme.of(context).buttonColor,
      child: this.isLoading
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : Text(AppLocalizations.of(context).btnSend),
      onPressed: authBloc.submit,
    );
  }
  // Widget _loadingWidget(BuildContext context) {
  //   return
  // }

  void _showDialog() {
    authBloc.submit();
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         content: PhoneVerificationScreen(),
    //       );
    //     });
  }
}
