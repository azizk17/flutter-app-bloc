class MyError {
  String type;
  String message;
  String details;

  MyError({this.type, this.message, this.details}) : assert(type != null);
  @override
  String toString() => message;
}
