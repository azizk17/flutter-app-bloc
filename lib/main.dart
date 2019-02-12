import 'package:flutter/material.dart';
import './src/db_client.dart';
import './src/routes.dart';
import './src/screens/welcome/welcome_screen.dart';
import './themes/jeddTheme.dart' show jeddTheme;
import './src/locale.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      locale: Locale('ar', ''),
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
      home: WelcomeScreen(),
      onGenerateRoute: routes,
      debugShowCheckedModeBanner: true,
    );
  }
}
