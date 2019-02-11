import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers/serializers.dart';

part 'articles_model.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;

  @nullable
  String get id;
  @nullable
  String get title;
  @nullable
  String get body;
  @nullable
  String get author;
  @nullable
  String get createdAt;

  Article._();
  factory Article([updates(ArticleBuilder b)]) = _$Article;

  Map<String, dynamic> toJson() {
    return standardSerializers.serialize(this,
        specifiedType: const FullType(Article));
  }

  factory Article.parseFirebase(dynamic doc) {
    Article docWithoutDocumentID = standardSerializers.deserializeWith<Article>(
        Article.serializer, doc.data);
    //As the document ID is not in the Map, but an attribute of the Document I'll have to add it manually. Any way to fix this?
    var dockWithDocID =
        docWithoutDocumentID.rebuild((b) => b..id = doc.documentID);

    assert(dockWithDocID.id != null);
    return dockWithDocID;
  }
}
