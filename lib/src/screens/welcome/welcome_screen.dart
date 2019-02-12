import 'package:flutter/material.dart';
import '../../providers/providers.dart' show AuthProvider;
import '../keys.dart';
import './first_widget.dart';
import './second_widget.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: JeddKeys.scaffoldKey,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: TabBarView(
            children: <Widget>[
              FirstWidget(),
              SecondWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
