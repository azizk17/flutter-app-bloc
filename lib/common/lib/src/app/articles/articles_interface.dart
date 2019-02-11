abstract class ArticlesContract {
  getItem(String id);
  getItems();
  create(Object model);
  update(Object model);
  delete(String id);
}
