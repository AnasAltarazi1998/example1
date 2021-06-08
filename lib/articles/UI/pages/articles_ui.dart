import 'package:example1/articles/UI/widgets/article_form.dart';
import 'package:example1/articles/bloc/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class Articles extends StatefulWidget {
  Articles({Key key}) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  void initState() {
    super.initState();
  }

  ArticleBloc articleBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleBloc>(
      create: (context) {
        articleBloc = ArticleBloc();
        articleBloc.add(InitEvent());
        return articleBloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('articles'),
          centerTitle: true,
        ),
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SuccessedState) {
              return ListView.builder(
                itemCount: state.responseModel.articles.length,
                itemBuilder: (context, i) => ArticleForm(
                  articleModel: state.responseModel.articles[i],
                ),
              );
            } else if (state is FaildState) {
              return Center(
                child: Text(
                  'Something Went Wrong',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              );
            } else {
              return Center(
                child: Text(
                  'unknown error',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => articleBloc.add(RefreshEvent()),
        ),
      ),
    );
  }
}
