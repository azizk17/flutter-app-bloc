import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import '../utils.dart';

class TextFieldJedd extends StatefulWidget {
  final TextStyle textStyle;
  final Function onChanged;
  final TextInputType keyboardType;
  final InputDecoration decorationIOS;

  const TextFieldJedd({
    Key key,
    this.onChanged,
    this.textStyle,
    this.keyboardType,
    this.decorationIOS,
  }) : super(key: key);
  _TextFieldJeddState createState() => _TextFieldJeddState();
}

class _TextFieldJeddState extends State<TextFieldJedd> {
  @override
  Widget build(BuildContext context) {
    return Utils.isIOS ? _iosBuild(context) : _andBuild(context);
  }

  Widget _iosBuild(BuildContext context) {
    return CupertinoTextField(
      key: widget.key,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
    );
  }

  Widget _andBuild(BuildContext context) {}
}
