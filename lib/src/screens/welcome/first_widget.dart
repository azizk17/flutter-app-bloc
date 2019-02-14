import 'package:flutter/material.dart';
import '../../locale.dart';
import 'package:flutter/cupertino.dart';

class FirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.activeBlue,
      child: Center(
        child: Text(
          AppLocalizations.of(context).hello,
          textScaleFactor: 2.2,
          style: TextStyle(color: Theme.of(context).canvasColor),
        ),
      ),
    );
  }
}
