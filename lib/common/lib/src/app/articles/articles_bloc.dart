import 'dart:async';
import 'package:rxdart/rxdart.dart';

import './articles.dart' show ArticlesRepository, Article;

class ArticlesBloc {
  final ArticlesRepository _repo;

  final _editingForm = BehaviorSubject<Article>();
  final _showErrors = BehaviorSubject<bool>();

  Stream<List<Article>> get items => _repo.getItems();
  Function(String) get getItem => _repo.getItem;
  Function(Article) get create => _repo.create;
  Function(Article) get update => _repo.update;
  Function(String) get delete => _repo.delete;
  Function(bool) get showError => _showErrors.sink.add;
  // editing
  Stream<Article> get changedItem => _editingForm.stream
      .transform(_validation)
      .doOnError((e) => this._showErrors.pipe(e));
  Function(Article) get changeItem => _editingForm.sink.add;
  Stream get hasError => _showErrors.stream;
  ArticlesBloc(this._repo) {}

  final _validation = StreamTransformer.fromHandlers(
    handleData: (Article input, EventSink<Article> sink) {
      var err = {};
      if (input?.title.contains("@")) {
        err['title'] = "title is not correct";
      }
      if (input?.body.contains("@")) {
        err['body'] = "body is not correct";
      }

      if (err.isEmpty) {
        sink.add(input);
      } else {
        sink.addError("error ");
      }
      print("is error empty " + err.isEmpty.toString());
      print("input data : " + input.toString());
    },
  );
  dispose() {
    _editingForm.close();
  }
}
