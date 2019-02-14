import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../providers/auth_provider.dart';
import 'dart:async';
import './country_picker.dart';
import '../../locale.dart';
import '../../utils.dart';
import 'package:flutter/services.dart';
import 'package:flushbar/flushbar.dart';
import 'package:intl/intl.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool err = false;
  bool isLoading = false;
  String phoneNumber;
  String countryCode = '966';
  String validationErr;

  StreamSubscription loadingStream;
  StreamSubscription _phoneStream;
  StreamSubscription _countryCodeStream;

  GlobalKey<ScaffoldState> _scaffKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // loading indecator
    Stream<bool> s = authBloc.isLoading;
    loadingStream?.cancel();
    loadingStream = s.listen((v) {
      if (mounted) {
        setState(() {
          this.isLoading = v;
        });
      }
    });
    // phone
    Stream<String> p = authBloc.phone;
    _phoneStream?.cancel();
    _phoneStream = p.listen(
      (v) {
        if (mounted) {
          setState(() {
            this.phoneNumber = v;
          });
        }

        print("phone number + " + v);
      },
      onError: (e) => null,
    );
  }

  void _onSuccess(String phone) {
    // push to verification page
    Navigator.pushNamed(context, "/vervication");
  }

  void _onError(String e) {
    // show snackbar with error info
  }
  void _showError(String e) {
    _scaffKey.currentState.showSnackBar(SnackBar(
      content: Text(e),
      backgroundColor: Theme.of(context).errorColor,
    ));
  }

  void _selectedCode(String countryCode) {
    setState(() {
      print("selected code " + countryCode);
      this.countryCode = countryCode;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    authBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffKey,
      body: Utils.isIOS ? _screenIOS(context) : _screenAnd(context),
    );
  }

  Widget _screenIOS(BuildContext context) {
    return CupertinoPageScaffold(
      child: _body(context),
    );
  }

  Widget _screenAnd(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      resizeToAvoidBottomPadding: false,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _topMsg(context),
          FlatButton(
            color: Colors.redAccent,
            child: Text("ph"),
            onPressed: () => Navigator.pushNamed(context, '/phoneVerification'),
          ),
          // PhoneInput(
          //   phoneNumber: this._updatePhoneNumberCallback,
          //   contryCode: this._updateCountryCodeCallback,
          //   validationErr: this.validationErr,
          // ),
          // country picker with phone input filed
          _phoneBox(context),
          _termsAgreement(context),
          _submitBtn(context),
        ],
      ),
    );
  }

  Widget _topMsg(BuildContext context) {
    return Text(
      AppLocalizations.of(context).enterYourPhoneMsg,
      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
    );
  }

  Widget _termsAgreement(BuildContext context) {
    return Text(
      AppLocalizations.of(context).termsMsg,
      style: TextStyle(
        fontFamily: "Roboto",
        color: Colors.black45,
      ),
    );
  }

  Widget _submitBtn(BuildContext context) {
    Widget _btn;
    final onPressed = authBloc.submit;
    if (Utils.isIOS) {
      _btn = CupertinoButton(
        onPressed: onPressed,
      );
    } else {
      _btn = FlatButton(
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        child: this.isLoading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Text(AppLocalizations.of(context).btnSend),
      );
    }

    return SizedBox(
      width: 140,
      height: 45,
      child: _btn,
    );
  }

  Widget _buildPhoneTextFiled(BuildContext context, snapshot) {
    return Utils.isIOS
        ? CupertinoTextField(
            keyboardType: TextInputType.phone,
            controller: TextEditingController(text: snapshot.data),
            enabled: !this.isLoading,
            style: Theme.of(context).textTheme.subhead.copyWith(fontSize: 40),
            onChanged: authBloc.changePhone,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
          )
        : TextField(
            keyboardType: TextInputType.phone,
            autofocus: true,
            controller: TextEditingController(text: snapshot.data),
            enabled: !this.isLoading,
            decoration: InputDecoration(
                border: InputBorder.none,
                errorText: this.err ? this.validationErr : null),
            style: Theme.of(context).textTheme.subhead.copyWith(fontSize: 40),
            onChanged: authBloc.changePhone,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
          );
  }

  Widget _phoneBox(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        child: Row(
          children: <Widget>[
            PickCountry(
              enabled: !this.isLoading,
              selectedCode: authBloc.changeCountryCode,
            ),
            SizedBox(
              width: 7.0,
            ),
            Flexible(
              child: StreamBuilder(
                stream: authBloc.phone,
                builder: (context, snapshot) {
                  return _buildPhoneTextFiled(context, snapshot);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
