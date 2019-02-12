import 'package:flutter/material.dart';
import 'package:common/common.dart' show ArticlesBloc, ArticlesRepository;
import '../db/db.dart' show ArticlesDbProvider;
import '../firebase/firebase.dart' show ArticlesFirebase;

class ArticlesProvider extends InheritedWidget {
  final ArticlesBloc bloc;
  // ### Inject service and local db to repository
  static ArticlesRepository _repo =
      ArticlesRepository(ArticlesFirebase(), ArticlesDbProvider());

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
