part of 'increment_bloc.dart';

@immutable
abstract class IncrementState {}

class IncrementInitial extends IncrementState {}

class Done extends IncrementState {
  int i;
  dynamic response;
  Done({this.i, this.response});
  get props => null;
}

class IncrementProcessing extends IncrementState {
  int i;
  IncrementProcessing({this.i});
  get props => null;
}
