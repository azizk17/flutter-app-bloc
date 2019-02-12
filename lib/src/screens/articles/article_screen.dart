import 'package:flutter/material.dart';
import './edit_article_screen.dart';
import '../../providers/providers.dart' show ArticlesProvider;

/**
 * *  A list of Articles
 * 
 */
class ArticleScreen extends StatelessWidget {
  String id;
  String title;
  ArticleScreen({this.id, this.title}) : assert(id != null);
  @override
  Widget build(BuildContext context) {
    return ArticlesProvider(
      child: Scaffold(
          appBar: AppBar(
            title: Text('${this.title}'),
            backgroundColor: Colors.indigo,
          ),
          body: _show(context)),
    );
  }

  Widget _show(BuildContext context) {
    final bloc = ArticlesProvider.of(context);

    return StreamBuilder(
      stream: bloc.getItem(id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Container(
          padding: EdgeInsets.only(top: 25.0, right: 10, left: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  snapshot.data.title,
                  textScaleFactor: 1.5,
                  style: TextStyle(color: Colors.indigo),
                ),
                IconButton(
                  color: Colors.black26,
                  icon: Icon(Icons.edit),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditArticleScreen(item: snapshot.data))),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 44.3,
                ),
                Text(
                  snapshot.data.body,
                  style: TextStyle(color: Colors.black54, height: 1.8),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
