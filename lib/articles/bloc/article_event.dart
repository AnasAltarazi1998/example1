part of 'article_bloc.dart';

@immutable
abstract class ArticleEvent {}

class InitEvent extends ArticleEvent {}

class RefreshEvent extends ArticleEvent {}
