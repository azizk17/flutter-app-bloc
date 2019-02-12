import '../../abstract/abstract.dart' show Service;
import './articles.dart' show Article;

abstract class ArticlesService {
  Stream getItem(String id);
  Stream getItems();
  create(Article data);
  update(Article data);
  delete(Article data);
}
