import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:example1/articles/bloc/article_bloc.dart';
import 'package:example1/articles/models/ResponeModel.dart';
import 'package:example1/articles/models/articleModel.dart';
import 'package:example1/articles/services/article_service.dart';
import 'package:meta/meta.dart';

part 'harticles_event.dart';
part 'harticles_state.dart';

class HarticlesBloc extends Bloc<HarticlesEvent, HarticlesState> {
  HarticlesBloc() : super(HarticlesInitial());
  ArticleService articleService = ArticleService();
  @override
  Stream<HarticlesState> mapEventToState(
    HarticlesEvent event,
  ) async* {
    yield HarticlesInitial();
    try {
      yield HLoadingState();
      ResponseModel responseModel = await articleService.fetchArticles();
      yield HSuccessedState(responseModel: responseModel);
    } catch (e) {
      yield HfaildState();
    }
  }
}
