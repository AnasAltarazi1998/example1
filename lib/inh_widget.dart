import 'package:flutter/material.dart';

class BaseWidget extends InheritedWidget {
  BaseWidget({Key key, this.child}) : super(key: key, child: child);
  String email;
  String password;
  final Widget child;

  static BaseWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BaseWidget>();
  }

  @override
  bool updateShouldNotify(BaseWidget oldWidget) {
    return true;
  }
}
