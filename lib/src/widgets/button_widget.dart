import 'package:flutter/material.dart';

class PrimaryBtn extends StatefulWidget {
  Widget child;
  bool loadingIndecator = false;
  bool isLoading = false;

  final VoidCallback onPressed;

  PrimaryBtn({
    @required this.child,
    this.loadingIndecator,
    this.isLoading,
    @required this.onPressed,
  });

  _PrimaryBtnState createState() => _PrimaryBtnState();
}

class _PrimaryBtnState extends State<PrimaryBtn> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Theme.of(context).primaryColor,
      textColor: Theme.of(context).primaryColorLight,
      child: widget.isLoading ? CircularProgressIndicator() : widget.child,
      onPressed: widget.onPressed,
    );
  }
}
