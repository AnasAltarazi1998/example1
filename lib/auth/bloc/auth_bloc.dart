import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:example1/auth/services/auth_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthService authService;
  AuthBloc({this.authService}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield AuthInitial();
    if (event is SignInEvent) {
      yield SignInProcessing();
      dynamic cred = await authService.signInFun(
          email: event.emailVal, password: event.passwordVal);
      print(cred.toString());
      if (cred.toString().contains('id')) {
        SharedPreferences _sharedPref = await SharedPreferences.getInstance();
        Map<String, dynamic> data = json.decode(cred.toString());
        _sharedPref.setString('email', data['email']);
        _sharedPref.setString('password', data['password']);
        _sharedPref.setInt('id', data['id']);
        _sharedPref.setString('home', '/profile');
        yield SignInSuccessed();
      } else {
        yield SignInFaildState(errorMessage: cred.toString());
      }
    }
  }
}
