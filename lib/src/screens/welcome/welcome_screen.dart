import 'package:flutter/material.dart';
import './first_widget.dart';
import './second_widget.dart';
import 'package:flutter/cupertino.dart';
import '../../utils.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Utils.isIOS ? _screenIOS(context) : _screenAnd(context);
  }

  Widget _screenIOS(BuildContext context) {
    return CupertinoPageScaffold(
      child: _swiper(context),
    );
  }

  Widget _screenAnd(BuildContext context) {
    return _swiper(context);
  }

  Widget _swiper(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBarView(
        children: <Widget>[
          FirstWidget(),
          SecondWidget(),
        ],
      ),
    );
  }
}
