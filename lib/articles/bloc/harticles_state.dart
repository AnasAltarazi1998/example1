part of 'harticles_bloc.dart';

@immutable
abstract class HarticlesState {}

class HarticlesInitial extends HarticlesState {}

class HSuccessedState extends HarticlesState {
  ResponseModel responseModel;
  HSuccessedState({this.responseModel});
}

class HfaildState extends HarticlesState {}

class HLoadingState extends HarticlesState {}
