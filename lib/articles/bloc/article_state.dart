part of 'article_bloc.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

// ignore: must_be_immutable
class SuccessedState extends ArticleState {
  ResponseModel responseModel;
  SuccessedState({this.responseModel});
}

class FaildState extends ArticleState {}
