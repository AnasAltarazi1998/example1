import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:example1/articles/models/ResponeModel.dart';
import 'package:example1/articles/services/article_service.dart';
import 'package:meta/meta.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleService articleService = ArticleService();
  ArticleBloc() : super(ArticleInitial());

  @override
  Stream<ArticleState> mapEventToState(
    ArticleEvent event,
  ) async* {
    yield ArticleInitial();
    try {
      ResponseModel responseModel = await articleService.fetchArticles();
      yield SuccessedState(responseModel: responseModel);
    } catch (e) {
      yield FaildState();
    }
  }
}
