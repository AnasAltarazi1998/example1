import 'package:example1/articles/UI/widgets/article_form.dart';
import 'package:example1/articles/UI/widgets/h_article_form.dart';
import 'package:example1/articles/bloc/article_bloc.dart';
import 'package:example1/articles/bloc/harticles_bloc.dart';
import 'package:example1/articles/models/articleModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  HarticlesBloc harticlesBloc;
  ArticleBloc articleBloc;
  Future<SharedPreferences> _initSharedPref() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArticleBloc>(create: (context) {
          articleBloc = ArticleBloc();
          articleBloc.add(InitEvent());
          return articleBloc;
        }),
        BlocProvider<HarticlesBloc>(create: (context) {
          harticlesBloc = HarticlesBloc();
          harticlesBloc.add(HInitEvent());
          return harticlesBloc;
        }),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('articles'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            BlocBuilder<ArticleBloc, ArticleState>(
              builder: (context, state) {
                if (state is ArticleInitial) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SuccessedState) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 75),
                      child: ListView.builder(
                        itemCount: state.responseModel.articles.length ?? 0,
                        itemBuilder: (context, i) => ArticleForm(
                          articleModel: state.responseModel.articles[i],
                        ),
                      ),
                    ),
                  );
                } else if (state is FaildState) {
                  return Center(
                    child: ElevatedButton(
                      child: Text('refresh'),
                      onPressed: () {
                        articleBloc.add(RefreshEvent());
                        harticlesBloc.add(HRefreshEvent());
                      },
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
            Container(
              alignment: Alignment.center,
              height: 75,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: BlocBuilder<HarticlesBloc, HarticlesState>(
                  builder: (context, state) {
                    if (state is HarticlesInitial || state is HLoadingState) {
                      return CircularProgressIndicator();
                    } else if (state is HSuccessedState) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (var i = 0;
                              i < state.responseModel.articles.length;
                              i++)
                            HArticleForm(
                              articleModel: state.responseModel.articles[i],
                            )
                        ],
                      );
                    } else if (state is HfaildState) {
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text('refresh'),
                          onPressed: () {
                            articleBloc.add(RefreshEvent());
                            harticlesBloc.add(HRefreshEvent());
                          },
                        ),
                      );
                    }
                    return Text('unknown error');
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Builder(
          builder: (ctxt) => FloatingActionButton(
            child: Icon(Icons.drag_indicator_sharp),
            onPressed: () => showBottomSheet(
              context: ctxt,
              builder: (bscontext) => Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text('refresh'),
                        onPressed: () {
                          articleBloc.add(RefreshEvent());
                          harticlesBloc.add(HRefreshEvent());

                          Navigator.pop(bscontext);
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        onPressed: () async {
                          SharedPreferences sharedPreferences =
                              await _initSharedPref();
                          sharedPreferences.clear();
                          Get.offAllNamed('/home');
                        },
                        child: Text('logout'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
