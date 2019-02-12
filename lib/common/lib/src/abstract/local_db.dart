abstract class LocalDb<T> {
  Future<T> getItem(String id);
  Future<List<T>> getItems();
  Future<void> create(T data);
  Future<void> update(T data);
  Future<void> delete(T data);
}
