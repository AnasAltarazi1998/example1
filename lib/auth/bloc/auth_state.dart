part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignInProcessing extends AuthState {}

class SignInSuccessed extends AuthState {}

class SignInFaildState extends AuthState {
  String errorMessage;
  SignInFaildState({this.errorMessage});
}
