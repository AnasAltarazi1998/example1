part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  String emailVal;
  String passwordVal;
  get email => emailVal;
  get password => passwordVal;
  SignInEvent({this.emailVal, this.passwordVal});
}
