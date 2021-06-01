part of 'increment_bloc.dart';

@immutable
abstract class IncrementState {}

class IncrementInitial extends IncrementState {}

class Done extends IncrementState {
  int i;
  Done({this.i});
  get props => null;
}

class IncrementProcessing extends IncrementState {
  int i;
  IncrementProcessing({this.i});
  get props => null;
}
