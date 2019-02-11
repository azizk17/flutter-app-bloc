import 'package:flutter/material.dart';

class SyncErrorProvider extends InheritedWidget {
  const SyncErrorProvider({Key key, this.errors, @required Widget child})
      : assert(child != null),
        super(key: key, child: child);

  final Stream<Object> errors;

  static SyncErrorProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(SyncErrorProvider)
        as SyncErrorProvider;
  }

  @override
  bool updateShouldNotify(SyncErrorProvider old) => errors != old.errors;
}
