import 'package:flutter/material.dart';
import './src/app/providers/SyncErrorProvider.dart';
import './src/app/db.dart';
import './src/routes.dart';
import './src/screens/welcome/welcome_screen.dart';
import './themes/jeddTheme.dart' show jeddTheme;

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
  static Future db = DatabaseClient().create();
  @override
  Widget build(BuildContext context) {
    return SyncErrorProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: jeddTheme,
        home: WelcomeScreen(),
        onGenerateRoute: routes,
        debugShowCheckedModeBanner: true,
      ),
    );
  }
}
