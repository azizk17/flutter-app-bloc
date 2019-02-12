import 'package:flutter/material.dart';
import 'package:common/common.dart' show Article;

class EditArticleScreen extends StatelessWidget {
  EditArticleScreen({item: Article});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: EditArticleForm(),
    );
  }
}

class EditArticleForm extends StatefulWidget {
  _EditArticleFormState createState() => _EditArticleFormState();
}

class _EditArticleFormState extends State<EditArticleForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(),
    );
  }
}
