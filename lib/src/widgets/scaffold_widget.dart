import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ScaffoldJedd extends StatelessWidget {
  Widget appBar;
  Widget title;
  Widget body;

  ScaffoldJedd({
    @required this.body,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _iosBuild(context) : _andBuild(context);
  }

  Widget _iosBuild(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        backgroundColor: Colors.deepPurpleAccent,
        child: Container(
          decoration: const BoxDecoration(
            color: CupertinoColors.white,
            border:
                Border(bottom: BorderSide(color: Colors.black26, width: 0.0)),
          ),
          child: this.body,
        ),
        navigationBar: CupertinoNavigationBar(
          leading: Text("data"),
          backgroundColor: CupertinoColors.activeGreen,
        ),
      ),
    );
  }

  Widget _andBuild(BuildContext context) {
    return Scaffold(
      appBar: this.appBar != null ? this.appBar : null,
      body: this.body,
    );
  }
}
