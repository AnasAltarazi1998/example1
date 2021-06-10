part of 'harticles_bloc.dart';

@immutable
abstract class HarticlesEvent {}

class HRefreshEvent extends HarticlesEvent {}

class HInitEvent extends HarticlesEvent {}
