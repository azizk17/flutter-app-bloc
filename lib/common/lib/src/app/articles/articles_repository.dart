import './articles.dart' show ArticlesService, ArticlesDb, Article;
import 'package:rxdart/rxdart.dart';

class ArticlesRepository {
  /**
   * 
   * * Articles Repoistory handels app logic includes:
   *  - Form validation
   *  - Ensure consistency between Service calls and local DB query
   */

  final ArticlesService _service;
  final ArticlesDb _db;
  Map<String, String> _errors;

  ArticlesRepository(this._service, this._db);

  Stream<Article> getItem(String id) {
    print("test this");
    // check is user has permssion to see this
    // get item from db
    // if item not in db, make service call
    var item;
    item = this._db.getItem(id);
    if (!item) {
      item = this._service.getItem(id);
    }
    return Observable(item);
  }

  getItems() {
    // do some checking then call service
    // get data from db first
    var itemsq = this._db.getItems();
    print("itemq: " + itemsq.toString());

    Stream<List<Article>> items = _service.getItems();

    var b = this._db.create(Article().rebuild(
        (b) => [b..title = "yes we are able to do it", b..id = "3334jfrewof"]));
    return items;
  }

  create(Article data) {
    // - Validate
    // - service call
    if (data.title.isEmpty) {
      return "error";
    }
    return this._service.create(data);
  }

  update(Article data) {
    if (data.title.isEmpty) {
      // return Observable.error(MyError(type: "ValidationError"));
    }
    return this._service.update(data);
  }

  delete(Article data) {}
}
