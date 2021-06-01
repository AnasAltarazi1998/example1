part of 'increment_bloc.dart';

@immutable
abstract class IncrementEvent {}

class IncrementImpl extends IncrementEvent {
  int i;

  IncrementImpl({this.i});

  @override
  get props => null;
}
