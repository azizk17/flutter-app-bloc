import 'package:common/common.dart' show Article, ArticlesService;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class ArticlesFirebase implements ArticlesService {
  /**
   *  
   *  * Handels server calls   
   * 
   */
  final String path = 'articles';

  // /**
  //  *
  //  * * Transformers
  //  */
  // // * Collecttion Transformer
  // final _itemsTransformer = StreamTransformer.fromHandlers(
  //     handleData: (QuerySnapshot q, EventSink<Map<String, Article>> sink) {
  //   Map<String, Article> map = {};
  //   q.documentChanges.forEach((d) {
  //     map[d.document.documentID] = Article.parseFirebase(d.document);
  //   });
  //   sink.add(map);
  // });

  // // * Single item Transformer
  // final _itemTransformer = StreamTransformer.fromHandlers(
  //   handleData: (DocumentSnapshot doc, EventSink<Article> sink) {
  //     Article item = Article.parseFirebase(doc);
  //     sink.add(item);
  //   },
  // );

  // TODO: write functions return type
  Observable<Article> getItem(String id) {
    var q = Firestore.instance
        .collection(this.path)
        .document(id)
        .snapshots()
        .map((doc) => Article.parseFirebase(doc));
    // .transform(_itemTransformer);
    return Observable(q);
  }

  Stream<List<Article>> getItems() {
    var q = Firestore.instance.collection(this.path).snapshots().map((q) {
      return q.documents.map((d) {
        return Article.parseFirebase(d);
      }).toList();
    });
    // .transform(_itemsTransformer);
    return q;
  }

  Future<void> create(Article data) {
    Future<void> item =
        Firestore.instance.collection(this.path).add(data.toJson());
    return item;
  }

  Future<void> update(Article data) {
    Future<void> item =
        Firestore.instance.document(data.id).updateData(data.toJson());
    return item;
  }

  Future<void> delete(Article data) {
    Future<void> item = Firestore.instance.document(data.id).delete();
    return item;
  }

  // _itemTransformer() {
  //   return ScanStreamTransformer(
  //     (Article item, DocumentSnapshot d, index) {
  //       item = Article.parseFirebase(d);
  //       return item;
  //       // cache[item.doucmnetID] = Article.parseFirebase(item.documnet);
  //     },
  //     Article(),
  //   );
  // }

  // _itemsTransformer() {
  //   return ScanStreamTransformer(
  //     (Map<String, Article> cache, QuerySnapshot q, index) {
  //       q.documentChanges.forEach((d) {
  //         cache[d.document.documentID] = Article.parseFirebase(d.document);
  //         return cache;
  //       });
  //       return cache;
  //       // cache[item.doucmnetID] = Article.parseFirebase(item.documnet);
  //     },
  //     <String, Article>{},
  //   );
  // }
}
