import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './article_screen.dart';
import '../../app/providers/articles_provider.dart';
import '../../app/articles/articles.dart' show Article;

class ArticlesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ArticlesProvider(
      child: Container(child: BuildArticlesListScreen()),
    );
  }
}

// build
class BuildArticlesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _list(context),
    );
  }

  Widget _list(BuildContext context) {
    final bloc = ArticlesProvider.of(context);
    // return Text("ss");
    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<List<Article>> snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return _item(context, snapshot.data[index]);
          },
        );
      },
    );
  }

  Widget _item(BuildContext context, Article item) {
    return Card(
        child: ListTile(
            title: Text(item.title,
                style: TextStyle(color: Colors.indigo, fontSize: 16.4)),
            subtitle: Text(
              item.author,
              style: TextStyle(color: Colors.black45),
            ),
            onTap: () => Navigator.pushNamed(context, "/article")));
  }
}
