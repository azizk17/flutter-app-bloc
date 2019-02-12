import '../../abstract/abstract.dart' show LocalDb;
import './articles.dart' show Article;

abstract class ArticlesDb {
  getItem(String id);
  getItems();
  create(Article data);
  update(Article data);
  delete(Article data);
}
