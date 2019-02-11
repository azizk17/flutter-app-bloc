import 'package:flutter/material.dart';

class FirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: Center(
        child: Text(
          "يا مرحبا ترحيبه كلها هيل",
          textScaleFactor: 2.2,
          style: TextStyle(color: Theme.of(context).canvasColor),
        ),
      ),
    );
  }
}
