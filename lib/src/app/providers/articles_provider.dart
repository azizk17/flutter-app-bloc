import 'package:flutter/material.dart';
import '../articles/articles.dart'
    show ArticlesBloc, ArticlesRepository, ArticlesService, ArticlesDbProvider;

class ArticlesProvider extends InheritedWidget {
  final ArticlesBloc bloc;
  // ### Inject service and local db to repository
  static ArticlesRepository _repo =
      ArticlesRepository(ArticlesService(), ArticlesDbProvider());

  ArticlesProvider({Key key, Widget child})
      : bloc = ArticlesBloc(_repo),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static ArticlesBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ArticlesProvider)
            as ArticlesProvider)
        .bloc;
  }
}
