import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../utils.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Utils.isIOS ? _screenIOS(context) : _screenAnd(context);
  }

  Widget _screenIOS(BuildContext context) {
    return CupertinoPageScaffold(
      child: _body(context),
    );
  }

  Widget _screenAnd(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 90,
        width: 220,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          child: Center(
            child: Text(
              "Home Screen",
              textScaleFactor: 2.2,
            ),
          ),
        ),
      ),
    );
  }
}
