import 'package:flutter/material.dart';
import '../keys.dart';
import '../../app/providers/auth_provider.dart';
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
