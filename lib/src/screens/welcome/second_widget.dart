import 'package:flutter/material.dart';

class SecondWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).canvasColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Second Screen",
              textScaleFactor: 2.3,
            ),
            FlatButton(
              child: Text("Join"),
              onPressed: () => Navigator.pushNamed(context, '/login'),
            )
          ],
        ));
  }
}
