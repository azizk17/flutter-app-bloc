import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../utils.dart';

class ProgressIndecatorJedd extends StatelessWidget {
  final double size;
  const ProgressIndecatorJedd(this.size);
  @override
  Widget build(BuildContext context) {
    return Utils.isIOS
        ? CupertinoActivityIndicator(
            radius: this.size,
          )
        : CircularProgressIndicator();
  }
}
