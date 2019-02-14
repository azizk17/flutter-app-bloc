import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class BtnJedd extends StatefulWidget {
  Widget child;
  bool loadingIndecator;
  bool isLoading;

  final VoidCallback onPressed;

  BtnJedd({
    @required this.child,
    this.loadingIndecator,
    this.isLoading,
    @required this.onPressed,
  });

  _BtnJeddState createState() => _BtnJeddState();
}

class _BtnJeddState extends State<BtnJedd> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _iosBuild(context) : _andBuild(context);
  }
  /***
   * 
   * * IOS build
   */

  Widget _iosBuild(BuildContext context) {
    return CupertinoButton(
      child: widget.isLoading
          ? CupertinoActivityIndicator(
              radius: 13,
            )
          : widget.child,
      color: Theme.of(context).primaryColor,
      onPressed: widget.onPressed,
    );
  }

  /***
   * 
   * * Android build
   * 
   */
  Widget _andBuild(BuildContext context) {
    return FlatButton(
      color: Theme.of(context).primaryColor,
      textColor: Theme.of(context).primaryColorLight,
      child: widget.isLoading ? CircularProgressIndicator() : widget.child,
      onPressed: widget.onPressed,
    );
  }
}
