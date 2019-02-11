abstract class Service<Model> {
  getItem(String id);
  getItems();
  create(Model data);
  update();
  delete();
}
