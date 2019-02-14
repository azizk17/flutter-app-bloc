import 'package:flutter/material.dart';

/**
 * 
 * # Colors
 */
const jeddPrimary = const Color(0xFF5D4157);
const jeddAccent = const Color(0xFF838689);
const jeddCanvasColor = const Color(0xFFA8CABA);
const jeddGreenLight = const Color(0xFFCAD7B2);

const jeddGreenLime = const Color(0xFFEBE3AA);

const jeddErrorRed = const Color(0xFFC5032B);

const jeddSurfaceWhite = const Color(0xFFFFFBFA);
const jeddBackgroundWhite = Colors.white;

// TODO: Build a Shrine Theme (103)
final ThemeData jeddTheme = _buildJeddTheme();

ThemeData _buildJeddTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: jeddPrimary,
    accentColor: jeddAccent,
    buttonColor: jeddAccent,
    scaffoldBackgroundColor: jeddBackgroundWhite,
    cardColor: jeddBackgroundWhite,
    textSelectionColor: jeddAccent,
    errorColor: jeddErrorRed,
    // TODO: Add the text themes (103)
    textTheme: _buildJeddTextTheme(base.textTheme),
    primaryTextTheme: _buildJeddTextTheme(base.primaryTextTheme),
    // TODO: Add the icon themes (103)
    primaryIconTheme: base.iconTheme.copyWith(
      color: jeddGreenLime,
    ),

    // TODO: Decorate the inputs (103)
  );
}

TextTheme _buildJeddTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        fontFamily: 'AraJozoor',
        displayColor: jeddAccent,
        bodyColor: jeddCanvasColor,
      );
}
