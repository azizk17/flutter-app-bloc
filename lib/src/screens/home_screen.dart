import 'package:flutter/material.dart';
import './articles/articles_list_screen.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(
                  text: "Blog",
                ),
              ],
            ),
            title: Text('Demo'),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Hello :)',
                        textScaleFactor: 3.2,
                        style: TextStyle(color: Colors.black45),
                      ),
                      TextField(),
                      _something(),
                    ]),
              ),
              ArticlesListScreen(),
            ],
          ),
        ),
      ),
    );
  }

  void _showError(String error) {
    final snackBar = SnackBar(content: Text('Are you talkin\' to me?'));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Widget _something() {
    return RaisedButton(
      child: Text("Test me"),
      onPressed: () => _showError("This Error Test"),
    );
  }
}
