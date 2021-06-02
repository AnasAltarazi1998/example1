import 'package:example1/auth/bloc/auth_bloc.dart';
import 'package:example1/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class BaseWidget extends InheritedWidget {
  BaseWidget({Key key, this.child}) : super(key: key, child: child);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthBloc authBloc = AuthBloc(authService: AuthService());
  final Widget child;

  static BaseWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BaseWidget>();
  }

  @override
  bool updateShouldNotify(BaseWidget oldWidget) {
    return true;
  }
}
