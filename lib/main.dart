import 'package:flutter/material.dart';
import './src/db_client.dart';
import './src/routes.dart';
import './src/screens/welcome/welcome_screen.dart';
import './themes/jeddTheme.dart' show jeddTheme;
import './src/locale.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './src/screens/home/home_screen.dart';

// void main() => runApp(MyApp());
void main() async {
  await _initAppTools();
  runApp(MyApp());
}

// init local database
void _initAppTools() async {
  var db = DatabaseClient();
  await db.create();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('en', ''),
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar', 'SA'), // Arabic
        const Locale('en', 'US'), // English
      ],
      title: 'Flutter Demo',
      theme: jeddTheme,
      home: StartApp(),
      onGenerateRoute: routes,
      debugShowCheckedModeBanner: true,
    );
  }
}

class StartApp extends StatelessWidget {
  Future<bool> _isUserHasAcsses() async {
    await Future.delayed(const Duration(seconds: 2));
    return Future<bool>.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: conditional render
      body: false ? HomeScreen() : WelcomeScreen(),
    );
  }
}
