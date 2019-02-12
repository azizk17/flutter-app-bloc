import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../../abstract/abstract.dart' show Model;
import '../serializers/serializers.dart';

part 'users_model.g.dart';

abstract class User implements Built<User, UserBuilder>, Model {
  static Serializer<User> get serializer => _$userSerializer;

  @nullable
  String get id;
  @nullable
  String get username;
  @nullable
  String get name;
  @nullable
  String get email;
  @nullable
  String get phone;
  @nullable
  String get createdAt;

  User._();
  factory User([updates(UserBuilder b)]) = _$User;

  Map<String, dynamic> toJson() {
    return standardSerializers.serialize(this,
        specifiedType: const FullType(User));
  }

  factory User.parseFirebase(dynamic doc) {
    User docWithoutDocumentID =
        standardSerializers.deserializeWith<User>(User.serializer, doc.data);
    //As the document ID is not in the Map, but an attribute of the Document I'll have to add it manually. Any way to fix this?
    var dockWithDocID =
        docWithoutDocumentID.rebuild((b) => b..id = doc.documentID);

    assert(dockWithDocID.id != null);
    return dockWithDocID;
  }
}
